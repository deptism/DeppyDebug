local posY = 245
local offsetX = -10
local textSize = 18

function onCreatePost()
    makeLuaText('mustHitTxt', 'mustHitSection: false', screenWidth, 0, 0)
    setTextSize('mustHitTxt', textSize)
    setTextAlignment('mustHitTxt', 'right')
    setObjectCamera('mustHitTxt', 'hud')
    
    setProperty('mustHitTxt.x', getProperty('mustHitTxt.x') + offsetX)
    setProperty('mustHitTxt.y', posY)
    
    setObjectOrder('mustHitTxt', 100)
    addLuaText('mustHitTxt')
end

function onUpdate(elapsed)
    if mustHitSection then
        setTextString('mustHitTxt', 'mustHitSection: true')
    else
        setTextString('mustHitTxt', 'mustHitSection: false')
    end
end