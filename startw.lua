local composer = require( "composer" )
 
local scene = composer.newScene()
 
local relayout = require('relayout')
local widget = require('widget')

local bar = require("setBar")

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
	local _W, _H, _CX, _CY = relayout._W, relayout._H, relayout._CX, relayout._CY
	local _SW,_SH = relayout._SW,relayout._SH	
	local _setW, _setH = relayout._setW, relayout._setH
	local _setX, _setY = relayout._setX, relayout._setY

    local group = self.view
    local background = display.newImageRect(group,'back2.jpg', _W, _H)
    background.x = _CX
    background.y = _CY
	relayout.add(background)
	
	--[[
	local bottomGroup = display.newGroup()
	bottomGroup.x, bottomGroup.y = _CX, _H
	group:insert(bottomGroup)
	relayout.add(bottomGroup)
	--]]

	local ship = display.newImageRect(group, 'ship.jpg',_SW,_SH)
	ship.x = _CX
	ship.y = _H - _SH

	
	transition.to(ship, {time = 1300, x = _SW / 2 + 10})
	transition.to(ship, {
    time = 4000, 
    x = _W - _SW / 2 - 10,
    delay = 1300,
    iterations = -1,
    transition = easing.continuousLoop,
    })

    self.play = widget.newButton({
    	defaultFile = 'play.png',
    	overFile = 'play-over.png',
    	width = _W*0.4, height = _H*0.2,
    	x = _CX, y = _H*0.7,
    	onRelease = function()
    		---------------SOUNDS.PLAY
    		composer.gotoScene('game')
    	end
    })
	group:insert(self.play)
	relayout.add(self.play)


	self.settings = widget.newButton({
		defaultFile = "settings.png",
		overFile = "settings-over.png",
		width = _setW, height = _setH,
		x = _setX, y = _setY,
		onRelease = function()
			bar.show()
		end
	})
	self.settings.isRound = true
	group:insert(self.settings)
	relayout.add(self.settings)



    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
print(12312)
-- show()
function scene:show( event )
 
    local phase = event.phase
 	
    print(12)
    if ( phase == "did" ) then
        system.activate('controllerUserInteraction')
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local phase = event.phase
 	
    print(3)
    if ( phase == "will" ) then
        system.deactivate('controllerUserInteraction')
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
 
    end
end
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
-- -----------------------------------------------------------------------------------

--composer.gotoScene('vart')
return scene