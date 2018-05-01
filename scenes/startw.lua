

local widget = require('widget')
local composer = require('composer')
local scene = composer.newScene()


function scene:createScene(event )
	scene = self.view
	-- body
end

scene:addEventListener( "createScene", scene )
return scene