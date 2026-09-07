local songFinished = false

function onCreatePost()
    makeLuaText('songInfoTxt', '', 400, 10, 0)
    setTextSize('songInfoTxt', 20)
    setTextAlignment('songInfoTxt', 'left')
    setObjectCamera('songInfoTxt', 'hud')
    addLuaText('songInfoTxt')
    
    screenCenter('songInfoTxt', 'y')
end

function onUpdatePost()
    if not songFinished and getSongPosition() < (songLength - 100) then
        local sectionText = 'BPM: ' .. curBpm .. '\nSection: ' .. curSection .. '\nStep: ' .. curStep .. '\nBeat: ' .. curBeat
        setTextString('songInfoTxt', sectionText)
    else
        songFinished = true
    end
end

function onEndSong()
    songFinished = true
    return Function_Continue
end