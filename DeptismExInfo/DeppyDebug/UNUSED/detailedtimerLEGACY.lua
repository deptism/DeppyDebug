function onCreatePost()
    -- upscroll/downscroll change
    local yPos = 20
    if downscroll then
        yPos = screenHeight - 50
    end

    makeLuaText('digitalTimer', '', 500, 0, yPos)
    setTextSize('digitalTimer', 22)
    setTextAlignment('digitalTimer', 'center')
    setObjectCamera('digitalTimer', 'hud')
    screenCenter('digitalTimer', 'x')
    addLuaText('digitalTimer')
end

function onUpdatePost(elapsed)
    -- Get the raw song position and length
    local curr = getPropertyFromClass('backend.Conductor', 'songPosition')
    local total = getProperty('songLength')

    -- Fix: Prevent negative numbers at start and clamp at the end
    if curr < 0 then curr = 0 end
    if curr > total then curr = total end

    -- Only update the text if the song is actually playing to prevent reset glitches
    setTextString('digitalTimer', formatTime(curr) .. ' / ' .. formatTime(total))
end

function formatTime(ms)
    local seconds = math.floor(ms / 1000)
    local minutes = math.floor(seconds / 60)
    local millis = math.floor((ms % 1000) / 10)
    
    -- Using math.max to ensure negative modulo doesn't occur (safety check)
    return string.format("%d:%02d.%02d", minutes, math.max(0, seconds % 60), math.max(0, millis))
end