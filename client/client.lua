RegisterNUICallback('qw-textui:GetColorConfig', function(_, cb)
    local colors = Config.Colors
    cb(colors)
end)

function TextUI(message, messageType)

    if message == nil then message = "" end

    if messageType == nil then print('You are missing the messageType from TextUI') return end
    
    SendNUIMessage({
        action = 'addTextUI',
        data = {
            message = message,
            type = messageType
        }
    })
end

exports('TextUI', TextUI)

function HideTextUI()
    SendNUIMessage({
        action = 'hideTextUI',
        data = {}
    })
end

exports('HideTextUI', HideTextUI)