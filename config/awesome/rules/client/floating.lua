local awful = require("awful")
local ruled = require("ruled")
        
ruled.client.connect_signal("request::rules", function()
    ruled.client.append_rule {
        id = "floating",
        rule_any = {
            instance = { "copyq", "pinentry" },
            name = {
                "Event Tester",
                "Discord Updater"
            },
            role = {
                "pop-up"
            }
        },
        properties = {floating = true}
    }
end)
