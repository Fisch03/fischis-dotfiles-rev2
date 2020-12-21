local awful = require("awful")

local bar_top = require("layout.bartop")

-- Create all the bars and panels
screen.connect_signal("request::desktop_decoration", function(s)
    s.bar_top = bar_top(s)
end)

-- Hide bars when there is a fullscreen client
--[[
function update_bars()
    for s in screen do
        if (s.selected_tag) then
            s.bar_top.visible = not s.selected_tag.fullscreen_mode
        end
    end
end

tag.connect_signal("property::selected", function(t)
    update_bars()
end)

client.connect_signal("property::fullscreen", function(c)
    update_bars()
end)

client.connect_signal("unmanage", function(c)
    if c.fullscreen then
        c.screen.selected_tag.fullscreen_mode = false
        update_bars()
    end
end)
--]]
