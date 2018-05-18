local composer = require "composer"
local scene = composer.newScene()
local buu=audio.loadSound("pushb.mp3")

_W = display.viewableContentWidth
_H = display.viewableContentHeight
composer.removeHidden(true)
composer.removeScene( "menu", false )




function yooyoo(event)
composer.gotoScene("howtoplay")
audio.play(buu)
end



function tapped(event)

	composer.gotoScene("menu")
	-- body  
	audio.play(buu)
end

function scene:create(event)
local screenGroup=self.view
yoo = display.newImage("bgg.jpg",-225,-95)
yoo.height=_H
yoo.width=_W
screenGroup:insert(yoo)

text=display.newText("INTRO......",400,20,"",150)
text:setFillColor(1000,22,2050)
image=display.newImage("logo2.jpg",500,250)
image.height=200
image.width=430
screenGroup:insert(text)
screenGroup:insert(image)

text3=display.newText("computer interactions",20,520,"",90)
screenGroup:insert(text3)
text2=display.newText("VIP is a series of  ",20,400,"",90)
text4=display.newText("for young one's to",20,640,"",90)
text5=display.newText("learn",20,760,"",90)
text3=display.newText("",20,520,"",90)
screenGroup:insert(text2)
screenGroup:insert(text4)
screenGroup:insert(text5)
screenGroup:insert(text3)


back1=display.newImage("yoo.png",_W-400,_H/2+0)
back1.rotation=23

screenGroup:insert(back1)





how = display.newImage("howto.png")

how.height=300
how.width=600
how.x=1250
how.y=200
	print( "\n1: create event")
screenGroup:insert(how)


end


function scene:show(event)
		local phase = event.phase
	
	if "did" == phase then
back1:addEventListener("tap",tapped)
how:addEventListener("tap",yooyoo)


print("intro show")

end
end

function scene:hide(event)
			local phase = event.phase
	
	if "will" == phase then
	audio.stop()
	back1:removeEventListener("tap",tapped)
	how:removeEventListener("tap",yooyoo)
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