pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local ruled = require("ruled")
local menubar = require("menubar")

-- Warn about any error that occurs
naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
        message = message
    }
end)

-- Theme
beautiful.init(require("theme.default"))

-- Default Terminal
terminal = "kitty"
editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor

-- Autostart
require("modules.autostart")

-- Keybinds
modkey = "Mod4"
require("controls.mouse")
require("controls.global")
require("controls.client")

-- List of Layouts
tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        awful.layout.suit.tile,
 	awful.layout.suit.floating
    })
end)

-- Wallpaper
screen.connect_signal("request::wallpaper", function(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end)

-- Layout
require("layout.bartop")

-- Rules
require("rules")

-- Notifications
naughty.connect_signal("request::display", function(n)
    naughty.layout.box { notification = n }
end)

-- Focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)
