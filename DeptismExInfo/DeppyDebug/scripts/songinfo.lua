local songFinished = false

local function format_thousands(v)
    local s = tostring(v)
    while true do  
        local k
        s, k = string.gsub(s, "^(-?%d+)(%d%d%d)", '%1,%2')
        if k == 0 then break end
    end
    return s
end

function onCreatePost()
    makeLuaText('songInfoTxt', '', 600, 10, 0)
    setTextSize('songInfoTxt', 18)
    setTextAlignment('songInfoTxt', 'left')
    setObjectCamera('songInfoTxt', 'hud')
    addLuaText('songInfoTxt')
    
    screenCenter('songInfoTxt', 'y')
end

function onUpdatePost()
    if not songFinished and getSongPosition() < (songLength - 100) then
        local sectionText = 'BPM: ' .. format_thousands(curBpm) .. ' | Section: ' .. format_thousands(curSection) .. '\nStep: ' .. format_thousands(curStep) .. ' | Beat: ' .. format_thousands(curBeat)
        setTextString('songInfoTxt', sectionText)
    else
        songFinished = true
    end
end

function onEndSong()
    songFinished = true
    return Function_Continue
end