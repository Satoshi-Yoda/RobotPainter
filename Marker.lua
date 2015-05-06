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
	self.x = center_x
	self.y = center_y
	self.x = self.x + global.first.length * math.sin(global.first.a)
	self.y = self.y + global.first.length * math.cos(global.first.a)
	self.x = self.x + global.second.length * math.sin(global.first.a + global.second.a)
	self.y = self.y + global.second.length * math.cos(global.first.a + global.second.a)
	self.x = self.x + global.third.length * math.sin(global.first.a + global.second.a + global.third.a)
	self.y = self.y + global.third.length * math.cos(global.first.a + global.second.a + global.third.a)
	self.x = self.x + global.fourth.length * math.sin(global.first.a + global.second.a + global.third.a + global.fourth.a)
	self.y = self.y + global.fourth.length * math.cos(global.first.a + global.second.a + global.third.a + global.fourth.a)
end

function Marker:draw(camera)
	love.graphics.draw(Marker.IMAGE, self.x, self.y, 0, 1, 1, 10, 10)
end
