local textSize = 32
local peakRendered = 0
local upscrollY = 170
local downscrollY = 530

function onCreatePost()
    makeLuaText('renderedCounter', 'Rendered: 0/0', 500, 0, 0)
    setTextSize('renderedCounter', textSize)
    setProperties()
    
    screenCenter('renderedCounter', 'x')
    
    addLuaText('renderedCounter')
end

function onUpdatePost(elapsed)
    local currentRendered = 0
    local totalNotes = getProperty('notes.length')
    
    for i = 0, totalNotes - 1 do
        if getPropertyFromGroup('notes', i, 'exists') and not getPropertyFromGroup('notes', i, 'tooLate') then
            currentRendered = currentRendered + 1
        end
    end
    
    if currentRendered > peakRendered then
        peakRendered = currentRendered
    end
    
    setTextString('renderedCounter', 'Rendered: ' .. currentRendered .. '/' .. peakRendered)
end

function setProperties()
    setTextFont('renderedCounter', 'vcr.ttf')
    setTextAlignment('renderedCounter', 'center')
    setObjectCamera('renderedCounter', 'hud')

    if downscroll then
        setProperty('renderedCounter.y', downscrollY)
    else
        setProperty('renderedCounter.y', upscrollY)
    end
end