local Controller = class("Controller")
local instance

function Controller:ctor()
    assert(instance == nil , "Controller Singleton already constructed!")
    instance = self
    self.commandMap = {}
    self:InitializeController()
end

function Controller:InitializeController()
    self.view = Puremvc.View.getInstance(function() return Puremvc.View.new() end)
end

function Controller.getInstance(controllerFunc)
    if not instance and type(controllerFunc) == "function" then
        instance = controllerFunc()
    end
    return instance
end

function Controller:hasCommand(notificationName)
    return self.commandMap[notificationName] ~= nil
end

function Controller:executeCommand(notification)
    local commandFunc = self.commandMap[notification:getName()]
    local commandInstance = commandFunc();
    commandInstance:execute(notification)
end

function Controller:registerCommand(notificationName,commandFunc)
    if not self:hasCommand(notificationName) then
        self.view:registerObserver(notificationName, Puremvc.Observer.new(self.executeCommand, self));
    end
    self.commandMap[notificationName] = commandFunc
end

function Controller:removeCommand(notificationName)
    if not self:hasCommand(notificationName) then
        return
    end
    self.view:removeObserver(notificationName , self)
    self.commandMap[notificationName] = nil
end

return Controller