function onCreatePost()
    makeLuaText('songPercentText', '0.0%', 0, 0, 0)
    setTextSize('songPercentText', 24)
    setTextAlignment('songPercentText', 'left')
    setObjectCamera('songPercentText', 'hud')
    addLuaText('songPercentText')

    setProperty('songPercentText.x', 10)
    setProperty('songPercentText.y', 680)
end

function onUpdatePost(elapsed)
    local percent = (getSongPosition() / songLength) * 100

    if percent < 0 then percent = 0 end
    if percent > 100 then percent = 100 end

    setTextString('songPercentText', string.format("%.2f%%", percent))
end