Integer = Object:extends()

--- Initialize object.
-- @param integer
function Integer:init(int)
	self.int = int
end

--- @return Are the values equal?
function String:Equals(int)
	return self.int == int
end

--- @return The string representation of the object.
function Integer:ToString()
	return self.int
end
