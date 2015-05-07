require "Segment"
require "Marker"
require "Converter"

global = {
	zero = {},
	first = {},
	second = {},
	third = {},
	marker = {},
	converter = {}
}

function love.load()
	love.window.setMode(1536, 1024, {resizable=false, vsync=true})
	love.graphics.setLineWidth(1)
	love.graphics.setBackgroundColor(200, 150, 100)
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
	global.zero.a, global.first.a, global.second.a, global.third.a = global.converter:convertAbsolute2(a, b)
end

function love.draw()
	global.zero:draw()
	global.second:draw()
	global.first:draw()
	global.third:draw()
	global.marker:draw()
end
