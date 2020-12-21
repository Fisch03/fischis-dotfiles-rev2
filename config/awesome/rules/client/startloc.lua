local awful = require("awful")
local ruled = require("ruled")

ruled.client.connect_signal("request::rules", function()
    ruled.client.append_rule {
        rule = { class =  "discord" },
        properties = { tag = screen[2].tags[2] }
    }
    ruled.client.append_rule {
	rule = { class = "Spotify" },
	properties = { tag = screen[2].tags[3] }
    }
end)
