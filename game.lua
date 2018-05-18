_H=display.viewableContentHeight
_W=display.viewableContentWidth
_G=0

healthvar=5
b=0



local blass=audio.loadSound("expo.mp3")

local blass2=audio.loadSound("games.mp3")
local bulletvar=0
local j=200
local composer = require "composer"
local scene = composer.newScene()
composer.removeHidden(true)

composer.purgeScene("game")
local physics = require "physics"
physics.start()
physics.setGravity(0,30)


function bbb()
composer.gotoScene("restart","flip",150)
end
function gameover()
timer.performWithDelay(250,bbb)
end







function sprite()

explosion.x=hero.x
explosion.y=hero.y
explosion.isVisible=true
explosion:play()
audio.play(blass)


end

function onbullethit(num)
  healthvar=healthvar-num
  if healthvar>1 then 
    health:setFrame(healthvar)
elseif healthvar<=0 then
    health:setFrame(healthvar)
    sprite()
    removehero()
    gameover()

end
end


function boom(self,event)


onbullethit(5)




end
function removehero()
  hero:removeSelf()
  hero=nil

end

function fastscroll(self,event)
  
if self.x<-200 then
     self.x=math.random(1600,2500)
     self.y=math.random(0,800)
else
     self.x=self.x-26
end
 


end

function scb(self,event)
_G=_G+1
score.text="score :".._G


end

function slowscroll(self,event)
if self.x<-150 then
     self.x=math.random(1600,2500)
     self.y=math.random(1,800)
else
     self.x=self.x-17
end
 
 if self.x<=1500 and self.x>1482 then
  bullet.x=1482
  bullet.y=self.y
  bulletvar=0
end
if hero then
if hero.y<-150 then
  hero.y=500
end
end
 end


function ttt(  )
  -- body
  if hero then
   hero:applyForce(0,-50,hero.x,hero,y)
 end
end


function activateengine(event)

 timer.performWithDelay(34,ttt)

end

function veryslow(self,event)

self.x=self.x-50


end


function ont(event)

  if hero then
if event.phase=="began" then

 Runtime:addEventListener("enterFrame",activateengine)
 print(b)
 b=b+1
elseif event.phase=="ended" then
  Runtime:removeEventListener("enterFrame",activateengine)
  print(b)
end
end
end

function scroll(self,event)

if self.x<-(_W-730) then
self.x=_W+730
else
  self.x=self.x-7
end


  -- body
end

function boom2(self,event)
local bb=430

  if bb>(j) then
onbullethit(1)
j=j+120
else
  bb=bb+5
end
end
function boom3(self,event)


 
onbullethit(1)

end
function boom4(self,event)
if bulletvar==0 then
  onbullethit(1)
end
bulletvar=1
  -- body
end



function scene:create(event)


 
      local screenGroup=self.view


      backgroundcolor=display.newRect(0,0,_W,_H)
      backgroundcolor:setFillColor(1,160,1000)
      screenGroup:insert(backgroundcolor)


      celing=display.newRect(0,0,_W,-40)
      physics.addBody(celing,"static",{bounce=0.04,friction=0.6})
      screenGroup:insert(celing)
      

      celing2=display.newRect(0,-2,_W,-40)
      physics.addBody(celing2,"static",{bounce=0.06,friction=0.6})
      screenGroup:insert(celing2)
	    

      background1=display.newImage("bg.png",100,30)
	    background1.height=_H
	    background1.width=_W
	    background1.x=730
      screenGroup:insert(background1)
	    

      background2=display.newImage("bg.png",_W+100,30)
	    background2.height=_H
	    background2.width=_W
	    background2.x=730+_W
      screenGroup:insert(background2)
      

      sheetdata =  {
          width=250,
          height=150,
          numFrames=4,
          sheetContentWidth = 1000,
          sheetContentHeight = 150,
     }

      sheet= graphics.newImageSheet( "yoo1.png", sheetdata )
      sequenceData = {
                {
           name="slow",
            start=1,
           count=4,
           time=400,
           loopCount=0
          },
          {
          name = "fast",
          frames={1,4},
           time=200,
           loopCount=0
          }
      } 

       hero = display.newSprite( sheet, sequenceData )
       hero.x=250
	    hero.y=250
     hero.height=140
     hero.width=240
     hero:play()
     physics.addBody(hero,"dynamic",{friction=0.2,smooth=2})
     screenGroup:insert(hero)

     sheetdata2={
     width=251,
     height=201,
     numFrames=5,
     sheetContentWidth=1255,
     sheetContentHeight=201
     }

    sheet2=graphics.newImageSheet("healthsprite.png",sheetdata2)


    sequenceData2 = {
                {
           name="slow",
            start=1,
           count=5,
           time=400,
           loopCount=0
          }
     } 



     health = display.newSprite(sheet2,sequenceData2)
     
     health.x=100
     health.y=150
     health:setFrame(5)
     
     screenGroup:insert(health)


     ground = display.newImage("ground.png",_W/4-50,_H-50)
     ground.width=_W+200
     ground.height=90
     physics.addBody(ground,"static",{friction=0.2,bounce=0.2})
          screenGroup:insert(ground)

     grass=display.newImage("grass.png",_W/4-40,_H-90)
     grass.width=_W+20
     grass.height=150
     screenGroup:insert(grass)
     


     enemy=display.newImage("enemy.png")
     enemy.x=math.random(1700,2000)
     enemy.y=math.random(100,700)
     enemy.width=200
     enemy.height=150
     physics.addBody(enemy,"static")
     screenGroup:insert(enemy)
  



  sheetdata3={
  width=295,
  height=290,
  sheetContentWidth=590,
  sheetContentHeight=580,
  numFrames=4
}
sheet3=graphics.newImageSheet("expo.png",sheetdata3)

sequenceData3={
  {
name="normal",
frames={1,2,3,4},
time=300,  
loopCount=1
}
}
explosion=display.newSprite(sheet3,sequenceData3)
explosion.isVisible=false
explosion.x=hero.x
     screenGroup:insert(explosion)

     benemy=display.newImage("blackenemy.png")
     benemy.x=math.random(4500,5000)
     benemy.y=math.random(100,700)
     benemy.width=200
     benemy.height=150
     physics.addBody(benemy,"static")
     screenGroup:insert(benemy)


bullet=display.newImage("bullet.png")
physics.addBody(bullet,"static")
bullet.isSensor=true
bullet.y=-200

     screenGroup:insert(bullet)


score=display.newText("score : 0",_W-320,0,"",50)
score:setReferencePoint(display.BottomLeftReferencePoint)
screenGroup:insert(score)


  print( "\n2: create event" )
_G=0
bulletvar=0


 end







function scene:show(event)




  local phase = event.phase
  
     if "did" == phase then

Runtime:addEventListener("touch",ont)
background1.enterFrame=scroll
background2.enterFrame=scroll
Runtime:addEventListener("enterFrame",background1)
Runtime:addEventListener("enterFrame",background2)
enemy.enterFrame=slowscroll
Runtime:addEventListener("enterFrame",enemy)
benemy.enterFrame=fastscroll
Runtime:addEventListener("enterFrame",benemy)
Runtime:addEventListener("enterFrame",scb)
enemy:addEventListener("collision",boom)
benemy:addEventListener("collision",boom)
bullet.enterFrame=veryslow
Runtime:addEventListener("enterFrame",bullet)
celing:addEventListener("collision",boom2)
celing2:addEventListener("collision",boom2)
ground:addEventListener("collision",boom3)
bullet:addEventListener("collision",boom4)
audio.play(blass2,{loops=1000})



print("2 show")
      end

end

function scene:hide(event)
  local phase = event.phase
  if "will" == phase then
  





Runtime:removeEventListener("touch",ont)
Runtime:removeEventListener("enterFrame",background1)
Runtime:removeEventListener("enterFrame",background2)
Runtime:removeEventListener("enterFrame",enemy)
Runtime:removeEventListener("enterFrame",benemy)
Runtime:removeEventListener("enterFrame",scb)
enemy:removeEventListener("collision",boom)
benemy:removeEventListener("collision",boom)
Runtime:removeEventListener("enterFrame",bullet)
celing:removeEventListener("collision",boom2)
celing2:removeEventListener("collision",boom2)
ground:removeEventListener("collision",boom3)
bullet:removeEventListener("collision",boom4)
audio.stop()

  Runtime:removeEventListener("enterFrame",activateengine)





end


end

function scene:destroy(event)


print("game scene destroyed")


end
scene:addEventListener("hide",scene)
scene:addEventListener("create",scene)
scene:addEventListener("show",scene)
scene:addEventListener("hide",scene)
scene:addEventListener("destroy",scene)

return scene