-- Script by Diena1rah ;3c
-- Please do not redistribute!

-- ========== Avatar Variables ========== --

-- Robot Part Variables
local robot = models.Diena1rah.Robot
local rarmrobot = models.Diena1rah.Robot.RightArmRobot
local larmrobot = models.Diena1rah.Robot.LeftArmRobot
local rlegrobot = models.Diena1rah.Robot.RightLegRobot
local llegrobot = models.Diena1rah.Robot.LeftLegRobot
local headrobot = models.Diena1rah.Robot.HeadRobot
local bodyrobot = models.Diena1rah.Robot.BodyRobot

-- Avatar Part Variables
local root = models.Diena1rah.root
local body = models.Diena1rah.Body
local head = models.Diena1rah.Body.Head
local torso = models.Diena1rah.Body.Torso
local torsotop = models.Diena1rah.Body.Torso.Top
local torsobottom = models.Diena1rah.Body.Torso.Bottom
local larm = models.Diena1rah.Body.LeftArm
local larmtop = models.Diena1rah.Body.LeftArm.Top
local larmbottom = models.Diena1rah.Body.LeftArm.Bottom
local rarm = models.Diena1rah.Body.RightArm
local rarmtop = models.Diena1rah.Body.RightArm.Top
local rarmbottom = models.Diena1rah.Body.RightArm.Bottom
local lleg = models.Diena1rah.Body.LeftLeg
local llegtop = models.Diena1rah.Body.LeftLeg.Top
local llegbottom = models.Diena1rah.Body.LeftLeg.Bottom
local rleg = models.Diena1rah.Body.RightLeg
local rlegtop = models.Diena1rah.Body.RightLeg.Top
local rlegbottom = models.Diena1rah.Body.RightLeg.Bottom
local whiteeyes = models.Diena1rah.Body.Head.WhiteEyes
local reye = models.Diena1rah.Body.Head.RightEye
local leye = models.Diena1rah.Body.Head.LeftEye
local leyered = models.Diena1rah.Body.Head.LeftEyeRed

-- Avatar Accessory Variables
local axe = models.Diena1rah.Body.Torso.Axe
local goggles = models.Diena1rah.Body.Head.Goggles
local rope = models.Diena1rah.Body.Head.GogglesRope

-- World Displays
worldScreen = models.Diena1rah.cube

-- ========== Functions ========== --

-- Hiding Vanilla Armor and Models
vanilla_model.PLAYER:setVisible(false)
vanilla_model.ARMOR:setVisible(false)

-- Robot Parent Types
larmrobot:setParentType("Head")
rarmrobot:setParentType("Head") 
llegrobot:setParentType("Torso")
rlegrobot:setParentType("Torso")
headrobot:setParentType("Head")
bodyrobot:setParentType("Torso")
models.Diena1rah.Robot.BodyRobot.Center:setParentType("Head")

-- Model Parent Types
body:setParentType("Torso")
head:setParentType("Head")
larm:setParentType("LeftArm")
rarm:setParentType("RightArm")
lleg:setParentType("LeftLeg")
rleg:setParentType("RightLeg")
worldScreen:setParentType("World")
worldScreen:setPos(15, 0, 0)

-- Animations! Template used here, going to custom-build functions, later.
function events.tick()
  local crouching = player:getPose() == "CROUCHING"
  -- This is the same line of code from the previous example
  local walking = player:getVelocity().xz:length() > .01
  -- walking == true when moving, and walking == false when still (or going directly up/down as we excluded the y axis)
  local sprinting = player:isSprinting()
  -- If you want to find more player functions, check out the Player Global page


  --animations.Diena1rah.idle:setPlaying(not walking and not crouching)
 animations.Diena1rah.Walking:setPlaying(walking and not crouching and not sprinting)
  --animations.Diena1rah.sprint:setPlaying(sprinting and not crouching)
 -- animation.Diena1rah.crouch:setPlaying(crouching)
end

-- Toggle Figura Model :D
function toggleModel()
  if models.Diena1rah:getVisible() == true
  then
    vanilla_model.PLAYER:setVisible(true)
    vanilla_model.ARMOR:setVisible(true)
    models.Diena1rah:setVisible(false)
  else
    vanilla_model.PLAYER:setVisible(false)
    vanilla_model.ARMOR:setVisible(false)
    models.Diena1rah:setVisible(true)
  end
end

-- Hide Axe on Equip~
function events.item_render(item)
  if item.id == "minecraft:wooden_axe"
  then
    axe:setVisible(false)
  else
    axe:setVisible(true)
  end
end

-- Toggling Goggles!
function pings.toggleGoggles()
  if goggles:getPos() == vec(0, -3.5, 0)
      then goggles:setPos(0, 0, 0)
           rope:setPos(0, 0, 0)
      else goggles:setPos(0, -3.5, 0)
           rope:setPos(0, -3.5, 0)
    end
end

-- Toggling Robot!
function toggleRobot()
  if robot:getVisible() == false
  then
    robot:setVisible(true)
    body:setVisible(false)
    robot:setPos(0, 0, -9.5)
  else
    robot:setVisible(false)
    body:setVisible(true)
    robot:setPos(0, 0, 0)
  end
end

-- = WorldScreen Functions = --

-- Move Display World Position, to the player :D
function pings.MoveScreenToPlayer()
  if player:isLoaded()
  then
    PlayerPos = player:getPos()
    PlayerRot = player:getRot()
    worldScreen:setPos(PlayerPos*16):setRot(PlayerRot.x, PlayerRot.y*-1, PlayerRot.z)
  end
end

-- X Axis Precise Movement
function moveScreenPreciseX(dir)
  screenPos = worldScreen:getPos()
  if dir == 1 then worldScreen:setPos(screenPos.x+1, screenPos.y, screenPos.z) end
  if dir == -1 then worldScreen:setPos(screenPos.x-1, screenPos.y, screenPos.z) end
  screenPos = worldScreen:getPos()
end

-- Y Axis Precise Movement
function moveScreenPreciseY(dir)
  screenPos = worldScreen:getPos()
  if dir == 1 then worldScreen:setPos(screenPos.x, screenPos.y+1, screenPos.z) end
  if dir == -1 then worldScreen:setPos(screenPos.x, screenPos.y-1, screenPos.z) end
  screenPos = worldScreen:getPos()
end

-- Z Axis Precise Movement
function moveScreenPreciseZ(dir)
  screenPos = worldScreen:getPos()
  if dir == 1 then worldScreen:setPos(screenPos.x, screenPos.y, screenPos.z+1) end
  if dir == -1 then worldScreen:setPos(screenPos.x, screenPos.y, screenPos.z-1) end
  screenPos = worldScreen:getPos()
end


--WIP, ignore for now
function moveScreenPreciseYaw()

end

function moveSceenPrecisePitch()

end

function moveSCreenPreciseRoll()

end

-- Setting screen scale :3
function setScreenScale(dir)
  screenScale = worldScreen:getScale()
  if dir == 1 then worldScreen:setScale(screenScale+1) end
  if dir == -1 then worldScreen:setScale(screenScale-1) end
  screenScale = worldScreen:getScale()
end

-- Push the Client-Side screen to other Figura Users, this prevents the movements from spam pinging the Figura Backend
function pings.updateScreenPosition() screenScale = worldScreen:getScale() screenPos = worldScreen:getPos() worldScreen:setScale(screenScale) worldScreen:setPos(screenPos) end

-- Note: Needed for rendering correctly behind transparent objects: ':setPrimaryRenderType("CUTOUT")'

-- ========== Action Wheel! ========== --
-- The Action Wheel must be below any functions it calls!

-- Action Wheel Creation
local mainPage = action_wheel:newPage()
local secondPage = action_wheel:newPage()
action_wheel:setPage(mainPage)

-- Action Wheel Entries
mainPage:newAction():title("Goggles"):item("minecraft:golden_helmet"):hoverColor(120, 70, 70):onLeftClick(pings.toggleGoggles)
mainPage:newAction():title("Model"):item("minecraft:player_head"):hoverColor(130, 130, 130):onLeftClick(toggleModel)
mainPage:newAction():title("Robot"):item("minecraft:iron_block"):hoverColor(130, 130, 130):onLeftClick(toggleRobot)
mainPage:newAction():title("Screen Page"):item("minecraft:oak_sign"):onLeftClick(function () action_wheel:setPage(secondPage) end)
secondPage:newAction():title("MoveScreenX"):item("minecraft:red_concrete"):onScroll(moveScreenPreciseX)
secondPage:newAction():title("MoveScreenZ"):item("minecraft:blue_concrete"):onScroll(moveScreenPreciseZ)
secondPage:newAction():title("MoveScreenY"):item("minecraft:lime_concrete"):onScroll(moveScreenPreciseY)
secondPage:newAction():title("PushChanges/ToPlayer"):item("minecraft:arrow"):hoverColor(130, 130, 130):onLeftClick(pings.updateScreenPosition):onRightClick(pings.MoveScreenToPlayer)
secondPage:newAction():title("scaletest"):onScroll(setScreenScale)
secondPage:newAction():title("Back"):item("minecraft:emerald_block"):onLeftClick(function () action_wheel:setPage(mainPage) end)

-- ========== Misc. Functions and Features ========== --

-- Nameplate/List/Chat Formatting Functions
nameplate.ALL:setText(toJson({ -- This sets every nameplate (Player, Chat, Tab List) to the defined values.
  {text = " ${badges} Die", color = "#009999"},
  {text = "na1", color = "#00cccc"},
  {text = "rah", color = "#00ffff"},
}))
nameplate.ENTITY:setText(toJson({ -- This overwrites the above values, allowing for a custom Player nameplate.
  {text = "Di", color = "#009999"},
  {text = "en", color = "#00cccc"}, 
  {text = "a1 ${badges}", color = "#00ffff"},
  {text = "\n@diena1rah", color = "#888888"}
})):setOutline(true):setOutlineColor(vectors.hexToRGB("#262626")):setShadow(true):setBackgroundColor(0, 0, 0, 0)

-- Nameplate Colors!
-- Name Gradient Fade - V1 - "#3a6a7d #5296b1 #76d7fe"
-- Name Gradient Fade - V2 - "#009999 #00cccc #00ffff"
-- Discord Tag Color - "#888888"