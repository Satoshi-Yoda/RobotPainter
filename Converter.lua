Converter = {}
Converter.__index = Converter

Converter.BASE_X = 200
Converter.BASE_Y = 100
Converter.BASE_ANGLE = 0

Converter.ELEMENT_0_LENGTH = 128
Converter.ELEMENT_1_LENGTH = 218
Converter.ELEMENT_2_LENGTH = 223
Converter.ELEMENT_3_LENGTH = 360

function Converter.create()
	local new = {}
	setmetatable(new, Converter)

	return new
end

function Converter:convert1(x_in, y_in)
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

function Converter:convert2(x_in, y_in)
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
