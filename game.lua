local composer = require( "composer" )
 
local scene = composer.newScene()
 
local relayout = require('relayout')
local widget = require('widget')
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

	
	--transition.to(ship, {time = 4000, x = _W - _SW / 2 - 10,  delay = 4000 ,iterations = 0,delta = true})
	--transition.to(ship, {time = 4000, x = _SW / 2 + 10, delay = 4000, iterations = 0, delta = true})
	--

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