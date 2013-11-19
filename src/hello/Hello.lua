--- Class definition with class name & parent object.
-- With no parent: mc.class("Hello")
Hello = mc.class("Hello", Object)

--- Include methods in SaysHello module.
-- This should give your object access to Hello:SayHello()
Hello:include(SaysHello)

--- Called on instantiation.
-- @usage var = Hello()
function Hello:initialize()
	self.hello = "No hello..."
end

--- Sets hello property to given string.
-- @param hello(string)
function Hello:SetHello(hello)
	self.hello = hello
end

--- @return hello(string)
function Hello:GetHello()
	return self.hello
end
