RegisterNUICallback('qw-textui:GetColorConfig', function(_, cb)
    local colors = Config.Colors
    cb(colors)
end)

---@param message string
---@param messageType any
---@param icon? string
function TextUI(message, messageType, icon)

    if message == nil then message = "" end

    if messageType == nil then print('You are missing the messageType from TextUI') return end
    
    SendNUIMessage({
        action = 'addTextUI',
        data = {
            message = message,
            type = messageType,
            icon = icon
        }
    })
end

exports('TextUI', TextUI)

function HideTextUI()
    SendNUIMessage({
        action = 'hideTextUI',
    })
end

exports('HideTextUI', HideTextUI)