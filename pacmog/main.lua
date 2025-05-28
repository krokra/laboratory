_G.love = require("love")
local width, height = love.graphics.getDimensions()

function love.load()
    _G.number = 0
    _G.mogger = {}
    mogger.x = 200
    mogger.y = 200
	mogger.direction = nil
	mogger.speed = 500
	mogger.angle = 0
    mogger.has_eaten = false
    love.graphics.setBackgroundColor(0.5, 0.5, 1)
end

function moggerMovement(mogger, key)
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

function moggerUpdate(mogger, key)
	moggerMovement(mogger, key)
    if mogger.x > width / 2 - 50 and mogger.x < width / 2 + 50 and mogger.y <= 300 and mogger.y >= 100 then
        mogger.has_eaten = true
    end
    if mogger.x > width then
        mogger.x = 0
        mogger.has_eaten = false
    end
end

function love.update(dt)
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

function love.draw()
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 20, 20, width - 40, height - 40)
    love.graphics.setColor(1, 244 / 255, 0)
    love.graphics.arc("fill", mogger.x, mogger.y, 50, mogger.angle + 0.8, mogger.angle + 5.4)
    if not mogger.has_eaten then
        love.graphics.print("MOG", width / 2, 200)
    end
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