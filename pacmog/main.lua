_G.love = require("love")
local width, height = love.graphics.getDimensions()

function love.load()
    _G.number = 0
    _G.mogger = {
    	x = 200,
    	y = 200,
		direction = nil,
		speed = 500,
		angle = 0,
    	has_eaten = false
	}
    love.graphics.setBackgroundColor(0.5, 0.5, 1)
end
local function moggerBorder(mogger)
	if mogger.x > width then
        mogger.x = 0
        mogger.has_eaten = false
	elseif mogger.x < 0 then
		mogger.x = width
		mogger.has_eaten = false
	elseif mogger.y > height then
		mogger.y = 0
		mogger.has_eaten = false
	elseif mogger.y < 0 then
		mogger.y = height
		mogger.has_eaten = false
	end
end
local function moggerDirection(mogger, key)
	if key == 'right' then
		mogger.direction = 'right'
		mogger.angle = 0
	elseif key == 'left' then
		mogger.direction = 'left'
		mogger.angle = math.pi
	elseif key == 'down' then
		mogger.direction = 'down'
		mogger.angle = math.pi / 2
	elseif key == 'up' then
		mogger.direction = 'up'
		mogger.angle = -math.pi / 2
	end
end

local function moggerMovement(mogger, dt)
	if mogger.direction == 'right' then
		mogger.x = mogger.x + (mogger.speed * dt)
	elseif mogger.direction == 'left' then
		mogger.x = mogger.x - (mogger.speed * dt)
	elseif mogger.direction == 'up' then
		mogger.y = mogger.y - (mogger.speed * dt)
	elseif mogger.direction == 'down' then
		mogger.y = mogger.y + (mogger.speed * dt)
	end
end

local function moggerUpdate(mogger, key)
	moggerDirection(mogger, key)
end

function love.update(dt)
	if mogger.x > width / 2 - 55 and mogger.x < width / 2 + 55 
		and mogger.y < height / 2 + 55 and mogger.y > height / 2 - 55 then
        mogger.has_eaten = true
    end
	moggerMovement(mogger, dt)
	moggerBorder(mogger)
end

function love.draw()
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 20, 20, width - 40, height - 40)
    love.graphics.setColor(1, 244 / 255, 0)
    love.graphics.arc("fill", mogger.x, mogger.y, 50, mogger.angle + 0.8, mogger.angle + 5.4)
    if not mogger.has_eaten then
        love.graphics.print("MOG", width / 2, height / 2)
    end
	love.graphics.print(tostring(mogger.x), 150, 50)
	love.graphics.print(tostring(mogger.y), 150, 60)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
    if key == 'f' then
        if love.window.getFullscreen() then
            love.window.setFullscreen(false, 'desktop')
        else
            love.window.setFullscreen(true, 'desktop')
        end
        width, height = love.graphics.getDimensions()
    end
	moggerUpdate(mogger, key)
end