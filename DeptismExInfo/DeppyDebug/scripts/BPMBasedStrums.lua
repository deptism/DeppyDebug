function calculateStrumFPS(targetBPM)
    return math.floor((targetBPM + 4) / 10)
end

function updateStrumFramerate(newBPM)
    local targetFPS = calculateStrumFPS(newBPM)
    
    for player = 0, 1 do
        for i = 0, 3 do
            local strumMember = 'strumLineNotes.members[' .. (player * 4 + i) .. ']'
            setProperty(strumMember .. '.animation.getByName("confirm").frameRate', targetFPS)
            
            if propertyExists(strumMember .. '.animation.getByName("pressed")') then
                setProperty(strumMember .. '.animation.getByName("pressed").frameRate', targetFPS)
            end
        end
    end
end

function onCreatePost()
    updateStrumFramerate(curBpm or bpm)
end

function onUpdate(elapsed)
    if lastBpm ~= curBpm then
        lastBpm = curBpm
        updateStrumFramerate(curBpm)
    end
end

function onBpmChange(newBpm)
    updateStrumFramerate(newBpm)
end