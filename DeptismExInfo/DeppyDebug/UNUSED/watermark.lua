local fonts = {
    'font1.ttf',
    'font2.ttf',
    'font3.ttf',
    'font4.ttf'
}
local currentFontIndex = 1

function onCreatePost()
    -- hide botplay
    setProperty('botplayTxt.visible', false)

    -- engine, song and difficulty
    local leftStr = '' .. songName .. ' - ' .. difficultyName:upper()
    
    makeLuaText('engineWatermark', leftStr, 0, 10, screenHeight - 25)
    setTextSize('engineWatermark', 12)
    setTextAlignment('engineWatermark', 'left')
    setObjectCamera('engineWatermark', 'hud')
    addLuaText('engineWatermark')

    -- hud credit
    makeLuaText('hudCredit', 'HUD by @mynamedeptismok', screenWidth, 0, 10)
    setTextSize('hudCredit', 16)
    setTextAlignment('hudCredit', 'right')
    setObjectCamera('hudCredit', 'hud')
    addLuaText('hudCredit')
    
    if fonts[currentFontIndex] ~= nil and fonts[currentFontIndex] ~= '' then
        setTextFont('hudCredit', fonts[currentFontIndex])
    end
    
    setProperty('hudCredit.x', getProperty('hudCredit.x') - 10)

    -- botplay text below hud credit
    makeLuaText('customBotplay', 'BOTPLAY', screenWidth, 0, getProperty('hudCredit.y') + 20)
    setTextSize('customBotplay', 16)
    setTextAlignment('customBotplay', 'right')
    setTextColor('customBotplay', 'FFFFFF')
    setObjectCamera('customBotplay', 'hud')
    
    -- outline
    setTextBorder('customBotplay', 2, '000000')
    
    addLuaText('customBotplay')
    setProperty('customBotplay.x', getProperty('customBotplay.x') - 10)
    setProperty('customBotplay.visible', false) -- Hidden by default

    -- mod directory
    local modName = currentModDirectory
    if modName == nil or modName == '' then
        modName = 'Main Game'
    end
    
    makeLuaText('psychWatermark', modName, screenWidth, 0, screenHeight - 25)
    setTextSize('psychWatermark', 12)
    setTextAlignment('psychWatermark', 'right')
    setObjectCamera('psychWatermark', 'hud')
    addLuaText('psychWatermark')
    
    setProperty('psychWatermark.x', getProperty('psychWatermark.x') - 10)
end

function onSectionHit()
    if luaTextExists('hudCredit') then
        if curSection % 4 == 0 and curSection > 0 then
            currentFontIndex = currentFontIndex + 1
            if currentFontIndex > #fonts then
                currentFontIndex = 1
            end

            if fonts[currentFontIndex] ~= nil and fonts[currentFontIndex] ~= '' then
                setTextFont('hudCredit', fonts[currentFontIndex])
            end
        end
    end
end

local colorTimer = 0
function onUpdatePost(elapsed)
    -- this is for the botplay txt below hud credit
    if botPlay then
        setProperty('customBotplay.visible', true)

        local currentBPM = getPropertyFromClass('backend.Conductor', 'bpm') or bpm        
        local speedMultiplier = currentBPM / 100
        colorTimer = colorTimer + (elapsed * 5 * speedMultiplier)

        local r = math.floor(math.sin(colorTimer) * 127 + 128)
        local g = math.floor(math.sin(colorTimer - 2) * 127 + 128)
        local b = math.floor(math.sin(colorTimer - 4) * 127 + 128)

        local hexColor = string.format('%02X%02X%02X', r, g, b)
        setTextColor('customBotplay', hexColor)
        local shiftAmount = 0.5 
        local outlineR = math.floor(math.sin(colorTimer - shiftAmount) * 50 + 50)
        local outlineG = math.floor(math.sin(colorTimer - 2 - shiftAmount) * 50 + 50)
        local outlineB = math.floor(math.sin(colorTimer - 4 - shiftAmount) * 50 + 50)

        local hexOutline = string.format('%02X%02X%02X', outlineR, outlineG, outlineB)
        
        setTextBorder('customBotplay', 2, hexOutline)
    else
        setProperty('customBotplay.visible', false)
    end
end