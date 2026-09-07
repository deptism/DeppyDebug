function onCreatePost()
    setProperty('timeTxt.visible', false)

    makeLuaText('digitalTimer', '', 600, 0, 0)
    setTextSize('digitalTimer', 20) 
    setTextAlignment('digitalTimer', 'center')
    setObjectCamera('digitalTimer', 'hud')
    setTextBorder('digitalTimer', 1.5, '000000') 
    
    setProperty('digitalTimer.alpha', 0)
    
    addLuaText('digitalTimer', true)
    
    updateTimerPosition()
end

function onUpdatePost(elapsed)
    updateTimerPosition()

    if luaSpriteExists('timeBar') or getProperty('timeBar') ~= nil then
        setProperty('digitalTimer.alpha', getProperty('timeBar.alpha'))
    end

    local curr = getPropertyFromClass('backend.Conductor', 'songPosition')
    local total = getProperty('songLength')

    if curr < 0 then curr = 0 end
    if curr > total then curr = total end

    local timeLeft = total - curr

    setTextString('digitalTimer', formatTime(curr) .. ' / ' .. formatTime(total) .. ' / ' .. formatTime(timeLeft))
end

function updateTimerPosition()
    if luaSpriteExists('timeBar') or getProperty('timeBar') ~= nil then
        local barX = getProperty('timeBar.x')
        local barY = getProperty('timeBar.y')
        local barWidth = getProperty('timeBar.width')
        local barHeight = getProperty('timeBar.height')
        
        setProperty('digitalTimer.x', barX + (barWidth / 2) - 300)
        setProperty('digitalTimer.y', barY + (barHeight / 2) - (getProperty('digitalTimer.height') / 2) - 2)
    end
end

function formatTime(ms)
    local seconds = math.floor(ms / 1000)
    local minutes = math.floor(seconds / 60)
    local millis = math.floor((ms % 1000) / 10)
    
    return string.format("%d:%02d.%02d", minutes, math.max(0, seconds % 60), math.max(0, millis))
end