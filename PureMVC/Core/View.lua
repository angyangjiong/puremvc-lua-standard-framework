local View = class("View")
local instance

function View:ctor()
    assert(instance == nil , "View Singleton already constructed!")
    instance = self
    self.mediatorMap = {}
    self.observerMap = {}
    self:initializeView()
end

function View:initializeView()
end

function View.getInstance(viewFunc)
    if not instance and type(viewFunc) == "function" then
        instance = viewFunc()
    end
    return instance
end

function View:registerObserver(notificationName,observer)
    local observers = self.observerMap[notificationName]
    if not observers then
        observers = {}
        self.observerMap[notificationName] = observers
    end
    table.insert(observers,observer)
end

function View:notifyObservers(notification)
    local notificationName = notification:getName()
    local observers = self.observerMap[notificationName]
    if observers then
        for _,v in ipairs(observers) do
            v:notifyObserver(notification)
        end
    end
end

function View:removeObserver(notificationName, notifyContext)
    local observers = self.observerMap[notificationName]
    if not observers then
        return
    end
    for k,v in ipairs(observers) do
        if v:compareNotifyContext(notifyContext) then
            table.remove(observers,k)
            break
        end
    end
    if #observers == 0 then
        self.observerMap[notificationName] = nil
    end
end

function View:registerMediator(mediator)
    local mediatorName = mediator:getMediatorName()
    if not self:hasMediator(mediatorName) then
        self.mediatorMap[mediatorName] = mediator
        local interests = mediator:listNotificationInterests()
        if #interests > 0 then
            local observer = Puremvc.Observer.new(mediator.handleNotification , mediator)
            for _,v in ipairs(interests) do
                self:registerObserver(v,observer)
            end
        end
        mediator:onRegister()
    end
end

function View:retrieveMediator(mediatorName)
    return self.mediatorMap[mediatorName]
end

function View:removeMediator(mediatorName)
    local mediator = self:retrieveMediator(mediatorName)
    if mediator then
        local interests = mediator:listNotificationInterests()
        if #interests > 0 then
            for _,v in ipairs(interests) do
                self:removeObserver(v,mediator)
            end
        end
        self.mediatorMap[mediatorName] = nil
        mediator:onRemove()
    end
    return mediator
end

function View:hasMediator(mediatorName)
    return self:retrieveMediator(mediatorName) ~= nil
end

return View