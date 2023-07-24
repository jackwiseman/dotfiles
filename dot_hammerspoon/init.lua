local hotkey = require "hs.hotkey"
local application = require "hs.application"

local function toggleAlacritty()
    local app = application.find("Alacritty")
    if app then
	if app:isFrontmost() then
	    app:hide()
	else
	    app:activate()
	end
    else
	application.launchOrFocus("/Applications/Alacritty.app")
    end
end

hotkey.bind({"alt"}, "space", toggleAlacritty)
