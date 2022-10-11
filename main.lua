function love.load()
    target = {}
    target.x = love.graphics.getWidth() / 2
    target.y = love.graphics.getHeight() / 2
    target.radius = 50

    pointer = {}
    pointer.x = love.graphics.getWidth() / 2
    pointer.y = love.graphics.getHeight() / 2
    pointer.radius = 5

    score = 0
    timer = 0

    gameFont = love.graphics.newFont(40)
end


function love.update(dt)
end


function love.draw()
    love.graphics.setColor(1,1,0)
    love.graphics.circle("fill", target.x, target.y, target.radius)

    love.graphics.setColor(1,0,0)
    love.graphics.circle("fill", pointer.x, pointer.y, pointer.radius)

    love.graphics.setColor(1,1,1)
    love.graphics.setFont(gameFont)
    love.graphics.print(score, 0, 0)
end


function love.mousepressed( x, y, button, istouch, presses )
    if button == 1 then
        local pointerTarget = distanceBetween(pointer.x, pointer.y, target.x, target.y)
        if pointerTarget < target.radius then
            local clicksound = love.audio.newSource("clicks.mp3", "static")
            score = score + 1
            love.audio.play(clicksound)
            target.x = math.random(target.radius, love.graphics.getWidth() - target.radius)
            target.y = math.random(target.radius, love.graphics.getHeight() - target.radius)
            love.mouse.setX(target.x)
            love.mouse.setY(target.y)
        end
    end
end


function distanceBetween(x1, y1, x2, y2)
    return math.sqrt( (x2 - x1)^2 + (y2 - y1)^2 )
end


function love.mousemoved( x, y, dx, dy, istouch )
    love.mouse.setRelativeMode(true)
    target.x = target.x - dx
    target.y = target.y - dy
end