local songFinished = false

function onCreatePost()
    makeLuaText('bpsCounter', 'BeatsPerSection: 1/4', 300, 0, 190)
    setProperty('bpsCounter.x', 968)
    setProperty('bpsCounter.y', 235)     
    setTextSize('bpsCounter', 18)
    setTextAlignment('bpsCounter', 'right')
    
    setObjectCamera('bpsCounter', 'hud')
    addLuaText('bpsCounter')
end

function onUpdatePost(elapsed)
    if not songFinished and getSongPosition() < (songLength - 100) then
        local beatCounter = math.floor(curBeat % 4) + 1
        setTextString('bpsCounter', 'BeatsPerSection: ' .. beatCounter .. '/4')
    else
        songFinished = true
    end
end

function onEndSong()
    songFinished = true
    return Function_Continue
end