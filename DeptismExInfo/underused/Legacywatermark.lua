function onCreatePost()
    -- hide botplay
    setProperty('botplayTxt.visible', false)

    -- engine, song and difficulty
    local leftStr = 'Psych Engine ' .. version .. ' | ' .. songName .. ' - ' .. difficultyName:upper()
    
    makeLuaText('engineWatermark', leftStr, 0, 10, screenHeight - 25)
    setTextSize('engineWatermark', 16)
    setTextAlignment('engineWatermark', 'left')
    setObjectCamera('engineWatermark', 'hud')
    addLuaText('engineWatermark')

    -- hud credit
    makeLuaText('hudCredit', 'Extra Infos by @mynamedeptismok', screenWidth, 0, 10)
    setTextSize('hudCredit', 16)
    setTextAlignment('hudCredit', 'right')
    setObjectCamera('hudCredit', 'hud')
    addLuaText('hudCredit')
    setProperty('hudCredit.x', getProperty('hudCredit.x') - 10)

    -- botplay text below hud credit
    makeLuaText('customBotplay', 'BOTPLAY', screenWidth, 0, getProperty('hudCredit.y') + 20)
    setTextSize('customBotplay', 16)
    setTextAlignment('customBotplay', 'right')
    setTextColor('customBotplay', 'FFFFFF')
    setObjectCamera('customBotplay', 'hud')
    addLuaText('customBotplay')
    setProperty('customBotplay.x', getProperty('customBotplay.x') - 10)
    setProperty('customBotplay.visible', false) -- Hidden by default

    -- mod directory
    local modName = currentModDirectory
    if modName == nil or modName == '' then
        modName = 'Main Game'
    end
    
    makeLuaText('psychWatermark', modName, screenWidth, 0, screenHeight - 25)
    setTextSize('psychWatermark', 16)
    setTextAlignment('psychWatermark', 'right')
    setObjectCamera('psychWatermark', 'hud')
    addLuaText('psychWatermark')
    
    setProperty('psychWatermark.x', getProperty('psychWatermark.x') - 10)
end

function onUpdatePost(elapsed)
    -- this is for the botplay txt below hud credit
    if botPlay then
        setProperty('customBotplay.visible', true)
    else
        setProperty('customBotplay.visible', false)
    end
end