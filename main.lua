require "Segment"
require "Marker"
require "Converter"
require "Point"

global = {
	zero = {},
	first = {},
	second = {},
	third = {},
	marker = {},
	converter = {},
	area = {}
}

function love.load()
	love.window.setMode(1024, 1024, {resizable=false, vsync=true})
	love.graphics.setLineWidth(1)
	love.graphics.setBackgroundColor(150, 170, 170)
	math.randomseed(os.time())

	global.zero   = Segment.create(0)
	global.first  = Segment.create(1, global.zero)
	global.second = Segment.create(2, global.first)
	global.third  = Segment.create(3, global.second)
	global.marker = Marker.create()
	global.converter = Converter.create()
end

function love.update(dt)
	global.zero:update(dt)
	global.first:update(dt)
	global.second:update(dt)
	global.third:update(dt)
	global.marker:update(dt)

	local a, b = love.mouse.getPosition()
	global.zero.a, global.first.a, global.second.a, global.third.a = global.converter:convertRelative(a, b)

	if love.mouse.isDown("l") then
		local point = Point.create(global.marker.x, global.marker.y)
		table.insert(global.area, point)
	end
end

function love.draw()
	for key,value in pairs(global.area) do
    	value:draw()
	end

	global.zero:draw()
	global.second:draw()
	global.first:draw()
	global.third:draw()
	global.marker:draw()
end
