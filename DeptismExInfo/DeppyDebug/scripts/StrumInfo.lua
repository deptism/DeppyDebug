local textSize = 24
local screenPadding = 5

function onCreatePost()
    makeLuaText('strumGlowText', '[F F F F] [F F F F]', screenWidth, 0, 0)
    setTextSize('strumGlowText', textSize)
    setTextAlignment('strumGlowText', 'center')
    setObjectCamera('strumGlowText', 'hud')
    
    if downscroll then
        setProperty('strumGlowText.y', screenPadding)
    else
        setProperty('strumGlowText.y', screenHeight - textSize - screenPadding - 10)
    end
    
    addLuaText('strumGlowText')
end

function onUpdatePost(el)
    local enemyStr = "[ "
    local playerStr = "[ "
    
    for i = 0, 3 do
        -- Opponent strums
        local enemyAnim = getPropertyFromGroup('opponentStrums', i, 'animation.curAnim.name')
        if enemyAnim ~= nil and string.find(string.lower(enemyAnim), 'confirm') ~= nil then
            enemyStr = enemyStr .. "T"
        else
            enemyStr = enemyStr .. "F"
        end
        
        -- Player strums
        local playerAnim = getPropertyFromGroup('playerStrums', i, 'animation.curAnim.name')
        if playerAnim ~= nil and string.find(string.lower(playerAnim), 'confirm') ~= nil then
            playerStr = playerStr .. "T"
        else
            playerStr = playerStr .. "F"
        end

        if i < 3 then
            enemyStr = enemyStr .. " "
            playerStr = playerStr .. " "
        end
    end
    
    enemyStr = enemyStr .. " ]"
    playerStr = playerStr .. " ]"

    setTextString('strumGlowText', enemyStr .. " " .. playerStr)
end