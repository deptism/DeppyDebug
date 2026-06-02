function onCreatePost()
    makeLuaText('ytwatermark', '@mynamedeptismok', 0, 0, 0)
    setTextSize('ytwatermark', 32)
    setObjectCamera('ytwatermark', 'camOther')
    setProperty('ytwatermark.alpha', 0.5)
    
    addLuaText('ytwatermark')
    screenCenter('ytwatermark', 'xy')
end