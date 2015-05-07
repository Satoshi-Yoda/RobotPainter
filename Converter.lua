Converter = {}
Converter.__index = Converter

Converter.BASE_X = 200
Converter.BASE_Y = 100
Converter.BASE_ANGLE = 0 -- должен быть 0, xD

Converter.ELEMENT_0_LENGTH = 128
Converter.ELEMENT_1_LENGTH = 218
Converter.ELEMENT_2_LENGTH = 223
Converter.ELEMENT_3_LENGTH = 340

function Converter.create()
	local new = {}
	setmetatable(new, Converter)

	return new
end

function Converter:convertAbsolute1(x_in, y_in)
	a = x_in - Converter.BASE_X - Converter.ELEMENT_0_LENGTH * math.sin(Converter.BASE_ANGLE)
	b = y_in - Converter.BASE_Y - Converter.ELEMENT_0_LENGTH * math.cos(Converter.BASE_ANGLE)

	local l = Converter.ELEMENT_1_LENGTH
	local k = Converter.ELEMENT_2_LENGTH + Converter.ELEMENT_3_LENGTH

	x=-math.acos(((b*k*k*l*l)/(2*(a*a*k*k+b*b*k*k))-(a*a*b*k*k)/(2*(a*a*k*k+b*b*k*k))-(b*k*k*k*k)/(2*(a*a*k*k+b*b*k*k))-(b*b*b*k*k)/(2*(a*a*k*k+b*b*k*k))-(k*math.sqrt(a*a*a*a*a*a*(-k*k)-2*a*a*a*a*b*b*k*k+2*a*a*a*a*k*k*k*k+2*a*a*a*a*k*k*l*l-a*a*b*b*b*b*k*k+2*a*a*b*b*k*k*k*k+2*a*a*b*b*k*k*l*l-a*a*k*k*k*k*k*k+2*a*a*k*k*k*k*l*l-a*a*k*k*l*l*l*l))/(2*(a*a*k*k+b*b*k*k))+b)/l)
	y=-math.acos((a*a*b*k+math.sqrt(a*a*a*a*a*a*(-k*k)-2*a*a*a*a*b*b*k*k+2*a*a*a*a*k*k*k*k+2*a*a*a*a*k*k*l*l-a*a*b*b*b*b*k*k+2*a*a*b*b*k*k*k*k+2*a*a*b*b*k*k*l*l-a*a*k*k*k*k*k*k+2*a*a*k*k*k*k*l*l-a*a*k*k*l*l*l*l)+b*b*b*k+b*k*k*k-b*k*l*l)/(2*(a*a*k*k+b*b*k*k)))

	local angle0 = Converter.BASE_ANGLE
	local angle1 = -x
	local angle2 = x - y
	local angle3 = 0
	
	return angle0, angle1, angle2, angle3
end

function Converter:convertAbsolute2(x_in, y_in)
	a = x_in - Converter.BASE_X - Converter.ELEMENT_0_LENGTH * math.sin(Converter.BASE_ANGLE)
	b = y_in - Converter.BASE_Y - Converter.ELEMENT_0_LENGTH * math.cos(Converter.BASE_ANGLE)

	local l = Converter.ELEMENT_1_LENGTH + Converter.ELEMENT_2_LENGTH
	local k = Converter.ELEMENT_3_LENGTH

	x=-math.acos(((b*k*k*l*l)/(2*(a*a*k*k+b*b*k*k))-(a*a*b*k*k)/(2*(a*a*k*k+b*b*k*k))-(b*k*k*k*k)/(2*(a*a*k*k+b*b*k*k))-(b*b*b*k*k)/(2*(a*a*k*k+b*b*k*k))-(k*math.sqrt(a*a*a*a*a*a*(-k*k)-2*a*a*a*a*b*b*k*k+2*a*a*a*a*k*k*k*k+2*a*a*a*a*k*k*l*l-a*a*b*b*b*b*k*k+2*a*a*b*b*k*k*k*k+2*a*a*b*b*k*k*l*l-a*a*k*k*k*k*k*k+2*a*a*k*k*k*k*l*l-a*a*k*k*l*l*l*l))/(2*(a*a*k*k+b*b*k*k))+b)/l)
	y=-math.acos((a*a*b*k+math.sqrt(a*a*a*a*a*a*(-k*k)-2*a*a*a*a*b*b*k*k+2*a*a*a*a*k*k*k*k+2*a*a*a*a*k*k*l*l-a*a*b*b*b*b*k*k+2*a*a*b*b*k*k*k*k+2*a*a*b*b*k*k*l*l-a*a*k*k*k*k*k*k+2*a*a*k*k*k*k*l*l-a*a*k*k*l*l*l*l)+b*b*b*k+b*k*k*k-b*k*l*l)/(2*(a*a*k*k+b*b*k*k)))

	local angle0 = Converter.BASE_ANGLE
	local angle1 = -x
	local angle2 = 0
	local angle3 = x - y
	
	return angle0, angle1, angle2, angle3
end

function Converter:getPositionForAngles(a0, a1, a2, a3, count)
	local x, y
	x = Converter.BASE_X
	y = Converter.BASE_Y
	if count == nil or count >=1 then
		x = x + Converter.ELEMENT_0_LENGTH * math.sin(a0)
		y = y + Converter.ELEMENT_0_LENGTH * math.cos(a0)
		if count == nil or count >= 2 then
			x = x + Converter.ELEMENT_1_LENGTH * math.sin(a0 + a1)
			y = y + Converter.ELEMENT_1_LENGTH * math.cos(a0 + a1)
			if count == nil or count >= 3 then
				x = x + Converter.ELEMENT_2_LENGTH * math.sin(a0 + a1 + a2)
				y = y + Converter.ELEMENT_2_LENGTH * math.cos(a0 + a1 + a2)
				if count == nil or count >= 4 then
					x = x + Converter.ELEMENT_3_LENGTH * math.sin(a0 + a1 + a2 + a3)
					y = y + Converter.ELEMENT_3_LENGTH * math.cos(a0 + a1 + a2 + a3)
				end
			end
		end
	end
	return x, y
end

function Converter:convertRelative(x_in, y_in)
	local a0 = global.zero.a
	local a1 = global.first.a
	local a2 = global.second.a
	local a3 = global.third.a

	local x_old, y_old = self:getPositionForAngles(a0, a1, a2, a3)
	local x_base_3, y_base_3 = self:getPositionForAngles(a0, a1, a2, a3, 3)

	-- тут меняем a3

	local ox = x_old - x_base_3
	local oy = y_old - y_base_3
	local nx = x_in - x_base_3
	local ny = y_in - y_base_3

	local angle = math.acos((ox * nx + oy * ny)/(math.sqrt((ox*ox+oy*oy)*(nx*nx+ny*ny))))
	local sign = ox*ny - oy*nx
	if sign > 0 then
		angle = -math.abs(angle)
	else 
		angle =  math.abs(angle)
	end

	return a0, a1, a2, a3 + angle
end






















