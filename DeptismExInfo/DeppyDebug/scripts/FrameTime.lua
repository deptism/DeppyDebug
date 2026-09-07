local lastTime = 0

function onCreatePost()
    makeLuaText('frameTimeTxt', 'FrameTime: 0.000s', 400, 10, 295)
    setTextSize('frameTimeTxt', 18)
    setTextAlignment('frameTimeTxt', 'left')
    setObjectCamera('frameTimeTxt', 'camHUD')
    addLuaText('frameTimeTxt')
    
    lastTime = os.clock()
end

function onUpdatePost(elapsed)
    local currentTime = os.clock()    
    local frameTimeSec = currentTime - lastTime
    local formattedTime = string.format("%.3fs", frameTimeSec)
    
    setTextString('frameTimeTxt', 'FrameTime: ' .. formattedTime)

    lastTime = currentTime
end