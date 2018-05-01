-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 local _S = {}
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
local relayout = require('relayout')
local composer = require('composer')
local _W, _H, _CX, _CY = relayout._W, relayout._H, relayout._CX, relayout._CY
local _SW,_SH = relayout._SW,relayout._SH   
local _setW, _setH = relayout._setW, relayout._setH
local _setX, _setY = relayout._setX, relayout._setY

local _backgroundset, _retB, _gohome
-- create()
local function setBar()

    local group = self.view
	--relayout.add(background)
	
    return group
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end

function _S.show()
    _backgroundset.isVisible = true
    _retB.isVisible = true
    _gohome.isVisible = true
end

function _S.hide()
    _backgroundset.isVisible = false
    _retB.isVisible = false
    _gohome.isVisible = false
end    

function _S.cret()
    _backgroundset = display.newImageRect('settingsBack.png', _W, _H - _SH*1.5)
    _backgroundset.x = _CX
    _backgroundset.y = _CY-_SH*0.7
    _backgroundset.isVisible = false

    _retB = display.newImageRect('retBack.png', _setW, _setH)
    _retB.x = _setX*1.5
    _retB.y = _setY*1.1
    _retB.isVisible = false
    _retB:addEventListener('touch',function(event)
        if (event.phase == 'ended') then
            print('fdsaforit')
            _S.hide()
        end
    end)

    _gohome = display.newImageRect('Home.png', _setW*1.2, _setH*1.2)
    _gohome.x = _setX*1.5
    _gohome.y = _setY*3
    _gohome.isVisible = false
    _gohome:addEventListener('touch',function( event )
        if (event.phase == 'ended') then
            _S.hide()
            composer.gotoScene("startw")
        end
    end)
end

return _S