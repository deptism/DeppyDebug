local maxCombo = 0

function onCreatePost()
    makeLuaText('comboCounter', '', 400, 10, 220) 
    setTextSize('comboCounter', 18)
    setTextAlignment('comboCounter', 'left')
    setObjectCamera('comboCounter', 'hud')
    addLuaText('comboCounter')
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    local curCombo = getProperty('combo')
    if curCombo > maxCombo then
        maxCombo = curCombo
    end
end

function onUpdatePost(elapsed)
    local isBotplay = getProperty('cpuControlled')

    if isBotplay then
        setProperty('comboCounter.visible', false)
    else
        setProperty('comboCounter.visible', true)
        
        local curCombo = getProperty('combo')
        setTextString('comboCounter', 'Combo: ' .. curCombo .. ' / ' .. maxCombo)
    end
end

function onGameOver()
    maxCombo = 0
end