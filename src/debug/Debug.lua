Debug = mc.class("Debug", Object)

--- Initialize object.
function Debug:initialize(showDebug, showWarnings, showErrors)
	self.showUser = true
	self.showDebug = showDebug
	self.showWarnings = showWarnings
	self.showErrors = showErrors
	self.stack = List()
	self.logs = List()
	self.warnings = List()
	self.errors = List()

	if(d == nil) then d = self.Print end
end

--- Logs the message, outputs if showUser is enabled.
function Debug:User(message)
	local mes = Debug:Dump(message)
	self.stack:Add(mes)
	self.logs:Add(mes)
	--Debug:Write(mes)
	if (self.showUser) then d(mes) end
end

--- Logs the message, outputs if showDebug is enabled.
function Debug:Log(message)
	local mes = Debug:Dump(message)
	self.stack:Add(mes)
	self.logs:Add(mes)
	--Debug:Write(mes)
	if (self.showDebug) then d("Log: " .. mes) end
end

--- Logs the warning message, outputs if showWarnings is enabled.
function Debug:Warning(message)
	local mes = Debug:Dump(message)
	self.stack:Add(mes)
	self.warnings:Add(mes)
	--Debug:Write(mes)
	if (self.showWarnings) then d("Warning: " .. mes) end
end

--- Logs the error message, outputs if showErrors is enabled.
function Debug:Error(message)
	local mes = Debug:Dump(message)
	self.stack:Add(mes)
	self.errors:Add(mes)
	--Debug:Write(mes)
	if (self.showErrors) then d("Error: " .. mes) end
end

--- Writes massage to log file.
function Debug:Write(file, message)
	local file = io.open(file, "w")
	if file ~= nil then
		file:write(message)
		file:close()
	end
end

function Debug:Dump(obj)
	local text = ""

	if(type(obj) == "string") then
		text = obj
	elseif(Object:isInstanceOf(List, obj)) then
		text = "List"
	elseif(type(obj) == "table") then
		text = table.tostring(obj)
	else
		text = "Not list"
	end
	return text
end

--- Writes massage to log file.
function Debug:Print(message)
	print(message)
end

--- @return The string representation of the object.
function Debug:ToString()
	return self.stack:ToString()
end
