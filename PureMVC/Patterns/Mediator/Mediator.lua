local Mediator = class("Mediator", Puremvc.Notifier)

function Mediator:ctor(mediatorName ,viewComponent)
    if not mediatorName then
        mediatorName = "Mediator"
    end
    self.mediatorName = mediatorName
    self.viewComponent = viewComponent
end

function Mediator:getMediatorName()
    return self.mediatorName
end

function Mediator:getViewComponent()
    return self.viewComponent
end

function Mediator:listNotificationInterests()
    return {}
end

function Mediator:handleNotification(notification)
end

function Mediator:onRegister()
end

function Mediator:onRemove()
end

return Mediator