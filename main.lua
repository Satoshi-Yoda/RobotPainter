require "Segment"
require "Marker"
require "Converter"
require "Point"
require "Rect"
-- require "luars232"

global = {
	zero = {},
	first = {},
	second = {},
	third = {},
	marker = {},
	converter = {},
	area = {},
	rect = {}
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

	-- 566 на 800 это A4
	global.rect = Rect.create(Converter.BASE_X + 258, Converter.BASE_Y - 50, 566*0.72, 800*0.72)
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

		-- where is baud rate?!
		-- local wserial = assert(io.open("/dev/tty.usbmodem1411", "w"))
		-- local wserial = assert(io.open("/dev/tty.Bluetooth-Modem", "w"))
		-- local wserial = assert(io.open("out.txt", "w"))
		-- wserial:write("G1 X10\n111")
		-- wserial:flush()
		-- wserial:close()
	end
end

function love.draw()
	global.rect:draw()

	for key,value in pairs(global.area) do
    	value:draw()
	end
	
	global.zero:draw()
	global.second:draw()
	global.first:draw()
	global.third:draw()
	global.marker:draw()
end
