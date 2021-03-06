-----------------------------------------------------------------------------------------
--
-- main_menu.lua
-- Created by: Avery Mack
-- Date: April 10, 2018
-- Description: This is the main menu, displaying the credits, instructions & play buttons.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "main_menu"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
local bkgSounds = audio.loadSound("Sounds/bkg.mp3")
local bkgSoundChannel
local mainMenuImage
local playButton
local creditsButton
local instructionsButton 
local levelsButton


-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transition to Level1 Screen
local function LevelSelectScreenTransition( )
    composer.gotoScene( "levelSelectScreen", {effect = "fade", time = 1000})
end    

-- Creating Transition Function to Credits Page
local function CreditsTransition( )       
    composer.gotoScene( "credits_screen", {effect = "zoomOutInRotate", time = 500})
end 

-- creating transition function to instructions page
local function InstructionsTransition( )
    composer.gotoScene( "instructions_screen", {effect = "zoomOutInRotate", time = 500})
end 


-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    mainMenuImage = display.newImage("Images/MainMenuAveryM.png")
    mainMenuImage.x = display.contentCenterX
    mainMenuImage.y = display.contentCenterY
    mainMenuImage.width = display.contentWidth
    mainMenuImage.height = display.contentHeight


    -- Associating display objects with this scene 
    sceneGroup:insert( mainMenuImage )

    -- Send the background image to the back layer so all other objects can be on top
    mainMenuImage:toBack()

    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    -- Creating Play Button
    playButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*3.7/8,
            y = display.contentHeight*6.2/8,
            width = 250,
            height = 150, 

            -- Insert the images here
            defaultFile = "Images/PlayButtonUnpressedNiceM.png",
            overFile = "Images/PlayButtonPressedNiceM.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = LevelSelectScreenTransition          
        } )

    -----------------------------------------------------------------------------------------

    -- Creating Credits Button
    creditsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*1/8,
            y = display.contentHeight*6.8/8,
            width = 200,
            height = 100, 

            -- Insert the images here
            defaultFile = "Images/CreditsButtonUnpressed.png",
            overFile = "Images/CreditsButtonPressed.png",

            -- When the button is released, call the Credits transition function
            onRelease = CreditsTransition
        } ) 

    ----------------------------------------------------------------------------------------
    -- Creating Instructions Button
    instructionsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*6.5/8,
            y = display.contentHeight*6.8/8,
            width = 200,
            height = 100, 

            -- Insert the images here
            defaultFile = "Images/InstructionsButtonUnpressedNiceM.png",
            overFile = "Images/InstructionsButtonPressedNiceM.png",

            -- When the button is released, call the Instructions transition function
            onRelease = InstructionsTransition 
        } ) 


    -----------------------------------------------------------------------------------------

    -- Associating button widgets with this scene

    sceneGroup:insert( playButton )
    sceneGroup:insert( creditsButton )
    sceneGroup:insert( instructionsButton )
    

end -- function scene:create( event )   



-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen.
    -- Insert code here to make the scene come alive.
    -- Example: start timers, begin animation, play audio, etc.
    elseif ( phase == "did" ) then       
        
        -- play background music
        bkgSoundChannel = audio.play(bkgSounds)

    end

end -- function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end

end -- function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
