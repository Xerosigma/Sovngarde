Timer = mc.class("Timer", Object)

--- Initialize variables.
function Timer:init()
	self.startTime = 0
	self.endTime = 0
	self.isTimerActive = false
end

--- Starts timer.
-- @param startTime(number)
function Timer:Start(startTime)
	self.startTime = startTime;
	self.isTimerActive = true
end

--- Stops timer.
-- @param startTime(number)
function Timer:Stop(endTime)
	self.endTime = endTime;
	self.isTimerActive = false
end

--- @return Seconds passed.
function Timer:SecondsPassed()
	return (self.endTime - self.startTime) / 1000
end

--- @return Is the timer running? (boolean)
function Timer:IsTimerActive()
	return self.isTimerActive
end

--- @return The string representation of the object.
function Timer:ToString()
	local text = string.format('\r\n  Started: %d', self.startTime) .. "\r\n"
	text = string.format('%s  Stopped: %d',text , self.endTime) .. "\r\n"
	return text
end
