local posX = 968
local posY = 220
local textSize = 18
local songFinished = false

function onCreatePost()
    makeLuaText('bpsCounter', 'BeatsPerSection: 1/4', 300, 0, 0)
    setTextSize('bpsCounter', textSize)
    setTextAlignment('bpsCounter', 'right')
    setObjectCamera('bpsCounter', 'hud')
    
    setProperty('bpsCounter.x', posX)
    setProperty('bpsCounter.y', posY)     
    
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