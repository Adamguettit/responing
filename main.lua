-----------------------------------------------------------------------------------------
-- created by : adam
-- created on : april 19
-- main.lua
-- this makes a Character move
-----------------------------------------------------------------------------------------

local physics = require( "physics" )

physics.start()
physics.setGravity( 0, 25 ) 
physics.setDrawMode( "hybrid" )  

local leftWall = display.newRect( 0, display.contentHeight / 2, 1, display.contentHeight )
leftWall.strokeWidth = 3
leftWall:setFillColor( 0.5 )
leftWall:setStrokeColor( 1, 0, 0 )
leftWall.alpha = 0.0
physics.addBody( leftWall, "static", { 
    friction = 0.5, 
    bounce = 0.3 
    } )

local theGround = display.newImage( "./assets/sprites/land2.png" )
theGround.x = display.contentCenterX + 500
theGround.y = display.contentHeight - 100
theGround.id = "the ground"
physics.addBody( theGround, "static", { 
    friction = 0.2, 
    bounce = 0.3 
    } )

local flowting = display.newImage( "./assets/sprites/land.png" )
flowting.x = display.contentCenterX - 500
flowting.y = display.contentHeight - 600
flowting.id = "the ground"
physics.addBody( flowting, "static", { 
    friction = 0.5, 
    bounce = 0.3 
    } )



local dPad = display.newImage( "./assets/sprites/d-pad.png" )
dPad.x = 150
dPad.y = display.contentHeight - 200
dPad.id = "d-pad"

local upArrow = display.newImage( "./assets/sprites/upArrow.png" )
upArrow.x = 150
upArrow.y = display.contentHeight - 310
upArrow.id = "up arrow"

local downArrow = display.newImage( "./assets/sprites/downArrow.png" )
downArrow.x = 150
downArrow.y = display.contentHeight - 90
downArrow.id = "down arrow"

local leftArrow = display.newImage( "./assets/sprites/leftArrow.png" )
leftArrow.x = 40
leftArrow.y = display.contentHeight - 200
leftArrow.id = "left arrow"

local theCharacter = display.newImage( "./assets/sprites/ninga.png" )
theCharacter.x = display.contentCenterX - 400
theCharacter.y = display.contentCenterY - 400
theCharacter.id = "the character"
physics.addBody( theCharacter, "dynamic", { 
    density = 3.0, 
    friction = 0.5, 
    bounce = 0.3 
    } )
theCharacter.isFixedRotation = true 

local rightArrow = display.newImage( "./assets/sprites/rightArrow.png" )
rightArrow.x = 260
rightArrow.y = display.contentHeight - 200
rightArrow.id = "right arrow"

local jumpButton = display.newImage( "./assets/sprites/jumpButton.png" )
jumpButton.x = display.contentWidth -80
jumpButton.y = display.contentHeight - 250
jumpButton.id = "jump button"
jumpButton.alpha = 0.5
 
function upArrow:touch( event )
    if ( event.phase == "ended" ) then
         transition.moveBy( theCharacter, { 
        	x = 0, 
        	y = -50, 
        	time = 100
        	} )
    end

    return true
end

function downArrow:touch( event )
    if ( event.phase == "ended" ) then
         transition.moveBy( theCharacter, { 
        	x = 0, 
        	y = 50, 
        	time = 100 
        	} )
    end

    return true
end

function leftArrow:touch( event )
    if ( event.phase == "ended" ) then
         transition.moveBy( theCharacter, { 
        	x = -50 , 
        	y = 0, 
        	time = 100 
        	} )
    end

    return true
end

function rightArrow:touch( event )
    if ( event.phase == "ended" ) then
         transition.moveBy( theCharacter, { 
        	x = 50, 
        	y = 0, 
        	time = 100
        	} )
    end

    return true
end

function jumpButton:touch( event )
    if ( event.phase == "ended" ) then
        -- make the character jump
        theCharacter:setLinearVelocity( 0, -750 )
    end

    return true
end

function checkCharacterPosition( event )
    
    if theCharacter.y > display.contentHeight + 500 then
        theCharacter.x = display.contentCenterX - 400
        theCharacter.y = display.contentCenterY - 800
    end
end


Runtime:addEventListener( "enterFrame", checkCharacterPosition )
upArrow:addEventListener( "touch", upArrow )
downArrow:addEventListener( "touch", downArrow )
leftArrow:addEventListener( "touch", leftArrow )
rightArrow:addEventListener( "touch", rightArrow )
jumpButton:addEventListener( "touch", jumpButton )