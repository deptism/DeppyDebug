function onCreatePost()
    makeLuaText('mustHitTxt', 'mustHitSection: false', screenWidth, 0, 260)
    setTextSize('mustHitTxt', 18)
    setTextAlignment('mustHitTxt', 'right')
    setObjectCamera('mustHitTxt', 'hud')
    addLuaText('mustHitTxt')
    
    setProperty('mustHitTxt.x', getProperty('mustHitTxt.x') - 10)
    
    setObjectOrder('mustHitTxt', 100)
end

function onUpdate(elapsed)
    if mustHitSection then
        setTextString('mustHitTxt', 'mustHitSection: true')
    else
        setTextString('mustHitTxt', 'mustHitSection: false')
    end
end