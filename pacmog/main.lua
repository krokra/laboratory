_G.love = require("love")
local width, height = love.graphics.getDimensions()
function MoggerUpdate(mogger)
    if mogger.x > width / 2 then
        mogger.has_eaten = true
    end
    if mogger.x > width then
        mogger.x = 0
        mogger.has_eaten = false
    end
end

function love.load()
    _G.number = 0
    _G.mogger = {}
    mogger.x = 200
    mogger.y = 200
    mogger.has_eaten = false
    love.graphics.setBackgroundColor(0.5, 0.5, 1)
end

function love.update(dt)
    mogger.x = mogger.x + 1
    MoggerUpdate(mogger)
end

function love.draw()
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 20, 20, width - 40, height - 40)
    love.graphics.setColor(1, 244 / 255, 0)
    love.graphics.arc("fill", mogger.x, mogger.y, 150, 0.8, 5.4)
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
end