//Colors
character = global.playerName;

playerSetColors();
//Player ID
playerID = 1;
ladderXScale = 1;
otherTransition = 0;
//Teleport to the checkpoint location, if we hit a checkpoint
if global.checkpoint == true && instance_number(objMegaman) <= 1
{
	x = global.checkpointX;
	y = global.checkpointY;
}
mergeBlocks();
global.xspeed = array_create(global.playersMax + 1, 0);
global.yspeed = array_create(global.playersMax + 1, 0);
//Initialize the camera
newSectionXOffset = 0;
newSectionYOffset = 0;

sectionLeft = global.sectionLeft;
sectionRight = global.sectionRight;
sectionTop = global.sectionTop;
sectionBottom = global.sectionBottom;


playerCameraInit();


//Physics variables
grav = 0.25; //The player's gravity
gravWater = 0.38 * grav; //The player's gravity in water
jumpSpeed = 4.75 + grav*2;  //Dunno why grav needs to be multiplied by 2, but MM jumps as high as in MM5 when doing so
jumpSpeedWater = 4.85 + grav*2;
walkSpeed = 1.3; //1.296875;
maxVspeed = 7;
stepSpeed = 1/7;
stepFrames = 7;
iceDec = 0.025; //The deceleration on ice when not holding any buttons
iceDecWalk = 0.05; //The deceleration on ice when moving in the opposite direction
slideSpeed = 2.5;
slideFrames = 26;
climbSpeed = 1.3; //1.296875; //Official value of MM3
initChargeTime = 20; //The amount of frames after which to start charging after the shooting animation is complete
chargeTime = 57; //Official value of MM6
hitTime = 20; //The amount of frames you experience knockback after getting hit


//Variables
canDuck = false;
ground = false;
ducking = 0;
prevGround = false;
prevXScale = image_xscale;
isStep = false;
stepTimer = 0;
canInitStep = true; //Can we initialize sidestepping?
//global.xspeed[playerID] = 0;
//global.yspeed[playerID] = 0;
canMinJump = true;
canMove = true;
canSpriteChange = true;
canShoot = true;
isShoot = false;
isThrow = false;
shootTimer = 0;
isSlide = false;
slideTimer = 0;
canHit = true;
isHit = false;
hitTimer = 0;
climbShootXscale = 0;
drawHitspark = false;
invincibilityTimer = 0;
isCharge = false;
chargeTimer = 0;
initChargeTimer = 0; //The timer for when to start charging after exiting the shooting animation
canGravity = true;
climbing = false;
climbSpriteTimer = 0;
canStep = false; //We can actually perform the step event even if canStep = false; it's merely used to block certain events from happening at the first frame, as canStep becomes true after 1 frame
alarm[0] = 1; //For canStep
pharaohShotInitTimer = 0;
teleporting = false;
teleportY = 0;
teleportTimer = 0;
deathByPit = false; //Did we die by falling in a bottomless pit?
playLandSound = true; //Should we play the landing SFX when colliding with a floor? (Disabled on ladders, for example)
playLandSoundTimer = 2; //Lasts two frames, since it takes 1 extra frame for the collision code to register
currentGrav = grav; //Normal gravity or water gravity?
currentJumpSpeed = jumpSpeed; //Normal jump speed or water jump speed?
inWater = false;
bubbleTimer = 0; //Timer for the air bubble MM creates under water
blinkTimer = 0; //Timer for MM's blinking animation when standing still
blinkTimerMax = 120;
blinkImage = 0; //0 for no blinking, 1 for blinking
blinkDuration = 8; //The amount of frames the blinking lasts
drawWeaponIcon = false; //Whether or not we should draw the weapon icon above our head (used when using quick weapon switching)
drawWeaponIconTimer = -1;
onRushJet = false; //Are we on the Rush Jet?
movedByPlatform = false;
movedPlatformID = -20;
canSlide = true;
canSlideTimer = 0;
jumpedFromSlide = 0;
bassBusterTimer = 0;
groundFrames = 0;
didDoubleJump = 0;
justClimbed = 0;
affectedByFan = 0;

global.outlineCol[playerID] = c_black;


//Variable sprites
spriteStand = asset_get_index("spr"+character+"Stand");
spriteJump = asset_get_index("spr"+character+"Jump");
spriteWalk = asset_get_index("spr"+character+"Walk");
spriteStep = asset_get_index("spr"+character+"Step");
spriteClimb = asset_get_index("spr"+character+"Climb");
spriteGetup = asset_get_index("spr"+character+"Getup"); //Can also be sprMegamanClimbShoot, thus it's variable

//Static sprites

spriteSlide = asset_get_index("spr"+character+"Slide");
spriteHit = asset_get_index("spr"+character+"Hit");
spriteTeleport = asset_get_index("spr"+character+"Teleport");

//Set the correct whitemask colors
event_user(0);


//Show the READY text
showReady = true;
readyTimer = 0;
canSpriteChange = false;
canMove = false;
canGravity = false;
canPause = false;
image_speed = 0;

//Hotfix
keyLeft = global.keyLeft;
keyRight = global.keyRight;
keyUp = global.keyUp;
keyDown = global.keyDown;
keyJump = global.keyJump;
keyShoot = global.keyShoot;
keySlide = global.keySlide;
keyPause = global.keyPause;
keyWeaponSwitchLeft = global.keyWeaponSwitchLeft;
keyWeaponSwitchRight = global.keyWeaponSwitchRight;

keyLeftPressed = global.keyLeftPressed;
keyRightPressed = global.keyRightPressed;
keyUpPressed = global.keyUpPressed;
keyDownPressed = global.keyDownPressed;
keyJumpPressed = global.keyJumpPressed;
keyShootPressed = global.keyShootPressed;
keySlidePressed = global.keySlidePressed;
keyPausePressed = global.keyPausePressed;
keyWeaponSwitchLeftPressed = global.keyWeaponSwitchLeftPressed;
keyWeaponSwitchRightPressed = global.keyWeaponSwitchRightPressed;

keyLeftReleased = global.keyLeftReleased;
keyRightReleased = global.keyRightReleased;
keyUpReleased = global.keyUpReleased;
keyDownReleased = global.keyDownReleased;
keyJumpReleased = global.keyJumpReleased;
keyShootReleased = global.keyShootReleased;
keySlideReleased = global.keySlideReleased;
keyPauseReleased = global.keyPauseReleased;
keyWeaponSwitchLeftReleased = global.keyWeaponSwitchLeftReleased;
keyWeaponSwitchRightReleased = global.keyWeaponSwitchRightReleased;
event_user(0);