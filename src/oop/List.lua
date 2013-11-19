List = mc.class("List", Object)

--- Initialize object.
function List:initialize(...)
	self.members = {}
	self.count = 0


	local args = {...}
	if(args ~= nil) then
		for k,v in pairs(args) do
			self:Add(v)
		end
	end
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
	self.members[index] = nil
end

--- Adds contents of a list to end of list.
-- @param list(List) - List to add.
function List:AddRange(list)
	for k,v in pairs(list) do
		self:Add(v)
	end
end

--- Clears list of all contents.
function List:Clear()
	self.members = {}
	self.count = 0
end

--- @return number of members in List.
-- TODO: Should simply get self.count.
-- TODO: Implement self.
function List:Count()
	local count = 0
	for k,v in pairs(self.members) do
		count = count + 1
	end
	return count
end

--- @return table of members in list.
function List:Members()
	return self.members
end

--- @return The string representation of the object.
function List:ToString()
	local result, done = {}, {}
	for k, v in ipairs( self.members ) do
		table.insert( result, table.val_to_str( v ) )
		done[ k ] = true
	end

	for k, v in pairs( self.members ) do
		if not done[ k ] then
			table.insert( result, table.key_to_str( k ) .. "=" .. table.val_to_str( v ) )
		end
	end
	return "{" .. table.concat( result, "," ) .. "}"
end

function table.val_to_str ( v )
	if "string" == type( v ) then
		v = string.gsub( v, "\n", "\\n" )
		if string.match( string.gsub(v,"[^'\"]",""), '^"+$' ) then
			return "'" .. v .. "'"
		end
		return '"' .. string.gsub(v,'"', '\\"' ) .. '"'
	else
		return "table" == type( v ) and table.tostring( v ) or tostring( v )
	end
end

function table.key_to_str ( k )
	if "string" == type( k ) and string.match( k, "^[_%a][_%a%d]*$" ) then
		return k
	else
		return "[" .. table.val_to_str( k ) .. "]"
	end
end

function table.tostring( tbl )
	local result, done = {}, {}
	for k, v in ipairs( tbl ) do
		table.insert( result, table.val_to_str( v ) )
		done[ k ] = true
	end

	for k, v in pairs( tbl ) do
		if not done[ k ] then
			table.insert( result, table.key_to_str( k ) .. "=" .. table.val_to_str( v ) )
		end
	end
	return "{" .. table.concat( result, "," ) .. "}"
end
