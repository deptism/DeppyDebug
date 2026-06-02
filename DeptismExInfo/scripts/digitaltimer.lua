function onCreatePost()
    -- upscroll/downscroll change
    local yPos = 20
    if downscroll then
        yPos = screenHeight - 50
    end

    makeLuaText('digitalTimer', '', 600, 0, yPos)
    setTextSize('digitalTimer', 22)
    setTextAlignment('digitalTimer', 'center')
    setObjectCamera('digitalTimer', 'hud')
    screenCenter('digitalTimer', 'x')
    addLuaText('digitalTimer')
end

function onUpdatePost(elapsed)
    local curr = getPropertyFromClass('backend.Conductor', 'songPosition')
    local total = getProperty('songLength')

    if curr < 0 then curr = 0 end
    if curr > total then curr = total end

    local timeLeft = total - curr

    setTextString('digitalTimer', formatTime(curr) .. ' / ' .. formatTime(total) .. ' / ' .. formatTime(timeLeft))
end

function formatTime(ms)
    local seconds = math.floor(ms / 1000)
    local minutes = math.floor(seconds / 60)
    local millis = math.floor((ms % 1000) / 10)
    
    return string.format("%d:%02d.%02d", minutes, math.max(0, seconds % 60), math.max(0, millis))
end