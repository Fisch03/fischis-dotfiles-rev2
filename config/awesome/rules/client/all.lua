local awful = require("awful")
local ruled = require("ruled")
local beautiful = require("beautiful")

ruled.client.connect_signal("request::rules", function()
    ruled.client.append_rule {
        id = "global",
        rule = {},
        properties = {
            focus = awful.client.focus.filter,
            raise = true,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen,
	    shape = beautiful.window_shape
        }
    }
end)
