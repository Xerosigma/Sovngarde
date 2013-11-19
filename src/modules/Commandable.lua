Commandable =
{
	--- Calls OnCommand(string) on self.
	Eval = function(self, command)
		if(self.OnCommand ~= nil) then
			self:OnCommand(command)
		else
			debug:Error(self.class.name .. " does not implement method: OnCommand() of Commandable mixin.")
		end
	end
}
