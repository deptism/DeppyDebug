local speed = 200 -- Adjust this to change bouncing speed
local velocityX = 0
local velocityY = 0

function onCreatePost()
    makeLuaText('centerWatermark', '@yournamehere', 0, 0, 0)
    setTextSize('centerWatermark', 32)
    setObjectCamera('centerWatermark', 'camOther')
    setProperty('centerWatermark.alpha', 0.5)
    addLuaText('centerWatermark')
    
    screenCenter('centerWatermark', 'xy')

    local angles = {45, 135, -45, -135}
    local angle = angles[getRandomInt(1, #angles)]
    
    local rad = angle * (math.pi / 180)
    velocityX = math.cos(rad) * speed
    velocityY = math.sin(rad) * speed
end

function onUpdate(elapsed)
    local curX = getProperty('centerWatermark.x')
    local curY = getProperty('centerWatermark.y')
    local width = getProperty('centerWatermark.width')
    local height = getProperty('centerWatermark.height')

    local newX = curX + (velocityX * elapsed)
    local newY = curY + (velocityY * elapsed)

    if newX <= 0 then
        newX = 0
        velocityX = -velocityX
    elseif newX + width >= 1280 then
        newX = 1280 - width
        velocityX = -velocityX
    end

    if newY <= 0 then
        newY = 0
        velocityY = -velocityY
    elseif newY + height >= 720 then
        newY = 720 - height
        velocityY = -velocityY
    end

    setProperty('centerWatermark.x', newX)
    setProperty('centerWatermark.y', newY)
end