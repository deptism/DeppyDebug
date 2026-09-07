function onCreatePost()
    local currentSpeed = getProperty('songSpeed')
    local formattedSpeed = tonumber(string.format("%.2f", currentSpeed))

    makeLuaText('scrSpdText', 'ScrSpd: ' .. formattedSpeed, 400, 10, 320)
    setTextSize('scrSpdText', 18)
    setTextAlignment('scrSpdText', 'left')
    setObjectCamera('scrSpdText', 'camHUD')
    addLuaText('scrSpdText')
end

function onUpdatePost(elapsed)
    local currentSpeed = getProperty('songSpeed')
    local formattedSpeed = tonumber(string.format("%.2f", currentSpeed))

    setTextString('scrSpdText', 'ScrollSpeed: ' .. formattedSpeed)
end