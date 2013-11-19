Timer = mc.class("Timer", Object)

--- Initialize variables.
function Timer:initialize()
	self.startTime = -1
	self.endTime = -1
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

--- @return Hours passed. (number)
function Timer:HoursPassed()
	if(self.isTimerActive) then
		debug:Warning("Timer is still active. Stop before calling.")
	end
	local secondsPassed = self.endTime - self.startTime
	return math.floor(secondsPassed / 3600)
end

--- @return Minutes passed. (number)
function Timer:MinutesPassed()
	if(self.isTimerActive) then
		debug:Warning("Timer is still active. Stop before calling.")
	end
	local secondsPassed = self.endTime - self.startTime
	return math.floor(secondsPassed / 60)
end

--- @return Seconds passed.
function Timer:SecondsPassed()
	if(self.isTimerActive) then
		debug:Warning("Timer is still active. Stop before calling.")
	end
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