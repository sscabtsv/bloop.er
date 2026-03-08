-- HTTP Spy for Roblox
-- Place this BEFORE the target script you want to monitor
-- Logs all HTTP requests to workspace/HttpSpyLogs.txt

local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

-- Configuration
local CONFIG = {
    LOG_FILE = "HttpSpyLogs.txt",
    MAX_LOG_SIZE = 100000, -- Max characters before creating new file
    LOG_BODY = true,       -- Log request/response bodies (can be large)
    LOG_HEADERS = true,    -- Log headers
    CONSOLE_OUTPUT = true, -- Also print to console
}

-- Storage for logs
local logs = {}
local logCount = 0
local startTime = os.time()

-- Utility functions
local function getTimestamp()
    return os.date("%Y-%m-%d %H:%M:%S")
end

local function sanitizeForFile(str)
    if type(str) ~= "string" then return tostring(str) end
    -- Remove null bytes and other problematic chars
    return str:gsub("%z", ""):gsub("[\192-\255][\128-\191]*", "?")
end

local function truncateString(str, maxLen)
    if #str > maxLen then
        return str:sub(1, maxLen) .. "... [truncated]"
    end
    return str
end

local function formatHeaders(headers)
    if not headers then return "None" end
    local result = {}
    for k, v in pairs(headers) do
        table.insert(result, string.format("  %s: %s", tostring(k), tostring(v)))
    end
    return table.concat(result, "\n")
end

-- Main logging function
local function logHTTP(method, url, body, headers, response, isResponse)
    logCount = logCount + 1
    
    local entry = {
        index = logCount,
        timestamp = getTimestamp(),
        method = method or "UNKNOWN",
        url = url or "UNKNOWN",
        body = body,
        headers = headers,
        response = response,
        isResponse = isResponse,
        stack = debug.traceback("", 2):gsub("\n", "\n    "),
    }
    
    table.insert(logs, entry)
    
    -- Console output
    if CONFIG.CONSOLE_OUTPUT then
        print(string.format("[HTTP SPY] #%d | %s | %s | %s", 
            logCount, entry.timestamp, method, url))
    end
    
    -- Write to file periodically
    if logCount % 5 == 0 then
        writeLogsToFile()
    end
    
    return entry
end

-- Write accumulated logs to file
function writeLogsToFile()
    if #logs == 0 then return end
    
    local lines = {}
    
    -- Header for new file
    if logCount <= 5 then
        table.insert(lines, "=== HTTP SPY LOG ===")
        table.insert(lines, "Started: " .. getTimestamp())
        table.insert(lines, "PlaceId: " .. tostring(game.PlaceId))
        table.insert(lines, "JobId: " .. tostring(game.JobId))
        table.insert(lines, "UserId: " .. tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or "N/A"))
        table.insert(lines, string.rep("=", 50))
        table.insert(lines, "")
    end
    
    -- Process pending logs
    for _, entry in ipairs(logs) do
        table.insert(lines, string.format("--- Request #%d [%s] ---", entry.index, entry.timestamp))
        table.insert(lines, string.format("METHOD: %s", entry.method))
        table.insert(lines, string.format("URL: %s", entry.url))
        
        if CONFIG.LOG_HEADERS and entry.headers then
            table.insert(lines, "HEADERS:")
            table.insert(lines, formatHeaders(entry.headers))
        end
        
        if CONFIG.LOG_BODY and entry.body then
            local bodyStr = type(entry.body) == "string" and entry.body or HttpService:JSONEncode(entry.body)
            table.insert(lines, "BODY:")
            table.insert(lines, truncateString(sanitizeForFile(bodyStr), 2000))
        end
        
        if entry.response then
            table.insert(lines, "RESPONSE:")
            local respStr = type(entry.response) == "string" and entry.response or HttpService:JSONEncode(entry.response)
            table.insert(lines, truncateString(sanitizeForFile(respStr), 2000))
        end
        
        table.insert(lines, "CALL STACK:")
        table.insert(lines, entry.stack)
        table.insert(lines, string.rep("-", 50))
        table.insert(lines, "")
    end
    
    -- Clear processed logs
    logs = {}
    
    -- Append to file
    local content = table.concat(lines, "\n")
    local success, err = pcall(function()
        -- Read existing content if file exists
        local existing = ""
        pcall(function()
            existing = readfile(CONFIG.LOG_FILE) or ""
        end)
        
        -- Check size and rotate if needed
        if #existing > CONFIG.MAX_LOG_SIZE then
            -- Rename old file
            local backupName = "HttpSpyLogs_" .. os.time() .. ".txt"
            writefile(backupName, existing)
            existing = "-- Previous log rotated to: " .. backupName .. "\n\n"
        end
        
        writefile(CONFIG.LOG_FILE, existing .. content)
    end)
    
    if not success and CONFIG.CONSOLE_OUTPUT then
        warn("[HTTP SPY] Failed to write log: " .. tostring(err))
    end
end

-- ============================================
-- HOOKS - Intercept HTTP functions
-- ============================================

local originalEnv = getfenv()
local hookedFunctions = {}

-- Helper to safely hook a function
local function hookFunction(env, funcName, hook)
    local original = env[funcName]
    if original and type(original) == "function" then
        hookedFunctions[funcName] = original
        env[funcName] = hook
        return true
    end
    return false
end

-- 1. Hook game:HttpGet (most common)
hookFunction(game, "HttpGet", function(self, url, ...)
    local args = {...}
    local nocache = args[1] or false
    
    logHTTP("HttpGet", url, nil, nil, nil, false)
    
    -- Call original
    local success, result = pcall(function()
        return hookedFunctions["HttpGet"](self, url, ...)
    end)
    
    if success then
        logHTTP("HttpGet", url, nil, nil, result, true)
        return result
    else
        logHTTP("HttpGet", url, nil, nil, "ERROR: " .. tostring(result), true)
        error(result)
    end
end)

-- 2. Hook game:HttpGetAsync
hookFunction(game, "HttpGetAsync", function(self, url, ...)
    logHTTP("HttpGetAsync", url, nil, nil, nil, false)
    
    local success, result = pcall(function()
        return hookedFunctions["HttpGetAsync"](self, url, ...)
    end)
    
    if success then
        logHTTP("HttpGetAsync", url, nil, nil, result, true)
        return result
    else
        error(result)
    end
end)

-- 3. Hook game:HttpPost
hookFunction(game, "HttpPost", function(self, url, data, contentType, ...)
    logHTTP("HttpPost", url, data, {["Content-Type"] = contentType}, nil, false)
    
    local success, result = pcall(function()
        return hookedFunctions["HttpPost"](self, url, data, contentType, ...)
    end)
    
    if success then
        logHTTP("HttpPost", url, data, {["Content-Type"] = contentType}, result, true)
        return result
    else
        error(result)
    end
end)

-- 4. Hook game:HttpPostAsync
hookFunction(game, "HttpPostAsync", function(self, url, data, contentType, ...)
    logHTTP("HttpPostAsync", url, data, {["Content-Type"] = contentType}, nil, false)
    
    local success, result = pcall(function()
        return hookedFunctions["HttpPostAsync"](self, url, data, contentType, ...)
    end)
    
    if success then
        logHTTP("HttpPostAsync", url, data, {["Content-Type"] = contentType}, result, true)
        return result
    else
        error(result)
    end
end)

-- 5. Hook HttpService:JSONDecode (to catch decoded responses)
local httpService = game:GetService("HttpService")
local originalJSONDecode = httpService.JSONDecode

httpService.JSONDecode = function(self, jsonString, ...)
    -- Log what we're decoding (might be from an HTTP response)
    if type(jsonString) == "string" and #jsonString > 0 then
        -- Only log if it looks like JSON and is substantial
        if jsonString:sub(1, 1):match("[{%[]") and #jsonString > 100 then
            logHTTP("JSONDecode", "N/A", jsonString, nil, nil, false)
        end
    end
    
    return originalJSONDecode(self, jsonString, ...)
end

-- 6. Hook request (synapse/krnl/fluxus function)
if originalEnv.request then
    local originalRequest = originalEnv.request
    originalEnv.request = function(options, ...)
        local url = options.Url or options.url or "UNKNOWN"
        local method = options.Method or options.method or "GET"
        
        logHTTP(method, url, options.Body or options.body, options.Headers or options.headers, nil, false)
        
        local success, result = pcall(function()
            return originalRequest(options, ...)
        end)
        
        if success then
            logHTTP(method, url, options.Body or options.body, options.Headers or options.headers, result, true)
            return result
        else
            error(result)
        end
    end
end

-- 7. Hook syn.request (Synapse X specific)
if originalEnv.syn and originalEnv.syn.request then
    local originalSynRequest = originalEnv.syn.request
    originalEnv.syn.request = function(options, ...)
        local url = options.Url or options.url or "UNKNOWN"
        local method = options.Method or options.method or "GET"
        
        logHTTP("syn.request:" .. method, url, options.Body or options.body, options.Headers or options.headers, nil, false)
        
        local success, result = pcall(function()
            return originalSynRequest(options, ...)
        end)
        
        if success then
            logHTTP("syn.request:" .. method, url, options.Body or options.body, options.Headers or options.headers, result, true)
            return result
        else
            error(result)
        end
    end
end

-- 8. Hook http_request (Krnl/Fluxus)
if originalEnv.http_request then
    local originalHttpRequest = originalEnv.http_request
    originalEnv.http_request = function(options, ...)
        local url = options.Url or options.url or "UNKNOWN"
        local method = options.Method or options.method or "GET"
        
        logHTTP("http_request:" .. method, url, options.Body or options.body, options.Headers or options.headers, nil, false)
        
        local success, result = pcall(function()
            return originalHttpRequest(options, ...)
        end)
        
        if success then
            logHTTP("http_request:" .. method, url, options.Body or options.body, options.Headers or options.headers, result, true)
            return result
        else
            error(result)
        end
    end
end

-- 9. Hook loadstring to catch dynamic URLs
local originalLoadstring = originalEnv.loadstring
originalEnv.loadstring = function(src, ...)
    if type(src) == "string" then
        -- Check if this looks like a URL
        if src:match("^https?://") then
            logHTTP("loadstring:URL", src, nil, nil, nil, false)
        elseif src:match("HttpGet") or src:match("request") then
            -- Log loadstring that contains HTTP calls
            logHTTP("loadstring:Code", "Dynamic code with HTTP", src, nil, nil, false)
        end
    end
    
    return originalLoadstring(src, ...)
end

-- Auto-save on script destruction (game close)
game:GetService("CoreGui").ChildRemoved:Connect(function(child)
    if child.Name == "ScreenGui" then -- Approximation for script end
        writeLogsToFile()
    end
end)

-- Periodic save
task.spawn(function()
    while true do
        task.wait(10) -- Save every 10 seconds
        writeLogsToFile()
    end
end)

print("=== HTTP SPY LOADED ===")
print("Logging all HTTP requests to: " .. CONFIG.LOG_FILE)
print("Logs will be saved in your executor's workspace folder")
print("=======================")

-- Return the logger for manual use
return {
    getLogs = function() return logs end,
    save = writeLogsToFile,
    clear = function() logs = {} logCount = 0 end,
    getStats = function() return {count = logCount, startTime = startTime} end
}
