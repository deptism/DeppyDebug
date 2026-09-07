local posY = 270
local posX = 1080

local lastCamX = 0
local lastCamY = 0

function onCreatePost()
    makeLuaText('camVelLabels', "CamVelX:\nCamVelY:", 100, posX, posY)
    setTextSize('camVelLabels', 18)
    setTextAlignment('camVelLabels', 'right')
    setObjectCamera('camVelLabels', 'hud')
    addLuaText('camVelLabels')

    makeLuaText('camVelValues', "0\n0", 150, posX + 105, posY)
    setTextSize('camVelValues', 18)
    setTextAlignment('camVelValues', 'left')
    setObjectCamera('camVelValues', 'hud')
    addLuaText('camVelValues')

    lastCamX = getProperty('camGame.scroll.x')
    lastCamY = getProperty('camGame.scroll.y')
end

function onUpdatePost(elapsed)
    if elapsed <= 0 then return end

    local currentCamX = getProperty('camGame.scroll.x')
    local currentCamY = getProperty('camGame.scroll.y')

    local velX = (currentCamX - lastCamX) / elapsed
    local velY = (currentCamY - lastCamY) / elapsed

    setTextString('camVelValues', string.format("%d\n%d", math.floor(velX + 0.5), math.floor(velY + 0.5)))

    lastCamX = currentCamX
    lastCamY = currentCamY
end