Clock = mc.class("Clock", Object)

--- Initialize variables.
-- @param startTime(number) - Seoncds at start time.
function Clock:initialize(startTime)
	self.startTime = startTime
	self.secondsPassed = 0
end

--- Sets current seconds passed.
-- @param secondsPassed(number) - Current seconds passed.
function Clock:Update(secondsPassed)
	self.secondsPassed = secondsPassed
end

--- @return String of total time passed in hours, minutes, and seconds.
function Clock:TimePassed()
	return string.format('%d:%d:%d', self:HoursPassed(), self:MinutesPassed(), self:SecondsPassed())
end

--- @return Hours passed. (number)
function Clock:HoursPassed()
	return math.floor(self:SecondsPassed() / 3600)
end

--- @return Minutes passed. (number)
function Clock:MinutesPassed()
	return math.floor(self:SecondsPassed() / 60)
end

--- @return Seconds passed. (number)
function Clock:SecondsPassed()
	return self.secondsPassed - self.startTime	
end

--- @return The string representation of the object.
function Clock:ToString()
	local text = string.format('\r\n  Started: %d', self.startTime) .. "\r\n"
	text = string.format('%s  Passed: %d',text , self.secondsPassed) .. "\r\n"
	return text
end
