function onCreatePost()
    makeLuaText('songPercentText', '0.0%', screenWidth, 0, 0)
    setTextSize('songPercentText', 20)
    setTextAlignment('songPercentText', 'center')
    setObjectCamera('songPercentText', 'camHUD')
    addLuaText('songPercentText')

    if downscroll then
        setTextAlignment('songPercentText', 'center')
        setProperty('songPercentText.x', 10)
        setProperty('songPercentText.y', 600) 
    else

        setProperty('songPercentText.y', getProperty('timeBar.y') + 30)
    end
end

function onUpdatePost(elapsed)
    local percent = (getSongPosition() / songLength) * 100

    if percent < 0 then percent = 0 end
    if percent > 100 then percent = 100 end

    setTextString('songPercentText', string.format("%.1f%%", percent))

    if not downscroll then
        screenCenter('songPercentText', 'x')
    end
end