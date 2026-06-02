local customFont = 'wowzers.ttf' 

function onCreatePost()
    setProperty('healthBar.visible', false)
    setProperty('healthBarBG.visible', false)
    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)
    setTextFont('scoreTxt', customFont)

    if downscroll then
        setProperty('scoreTxt.y', 10) 
    else
        setProperty('scoreTxt.y', screenHeight - 40)
    end
end