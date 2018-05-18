local composer = require "composer"
local scene = composer.newScene()
local buu=audio.loadSound("pushb.mp3")
local buu1=audio.loadSound("menus.mp3")

_W = display.viewableContentWidth
_H = display.viewableContentHeight

composer.removeScene( "menu", false )


function tapped(event)

	composer.gotoScene("menu")
	-- body  
	audio.play(buu)
end

function scene:create(event)
local screenGroup=self.view
yoo = display.newImage("howtoplay1.png",_W/2-370,_H/2-235)
yoo.height=_H
yoo.width=_W+10
screenGroup:insert(yoo)


back1=display.newImage("yoo.png",_W-1500,_H/2+150)
back1.rotation=23
back1.width=190
back1.height=190

screenGroup:insert(back1)
end


function scene:show(event)
		local phase = event.phase
	
	if "did" == phase then
back1:addEventListener("tap",tapped)
audio.play(buu1)
end
end

function scene:hide(event)
			local phase = event.phase
	
	if "will" == phase then
	audio.stop()
	back1:removeEventListener("tap",tapped)
end
end

function scene:destroy(event)
	-- body
end

scene:addEventListener("create",scene)
scene:addEventListener("show",scene)
scene:addEventListener("hide",scene)
scene:addEventListener("destroy",scene)

return scene