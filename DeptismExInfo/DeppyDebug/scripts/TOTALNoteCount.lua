local fontSize = 18
local posY = 245
local posX = 10 
local totalSongNotes = 0

function formatNumber(num)
    if num < 0 then return 0 end
    return getProperty('numberDelimit') and runHaxeCode('formatD('..num..')') or num
end

function formatPercent(val)
    local str = string.format("%.2f", val)
    str = str:gsub("%.?0+$", "")
    return str
end

function getTotalNotes()
    local count = runHaxeCode([[
        if (PlayState.instance.unspawnNotes != null) {
            return PlayState.instance.unspawnNotes.length;
        }
        return 0;
    ]])
    
    if count == nil or count == 0 then
        count = runHaxeCode([[
            var total:Int = 0;
            if (PlayState.SONG != null && PlayState.SONG.notes != null) {
                for (section in PlayState.SONG.notes) {
                    if (section != null && section.sectionNotes != null) {
                        total += section.sectionNotes.length;
                    }
                }
            }
            return total;
        ]])
    end

    return count or 0
end

function onCreatePost()
    makeLuaText("totalCounterTxt", "TotalNotes: 0 / 0 (0%)", 600, posX, posY)
    setTextSize("totalCounterTxt", fontSize)
    setTextAlignment("totalCounterTxt", "left")
    setObjectCamera("totalCounterTxt", "camHUD")
    addLuaText("totalCounterTxt")
end

function onUpdatePost(elapsed)
    local botPlay = getProperty('cpuControlled') or botPlay or getProperty('botplayTxt.visible')
    
    if botPlay then
        setProperty('scoreTxt.visible', false)

        if totalSongNotes == 0 then
            totalSongNotes = getTotalNotes()
        end

        setProperty('totalCounterTxt.visible', true)
        
        local playerHits = getProperty('combo') or 0
        local opponentHits = getProperty('opCombo') or 0
        local totalCount = playerHits + opponentHits
        
        local percentage = 0
        if totalSongNotes > 0 then
            percentage = (totalCount / totalSongNotes) * 100
        end
        
        local formattedCount = formatNumber(totalCount)
        local formattedTotal = formatNumber(totalSongNotes)
        local formattedPercent = formatPercent(percentage)
        
        setTextString('totalCounterTxt', 'TotalNotes: ' .. formattedCount .. ' / ' .. formattedTotal .. ' (' .. formattedPercent .. '%)')
    else
        setProperty('scoreTxt.visible', true)
        setProperty('totalCounterTxt.visible', false)
    end
end