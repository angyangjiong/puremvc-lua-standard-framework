PureMVC              = PureMVC or {}
PureMVC.PACKAGE_NAME = "PureMVC"

require(PureMVC.PACKAGE_NAME .. ".oop")

PureMVC.Observer      = require(PureMVC.PACKAGE_NAME .. ".Patterns.Observer.Observer")
PureMVC.View          = require(PureMVC.PACKAGE_NAME .. ".Core.View")
PureMVC.Model         = require(PureMVC.PACKAGE_NAME .. ".Core.Model")
PureMVC.Controller    = require(PureMVC.PACKAGE_NAME .. ".Core.Controller")
PureMVC.Facade        = require(PureMVC.PACKAGE_NAME .. ".Patterns.Facade.Facade")
PureMVC.Notifier      = require(PureMVC.PACKAGE_NAME .. ".Patterns.Observer.Notifier")

PureMVC.Proxy         = require(PureMVC.PACKAGE_NAME .. ".Patterns.Proxy.Proxy")
PureMVC.Mediator      = require(PureMVC.PACKAGE_NAME .. ".Patterns.Mediator.Mediator")
PureMVC.MacroCommand  = require(PureMVC.PACKAGE_NAME .. '.Patterns.Command.MacroCommand')
PureMVC.SimpleCommand = require(PureMVC.PACKAGE_NAME .. '.Patterns.Command.SimpleCommand')
PureMVC.Notification  = require(PureMVC.PACKAGE_NAME .. ".Patterns.Observer.Notification")
