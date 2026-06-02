local totalOffset = 0

local noteHits = 0



function onCreatePost()

    makeLuaText('avgMsDisplay', 'Avg: 0ms', 400, 10, 455)

    setTextSize('avgMsDisplay', 20)

    setTextAlignment('avgMsDisplay', 'left')

    setObjectCamera('avgMsDisplay', 'camHUD')

    addLuaText('avgMsDisplay')

end



function onUpdatePost(elapsed)

    -- Simply handle visibility here

    setProperty('avgMsDisplay.visible', not getProperty('cpuControlled'))

end



function goodNoteHit(id, direction, noteType, isSustainNote)

    -- Using getProperty('cpuControlled') is more reliable for Botplay check

    if not getProperty('cpuControlled') and not isSustainNote then

        -- Standard Psych Engine ms calculation

        local noteDiff = getPropertyFromGroup('notes', id, 'strumTime') - getSongPosition()

        local diff = math.abs(noteDiff)

        

        totalOffset = totalOffset + diff

        noteHits = noteHits + 1

        

        if noteHits > 0 then

            local avg = totalOffset / noteHits

            setTextString('avgMsDisplay', 'Avg: ' .. string.format("%.2f", avg) .. 'ms')

        end

    end

end

