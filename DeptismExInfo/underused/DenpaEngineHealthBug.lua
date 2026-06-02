local baseHealth = 1
local targetHealth = 1
local drainedThisFrame = 0
local notesHitThisFrame = 0

function opponentNoteHit(id, noteData, noteType, isSustainNote)
    if not isSustainNote then
        notesHitThisFrame = notesHitThisFrame + 1
    end
end

function onUpdatePost(elapsed)
    local currentHealth = getProperty('health')
    
    if notesHitThisFrame > 0 then
        baseHealth = currentHealth + drainedThisFrame
        
        local drainAmount = notesHitThisFrame * 0.02
        targetHealth = baseHealth - drainAmount
        
        if not getProperty('practiceMode') then
            if targetHealth < 0.02 then
                targetHealth = 0.02
            end
        end
        
        setProperty('health', targetHealth)
        drainedThisFrame = baseHealth - targetHealth
        notesHitThisFrame = 0
    else
        if drainedThisFrame > 0 then
            setProperty('health', getProperty('health') + drainedThisFrame)
            drainedThisFrame = 0
        end
    end
end