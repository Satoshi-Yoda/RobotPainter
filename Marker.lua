Marker = {}
Marker.__index = Marker

Marker.IMAGE = love.graphics.newImage("_pic/red-point.png")

function Marker.create()
	local new = {}
	setmetatable(new, Marker)

	new.x = 0
	new.y = 0

	return new
end

function Marker:update(dt)
	self.x = Converter.BASE_X
	self.y = Converter.BASE_Y
	self.x = self.x + global.zero.length   * math.sin(global.zero.a)
	self.y = self.y + global.zero.length   * math.cos(global.zero.a)
	self.x = self.x + global.first.length  * math.sin(global.zero.a + global.first.a)
	self.y = self.y + global.first.length  * math.cos(global.zero.a + global.first.a)
	self.x = self.x + global.second.length * math.sin(global.zero.a + global.first.a + global.second.a)
	self.y = self.y + global.second.length * math.cos(global.zero.a + global.first.a + global.second.a)
	self.x = self.x + global.third.length  * math.sin(global.zero.a + global.first.a + global.second.a + global.third.a)
	self.y = self.y + global.third.length  * math.cos(global.zero.a + global.first.a + global.second.a + global.third.a)
end

-- function Marker:getPositionForAngles(a1, a2, a3)
-- 	local x, y
-- 	x = center_x
-- 	y = center_y
-- 	x = x + global.first.length  * math.sin(0)
-- 	y = y + global.first.length  * math.cos(0)
-- 	x = x + global.second.length * math.sin(0 + a1)
-- 	y = y + global.second.length * math.cos(0 + a1)
-- 	x = x + global.third.length  * math.sin(0 + a1 + a2)
-- 	y = y + global.third.length  * math.cos(0 + a1 + a2)
-- 	x = x + global.fourth.length * math.sin(0 + a1 + a2 + a3)
-- 	y = y + global.fourth.length * math.cos(0 + a1 + a2 + a3)
-- 	return x, y
-- end

function Marker:draw(camera)
	love.graphics.draw(Marker.IMAGE, self.x, self.y, 0, 1, 1, 10, 10)
end
