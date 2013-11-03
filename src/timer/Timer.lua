Timer = LCS.class({})

--- Initialize variables.
-- @param startTime(number) - Seoncds at start time.
function Timer:init(startTime)
	self.startTime = startTime
	self.secondsPassed = 0
end

--- Sets current seconds passed.
-- @param secondsPassed(number) - Current seconds passed.
function Timer:Update(secondsPassed)
	self.secondsPassed = secondsPassed
end

--- @return String of total time passed in hours, minutes, and seconds.
function Timer:TimePassed()
	return string.format('%d:%d:%d', self:HoursPassed(), self:MinutesPassed(), self:SecondsPassed())
end

--- @return Hours passed. (number)
function Timer:HoursPassed()
	return math.floor(self:SecondsPassed() / 3600)
end

--- @return Minutes passed. (number)
function Timer:MinutesPassed()
	return math.floor(self:SecondsPassed() / 60)
end

--- @return Seconds passed. (number)
function Timer:SecondsPassed()
	return self.secondsPassed - self.startTime	
end

--- @return The string representation of the object.
function Timer:ToString()
	local text = string.format('\r\n  Started: %d', self.startTime) .. "\r\n"
	text = string.format('%s  Passed: %d',text , self.secondsPassed) .. "\r\n"
	return text
end
