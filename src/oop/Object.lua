Object = LCS.class({})

--- Initialize object.
-- @param string
function Object:init()
end

--- @return Are the values equal?
function Object:Equals(object)
	return ( self == object )
end

--- @return The string representation of the object.
function Object:ToString()
	return self
end
