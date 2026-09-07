local renderedFrames = 0

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
    makeLuaText('frameCounter', 'RenderedFrames: 0', 400, 10, 270)
    setTextSize('frameCounter', 18)
    setTextAlignment('frameCounter', 'left')
    setObjectCamera('frameCounter', 'hud')
    addLuaText('frameCounter')
end

function onUpdatePost(elapsed)
    renderedFrames = renderedFrames + 1
    
    setTextString('frameCounter', 'RenderedFrames: ' .. format_thousands(renderedFrames))
end