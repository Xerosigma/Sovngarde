Debug = Object:extends()

--- Initialize object.
function Debug:init(debug)
	self.debug = debug
	self.logs = List()
end

--- Logs the message, outputs if debug is enabled.
function Debug:Log(message)
	self.logs:Add("file.txt", message)
	--Debug:Write(message)
	if (self.debug) then d("Log: " .. message) end
end

--- Logs the message, outputs if debug is enabled.
function Debug:Write(file, message)
	local file = io.open(file, "w")
	if file ~= nil then
		file:write(message)
		file:close()
	end
end

--- @return The string representation of the object.
function Debug:ToString()
	return self.logs:ToString()
end
