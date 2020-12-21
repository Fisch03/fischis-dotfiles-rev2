-- Autostarts all required programs + compositor
local awful = require("awful")
local naughty = require("naughty")

local run_once = function(cmd)
    local findme = cmd
    local firstspace = cmd:find(' ')
    if firstspace then
        findme = cmd:sub(0, firstspace - 1)
    end
    awful.spawn.easy_async_with_shell(
        string.format('pgrep -u $USER -x %s > /dev/null || (%s)', findme, cmd),
        function(stdout, stderr)
            if not stderr or stderr == '' then
                return
            end
            naughty.notification({
                app_name = "Autostart",
                title = "<b>An error occured while autostarting applications</b>",
                message = stderr:gsub('%\n', ''),
                timeout = 20,
                icon = require('beautiful').awesome_icon
            })
        end
    )
end

run_once("picom -b --backend glx --experimental-backends")
run_once("playerctld daemon")
run_once("discord")
run_once("spotify")

