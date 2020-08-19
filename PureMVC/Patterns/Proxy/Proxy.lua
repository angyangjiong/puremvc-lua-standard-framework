local Proxy = class("Proxy", Puremvc.Notifier)

function Proxy:ctor(proxyName, data)
    if not proxyName then
        proxyName = "Proxy"
    end
    self.proxyName = proxyName
    self.data = data
end

function Proxy:onRegister()
end

function Proxy:onRemove()
end

function Proxy:getProxyName()
    return self.proxyName
end

function Proxy:getData()
    return self.data
end

return Proxy