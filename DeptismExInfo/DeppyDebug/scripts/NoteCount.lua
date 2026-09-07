-- this is only for h-slice because the lua takes the propertys from the engine's scoreTxt rather than goodNoteHit and opponmentNoteHit
local fontSize = 18
local posY = 220
local posX = 10 

function formatNumber(num)
    if num < 0 then return 0 end
    return getProperty('numberDelimit') and runHaxeCode('formatD('..num..')') or num
end

function onCreatePost()
    makeLuaText("noteCounterTxt", "Notes: 0 / 0", 500, posX, posY)
    setTextSize("noteCounterTxt", fontSize)
    setTextAlignment("noteCounterTxt", "left")
    setObjectCamera("noteCounterTxt", "camHUD")
    addLuaText("noteCounterTxt")
end

function onUpdatePost(elapsed)
    local botPlay = getProperty('cpuControlled') or botPlay or getProperty('botplayTxt.visible')
    
    if botPlay then
        setProperty('noteCounterTxt.visible', true)
        
        local playerHits = getProperty('combo') or 0
        local opponentHits = getProperty('opCombo') or 0
        
        local formattedPlayer = formatNumber(playerHits)
        local formattedOpponent = formatNumber(opponentHits)
        
        setTextString('noteCounterTxt', 'Notes: ' .. formattedOpponent .. ' / ' .. formattedPlayer)
    else
        setProperty('noteCounterTxt.visible', false)
    end
end