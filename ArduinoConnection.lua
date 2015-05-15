require "utils"

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
	self:divide(10, -2, 10, 0, 92, 90)
end

-- |x1 - x0| наибольший, 
function ArduinoConnection:divide(x0, x1, y0, y1, z0, z1)
	local delta_x = math.abs(x1 - x0)
	local delta_y = math.abs(y1 - y0)
	local delta_z = math.abs(z1 - z0)
	local sign_x = utils.math.sign(x1 - x0)
	local sign_y = utils.math.sign(y1 - y0)
	local sign_z = utils.math.sign(z1 - z0)
	local err_y = 0
	local err_z = 0
	local delta_err_y = delta_y
	local delta_err_z = delta_z
	local y = y0
	local z = z0
	for x = x0, x1, sign_x do
		print(x, y, z)
		err_y = err_y + delta_err_y
		err_z = err_z + delta_err_z
		if err_y + err_y >= delta_x then
			y = y + sign_y
			err_y = err_y - delta_x
		end
		if err_z + err_z >= delta_x then
			z = z + sign_z
			err_z = err_z - delta_x
		end
	end
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
	end

	self:normalizeAngles(a)

	for i=1,3 do
		if a[i]<0 then a[i]=0 end
		if a[i]>180 then a[i]=180 end
	end

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
