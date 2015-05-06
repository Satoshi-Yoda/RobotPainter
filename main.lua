require "Segment"
require "Marker"

center_x = 200
center_y = 100

global = {
	first = {},
	second = {},
	third = {},
	fourth = {},
	marker = {}
}

function love.load()
	love.window.setMode(1536, 1024, {resizable=false, vsync=true})
	love.graphics.setLineWidth(1)
	love.graphics.setBackgroundColor(200, 150, 100)
	math.randomseed(os.time())

	global.first  = Segment.create(0)
	global.second = Segment.create(1, global.first)
	global.third  = Segment.create(2, global.second)
	global.fourth = Segment.create(3, global.third)

	global.marker = Marker.create()
end

function love.update(dt)
	global.first:update(dt)
	global.second:update(dt)
	global.third:update(dt)
	global.fourth:update(dt)

	global.marker:update(dt)

	makeAngles()
end

function love.draw()
	global.first:draw()
	global.third:draw()
	global.second:draw()
	global.fourth:draw()

	global.marker:draw()
end

function makeAngles()
	local a, b = love.mouse.getPosition()
	a = a - center_x - global.first.length * math.sin(global.first.a)
	b = b - center_y - global.first.length * math.cos(global.first.a)

	-- local l = 218
	-- local k = 223 + 480

	-- x=-math.acos(((b*k*k*l*l)/(2*(a*a*k*k+b*b*k*k))-(a*a*b*k*k)/(2*(a*a*k*k+b*b*k*k))-(b*k*k*k*k)/(2*(a*a*k*k+b*b*k*k))-(b*b*b*k*k)/(2*(a*a*k*k+b*b*k*k))-(k*math.sqrt(a*a*a*a*a*a*(-k*k)-2*a*a*a*a*b*b*k*k+2*a*a*a*a*k*k*k*k+2*a*a*a*a*k*k*l*l-a*a*b*b*b*b*k*k+2*a*a*b*b*k*k*k*k+2*a*a*b*b*k*k*l*l-a*a*k*k*k*k*k*k+2*a*a*k*k*k*k*l*l-a*a*k*k*l*l*l*l))/(2*(a*a*k*k+b*b*k*k))+b)/l)
	-- y=-math.acos((a*a*b*k+math.sqrt(a*a*a*a*a*a*(-k*k)-2*a*a*a*a*b*b*k*k+2*a*a*a*a*k*k*k*k+2*a*a*a*a*k*k*l*l-a*a*b*b*b*b*k*k+2*a*a*b*b*k*k*k*k+2*a*a*b*b*k*k*l*l-a*a*k*k*k*k*k*k+2*a*a*k*k*k*k*l*l-a*a*k*k*l*l*l*l)+b*b*b*k+b*k*k*k-b*k*l*l)/(2*(a*a*k*k+b*b*k*k)))

	-- global.second.a = -x
	-- global.third.a = -y + x
	-- global.fourth.a = 0

	local l = 218 + 223
	local k = 480

	x=-math.acos(((b*k*k*l*l)/(2*(a*a*k*k+b*b*k*k))-(a*a*b*k*k)/(2*(a*a*k*k+b*b*k*k))-(b*k*k*k*k)/(2*(a*a*k*k+b*b*k*k))-(b*b*b*k*k)/(2*(a*a*k*k+b*b*k*k))-(k*math.sqrt(a*a*a*a*a*a*(-k*k)-2*a*a*a*a*b*b*k*k+2*a*a*a*a*k*k*k*k+2*a*a*a*a*k*k*l*l-a*a*b*b*b*b*k*k+2*a*a*b*b*k*k*k*k+2*a*a*b*b*k*k*l*l-a*a*k*k*k*k*k*k+2*a*a*k*k*k*k*l*l-a*a*k*k*l*l*l*l))/(2*(a*a*k*k+b*b*k*k))+b)/l)
	y=-math.acos((a*a*b*k+math.sqrt(a*a*a*a*a*a*(-k*k)-2*a*a*a*a*b*b*k*k+2*a*a*a*a*k*k*k*k+2*a*a*a*a*k*k*l*l-a*a*b*b*b*b*k*k+2*a*a*b*b*k*k*k*k+2*a*a*b*b*k*k*l*l-a*a*k*k*k*k*k*k+2*a*a*k*k*k*k*l*l-a*a*k*k*l*l*l*l)+b*b*b*k+b*k*k*k-b*k*l*l)/(2*(a*a*k*k+b*b*k*k)))

	global.second.a = -x
	global.third.a = 0
	global.fourth.a = x - y
end
