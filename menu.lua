_W = display.viewableContentWidth
_H = display.viewableContentHeight

local composer = require "composer"
local scene = composer.newScene()
local widget = require "widget"
local buu=audio.loadSound("pushb.mp3")






composer.removeScene( "howtoplay", false )
composer.removeScene( "introduction", false )







function btngo(event)


composer.gotoScene("game")
audio.play(buu)

end

function intro(event)
composer.gotoScene("introduction")
audio.play(buu)
end


function yooyoo(event)
composer.gotoScene("howtoplay")
audio.play(buu)
end



function scene:create(event)


 local screenGroup = self.view
rect=display.newRect(-50,0,_W,_H)
rect:setFillColor(110,10,200)
screenGroup:insert(rect)
back=display.newImage("bg.jpg",405,270)
back.width=_W
back.height=_H
screenGroup:insert(back)

txt =display.newText("Plane Attack",_H/9,100,"",160)
screenGroup:insert(txt)
txt2 =display.newText("Start",_W-390,_H-130,"",100)
txt2:setFillColor(0,50,6)
screenGroup:insert(txt2)

yyy=0
txt:setFillColor(12,190,119)
txt.rotation=-25
back1=display.newImage("yoo.png",_W-400,_H/158)
back1.rotation=25
screenGroup:insert(back1)
btn=widget.newButton
{
	defaultFile="up.png",
	overFile="down.png"
}
btn.height=300
btn.width=320
btn.x=_W/1.1-150
btn.y=_H-250
screenGroup:insert(btn)




end


function scene:show(event)


		local phase = event.phase
	
	if "did" == phase then
		composer.removeScene("restart")
btn:addEventListener("tap",btngo)

back1:addEventListener("tap",intro)

end



end

function scene:hide(event)
		local phase = event.phase
	
	if "will" == phase then

btn:removeEventListener("tap",btngo)

back1:removeEventListener("tap",intro)

end
end

function scene:destroy(event)

end

scene:addEventListener("create",scene)
scene:addEventListener("show",scene)
scene:addEventListener("hide",scene)
scene:addEventListener("destroy",scene)

return scene