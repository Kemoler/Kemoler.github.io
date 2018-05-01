-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

--[[local loadingText = display.newText( "Loading...", display.contentCenterX, display.contentCenterY, nil, 20)
 
local vk = require("plugin_vk_direct")
 
local function vkListener( event )
    if event.method == "init" then
        if event.status == "success" then
            composer.gotoScene( "menu" )
            loadingText:removeSelf( )
        else
            loadingText.text = "VK Initialization error"
        end
    end
end
 
vk.init(vkListener)

]]

--display.setStatusBar( display.HiddenStatusBar )

display.setStatusBar(display.HiddenStatusBar)
system.activate('multitouch')
require('relayout')
local composer = require('composer')
composer.recycleOnSceneChange = true -- Automatically remove scenes from memory

--local S = require('setBar')
--local a = S['ccreat'] ()

local bar = require("setBar")
bar.cret()

composer.gotoScene("startw")