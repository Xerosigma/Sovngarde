Object = mc.class("Object")

--- Initialize object.
function Object:initialize()
end

--- @return Are the objects equal?
-- @param Objec to compare.
function Object:Equals(object)
	return ( self == object )
end

--- @return The string representation of the object.
function Object:ToString()
	return self.class.name
end
