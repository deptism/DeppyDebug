local lastTime = 0

function onCreatePost()
    makeLuaText('frameTimeTxt', 'FrameTime: 0 ms', 300, 10, 285)
    setTextSize('frameTimeTxt', 20)
    setTextAlignment('frameTimeTxt', 'left')
    setObjectCamera('frameTimeTxt', 'camHUD')
    addLuaText('frameTimeTxt')
    
    lastTime = os.clock()
end

function onUpdatePost(elapsed)
    local currentTime = os.clock()
    
    local frameTimeMs = (currentTime - lastTime) * 1000
    
    local wholeMs = math.floor(frameTimeMs)
    
    setTextString('frameTimeTxt', 'FrameTime: ' .. wholeMs .. ' ms')

    lastTime = currentTime
end