local textSize = 28
local peakRendered = 0
local upscrollY = 170
local downscrollY = 530

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
    
    setTextString('renderedCounter', 'Rendered: ' .. format_thousands(currentRendered) .. '/' .. format_thousands(peakRendered))
end

function setProperties()
    setTextAlignment('renderedCounter', 'center')
    setObjectCamera('renderedCounter', 'hud')

    if downscroll then
        setProperty('renderedCounter.y', downscrollY)
    else
        setProperty('renderedCounter.y', upscrollY)
    end
end