Publisher =
{
	--- Calls Notify(table) on self.subcribers(List).
	-- @param self(Object) - Provided by middleclass.
	-- @param ...
	Publish = function(self, ...)
		local args = {...}

		if(self.subscribers == nil) then
			debug:Error(self.class.name .. " does not implement member: subscribers(List).")
		elseif(self.subscribers:Count() == 0) then
			debug:Warning(self.class.name .. " has no subscribers.")
		else
			for k,v in pairs(self.subscribers:Members()) do
				v:Notify(args)
			end
		end
	end
}

Subscriber =
{
	--- Calls update method on self. Called by Publisher.
	-- @param self(Object) - Provided by middleclass.
	-- @param args(table) - Arguments passed by publisher.
	Notify = function(self, args)
		if(self.Update ~= nil) then
			self:Update(args)
		else
			debug:Error(self.class.name .. " does not implement method: Update() of Subscriber mixin.")
		end
	end
}
