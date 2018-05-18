_W = display.viewableContentWidth
_H = display.viewableContentHeight

local gamea=audio.loadSound("gameo.mp3")
local composer = require "composer"
local scene = composer.newScene()


local score = require( "score" )

local widget = require "widget"
composer.removeHidden(true)



function yooyoo(event)

composer.removeScene( "game", false )
composer.gotoScene("menu")

end
function yooyooy()
	-- body
	best.text=" Best* :".._G
end


function sum(num)

	if _G>_B then
		score.set( _G )
        score.save()
		timer.performWithDelay(1000,yooyooy)

	end
score1.text="Score :".._G
	-- body
end



function scene:create(event)

      local screenGroup=self.view
scoreText = score.init({
   fontSize = 100,
   x = display.contentCenterX,
   y = 20,
   maxDigits = 7,
   leadingZeros = true,
   filename = "scorefile.txt",
})
scoreText.x=_W/10+20
scoreText.y=200
screenGroup:insert(scoreText)
_B = score.load()

if _B==nil then

_B=0

end




cool=display.newImage("cool.jpg",100,-60)
cool.height=_H
cool.width=_W
screenGroup:insert(cool)

back=display.newImage("go.png",222,-180)
back.width=_W-400
back.height=_H-40	
screenGroup:insert(back)



hello=widget.newButton
{
	defaultFile="re.png",
	overFile="redown.png"
}
hello.width=250
hello.height=250
hello.x=_W-250
hello.y=_H-250

screenGroup:insert(hello)
score1=display.newText("score : 0",_W/10+20,_H-200,"",100)
score1.rotation=-6
score1:setFillColor(9999100,10000,100)
screenGroup:insert(score1)
best=display.newText("Best :".._B,30,100,"",70)
best.rotation=-6
best:setFillColor(0,0,0)
screenGroup:insert(best)

	


end




function scene:show(event)

	local phase = event.phase
	if "did" == phase then

		composer.removeScene( "game",true )

hello:addEventListener("tap",yooyoo)
sum(score1)
audio.play(gamea)

end

end

function scene:hide(event)
		local phase = event.phase
	if "will" == phase then
	
	
	
hello:removeEventListener("tap",yooyoo)
audio.stop()
end
end

function scene:destroy(event)

end

scene:addEventListener("create",scene)
scene:addEventListener("show",scene)
scene:addEventListener("hide",scene)
scene:addEventListener("destroy",scene)

return scene