List = mc.class("List", Object)

--- Initialize object.
function List:initialize()
	self.members = {}
	self.count = 0
	self.EMPTY = "{[-|empty|-]}"
	self.beginning = self.count
end

--- Adds specified object to the list.
-- @param member - Item to add.
function List:Add(member)
	self.count = self.count + 1
	self.members[self.count] = member
end

--- Removes specified object from the list.
-- @param member - Item to remove.
function List:Remove(index)
	self.members[index] = self.EMPTY
end

--- @return The string representation of the object.
function List:ToString()
	local text = ""
	for k,v in pairs(self.members) do
		text = string.format("%s , %s", text , k)
	end
		--if self.members[k]:Equals( self.beginning ) then
	return text
end
