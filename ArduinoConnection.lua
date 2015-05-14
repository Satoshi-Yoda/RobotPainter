ArduinoConnection = {}
ArduinoConnection.__index = ArduinoConnection

function ArduinoConnection.create()
	local new = {}
	setmetatable(new, ArduinoConnection)

	new.port = nil
	new.pen = false

	return new
end

function ArduinoConnection:init()
	-- self.port = assert(io.open("out.txt", "w"))
	-- self.port:write("\n\n")
	-- self.port:flush()

	-- self.port:flush()
	-- self.port:close()
end

function ArduinoConnection:powerOn()

end

function ArduinoConnection:powerOff()

end

function ArduinoConnection:getAnglesString()
	local a = {}
	a[0] = global.zero.a
	a[1] = global.first.a
	a[2] = global.second.a
	a[3] = global.third.a

	for i=1,3 do
		a[i] = math.floor(a[i]*180/math.pi)
		-- if a[i]<0 then a[i]=0 end
		-- if a[i]>0 then a[i]=120 end
	end

	self:normalizeAngles(a)

	if self.pen then
		return "A" .. a[1] .. " B" .. a[2] .. " C" .. a[3] .. " Z90"
	else
		return "A" .. a[1] .. " B" .. a[2] .. " C" .. a[3] .. " Z110"
	end
end

function ArduinoConnection:normalizeAngles(a)
	local a_zero = 93
    local b_zero = 27
    local c_zero = 154

    a[1] = a_zero - a[1]
    a[2] = b_zero + a[2]
    a[3] = c_zero - a[3]
end

function ArduinoConnection:setAngles()
	self.port = assert(io.open("out.txt", "w"))
	self.port:write(self:getAnglesString())
	self.port:flush()
	self.port:close()
end
