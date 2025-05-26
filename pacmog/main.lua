_G.love = require("love")

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
    if mogger.x > 750 then
        mogger.has_eaten = true
    end
    if mogger.x > 1450 then
        mogger.x = 0
        mogger.has_eaten = false
    end
end

function love.draw()
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 20, 20, 1240, 680)
    love.graphics.setColor(1, 244 / 255, 0)
    love.graphics.arc("fill", mogger.x, mogger.y, 150, 0.8, 5.4)
    if not mogger.has_eaten then
        love.graphics.print("MOG", 750, 200)
    end

end