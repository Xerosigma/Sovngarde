--[[
	This is an example module / mixin.
	You can include the methods below in other
	objects with the below syntax:
	Hello:include(SaysHello)
	You can now Hello:SayHello() at runtime.
]]--
SaysHello =
{
	--- Calls self:GetHello() on the implementing object.
	SayHello = function(self)

		-- Below we check if the method exists.
		-- It's good practice to do so.
		if(self.GetHello ~= nil) then
			return self:GetHello()
		else
			debug:Error(self.class.name .. " does not implement method: GetHello() of SaysHello module.")
		end
	end
}

--[[
	The above patterns can be really useful when implementing
	methods like ToString() or ToJson().
]]--
