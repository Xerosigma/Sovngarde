String = mc.class("String", Object)

--- Initialize object.
-- @param string
function String:initialize(str)
	self.str = str
end

--- @return Are the values equal?
function String:Equals(str)
	return self.str == str
end

--- @return The string representation of the object.
function String:ToString()
	return self.str
end
