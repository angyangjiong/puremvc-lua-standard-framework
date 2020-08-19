local Observer = class("Observer")

function Observer:ctor(notifyMethod,notifyContext)
    self.notifyMethod = notifyMethod
    self.notifyContext = notifyContext
end

function Observer:getNotifyContext()
    return self.notifyContext
end

function Observer:notifyObserver(notification)
    if self.notifyMethod and type(self.notifyMethod) == "function" then
        self.notifyMethod(self.notifyContext , notification)
    end
end

function Observer:compareNotifyContext(notifyContext)
    return self.notifyContext == notifyContext
end

return Observer