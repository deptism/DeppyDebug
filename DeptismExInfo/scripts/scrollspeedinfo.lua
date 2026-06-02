function onCreatePost()

    makeLuaText('scrSpdText', 'ScrSpd: ' .. getProperty('songSpeed'), 400, 10, 315)

    setTextSize('scrSpdText', 20)

    setTextAlignment('scrSpdText', 'left')

    setObjectCamera('scrSpdText', 'camHUD')

    addLuaText('scrSpdText')

end



function onUpdatePost(elapsed)

    local currentSpeed = getProperty('songSpeed')

    setTextString('scrSpdText', 'ScrSpd: ' .. string.format("%.1f", currentSpeed))

end