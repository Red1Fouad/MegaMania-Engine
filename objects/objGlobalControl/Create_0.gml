//Views (for easy access, as GMS2 doesn't have view variables anymore)
//Make sure that any references to these variables are used AFTER objGlobalControl's Create event

//TEMP FOR DEMO
showCon = true;

global.playersMax = 2;
global.isMultiplayer = 1;
global.view = view_get_camera(camera_create_view(0, 0, 256, 240, 0, noone, 0, 0, 9999, 9999));
global.viewX = 0;
global.viewY = 0;
global.viewWidth = camera_get_view_width(global.view);
global.viewHeight = camera_get_view_height(global.view);
global.enableDoubleJump = 1;
//Player ID
global.playerID = array_create(global.playersMax + 1, 1);

//Keys
leftKey = vk_left;
rightKey = vk_right;
upKey = vk_up;
downKey = vk_down;
jumpKey = ord("X");
shootKey = ord("W");
slideKey = ord("C");
pauseKey = vk_enter;
weaponSwitchLeftKey = vk_numpad1;
weaponSwitchRightKey = vk_numpad3;

leftKey2 = -1;
rightKey2 = -1;
upKey2 = -1;
downKey2 = -1;
jumpKey2 = -1;
shootKey2 = -1;
slideKey2 = -1;
pauseKey2 = -1;
weaponSwitchLeftKey2 = -1;
weaponSwitchRightKey2 = -1;

//Gamepad Buttons 
leftButton = gp_padl;
rightButton = gp_padr;
upButton = gp_padu;
downButton = gp_padd;
jumpButton = gp_face1;
shootButton = gp_face3;
slideButton = gp_face2;
pauseButton = gp_start;
weaponSwitchLeftButton = gp_shoulderl;
weaponSwitchRightButton = gp_shoulderr;

leftButton2 = gp_padl;
rightButton2 = gp_padr;
upButton2 = gp_padu;
downButton2 = gp_padd;
jumpButton2 = gp_face1;
shootButton2 = gp_face3;
slideButton2 = gp_face2;
pauseButton2 = gp_start;
weaponSwitchLeftButton2 = gp_shoulderl;
weaponSwitchRightButton2 = gp_shoulderr;


// Mobile Inputs created on startup
global.inputSize = [3, 4]; //change later?
if (isTouchDevice()) {
	vKeyDPADY = 42;
	global.vKeys = [
		virtual_key_add(20 * global.inputSize[1], (156-vKeyDPADY) * global.inputSize[1], 38 * global.inputSize[1], 16 * global.inputSize[1], upKey),
		virtual_key_add(20 * global.inputSize[1], (189-vKeyDPADY) * global.inputSize[1], 38 * global.inputSize[1], 16 * global.inputSize[1], downKey),
		virtual_key_add(12 * global.inputSize[1], (164-vKeyDPADY) * global.inputSize[1], 18 * global.inputSize[1], 36 * global.inputSize[1], leftKey),
		virtual_key_add(45 * global.inputSize[1], (164-vKeyDPADY) * global.inputSize[1], 18 * global.inputSize[1], 36 * global.inputSize[1], rightKey),
		
		virtual_key_add(204 * global.inputSize[0], 188 * global.inputSize[0], 30 * global.inputSize[1], 30 * global.inputSize[1], jumpKey),
		virtual_key_add(183 * global.inputSize[0], 154 * global.inputSize[0], 30 * global.inputSize[1], 30 * global.inputSize[1], shootKey),
		virtual_key_add(155 * global.inputSize[0], 186 * global.inputSize[0], 30 * global.inputSize[1], 30 * global.inputSize[1], slideKey),
		virtual_key_add((221+3) * global.inputSize[0], 127 * global.inputSize[0], 30 * global.inputSize[1], 15 * global.inputSize[1], weaponSwitchRightKey),
		virtual_key_add((221+3) * global.inputSize[0], 142 * global.inputSize[0], 30 * global.inputSize[1], 15 * global.inputSize[1], weaponSwitchLeftKey),
		virtual_key_add((224-8) * global.inputSize[0], 0 * global.inputSize[0], 30 * global.inputSize[1], 30 * global.inputSize[1], pauseKey)
	];
}


for (var i = 0; i <= 99; i++)
{
    prevHorAxis[i] = 0
    prevVertAxis[i] = 0
}

event_perform(ev_step_begin, 0); //Registers the key inputs
global.sectionLeft = 0;
global.sectionRight = 0;
global.sectionTop = 0;
global.sectionBottom = 0;

//Variables
global.GP = -1;
global._health = array_create(global.playersMax + 1, 28);
global.weapon = array_create(global.playersMax + 1, 0);  //Can have values like megabuster, silvertomahawk etc for all weapons in the game, even those that are not on the pause menu
global.currentWeapon = array_create(global.playersMax + 1, 0);   //Only the weapons used in the level; only those that are on the pause menu

global.font = font_add_sprite(sprFont, ord("!"), true, 0);
global.MM3font = font_add_sprite(sprMM3Font, ord("!"), true, 0);


global.frozen = false;
global.switchingSection = false;
global.currentPickupID = 0; //Each pickup (health, weapon energy, life, tanks) has an ID
                            //This way, we can make it despawn when the room starts if the pickup has already been collected in that level



//Go to the next room if this is the initializing room
//Also, initialize some variables
if room == rmInit
{
	global.msc = -2;
    
    display_reset(0, true); //Enables V-synch to make everything look nicer (without V-sync, GM Studio games tend to look pretty bad)
    
    room_goto_next();
    global.eTanks = 1;
	global.wTanks = 1;
    global.mTanks = 1;
    global._lives = 9;
       
    var i;
    for(i = 0; i <= 1000; i += 1) //If you somehow have over 1000 pickups in one room, increase this number
    {
        global.pickupCollected[i] = false;
    }
    
    for(i = 0; i <= 7; i += 1)
    {
        global.bossDefeated[i] = false;
    }
    
    global.lastRoom = rmInit;
    global.checkpoint = false;
    global.checkpointX = 0;
    global.checkpointY = 0;
    global.levelStart = false;
    
    global.primaryCol = array_create(global.playersMax + 1, c_white);
    global.secondaryCol = array_create(global.playersMax + 1, c_white);
    global.outlineCol = array_create(global.playersMax + 1, c_black);
    
    
    //Option variables
    global.enableCharge = true; //Can we charge the buster?
    global.enableSlide = true; //Can we slide?
    
    //Weapon inventory
    global.totalWeapons = 8; //8 weapons in total including the buster, but since 0 is also a valid weapon ID, the value becomes 7
    
    for(i = 0; i <= global.totalWeapons; i += 1)
    {
		global.ammo[i] = array_create(global.playersMax + 1, 28);
    }
    
    global.weaponSlot[0] = megabuster;
    global.weaponUnlocked[0] = true; //The Mega Buster is always unlocked
    global.weaponSlot[1] = silvertomahawk;
    global.weaponUnlocked[1] = true; //Unlocked because there's no RM for it yet
    global.weaponSlot[2] = windstorm;
    global.weaponUnlocked[2] = true; //Unlocked because there's no RM for it yet
    global.weaponSlot[3] = pharaohshot;
    global.weaponUnlocked[3] = false;
    global.weaponSlot[4] = metalblade;
    global.weaponUnlocked[4] = true; //Unlocked because there's no RM for it yet
    global.weaponSlot[5] = starcrash;
    global.weaponUnlocked[5] = true; //Unlocked because there's no RM for it yet
    global.weaponSlot[6] = rushcoil;
    global.weaponUnlocked[6] = true; //Usually, Rush Coil is available from the beginning as well
    global.weaponSlot[7] = rushjet;
    global.weaponUnlocked[7] = false; //We have no RM that unlocks Rush Jet yet
	global.weaponSlot[8] = hornetchaser;
    global.weaponUnlocked[8] = true; //We have no RM that unlocks Rush Jet yet
    
    global.weaponUnlocked[global.totalWeapons+1] = true; //E-tank
    global.weaponUnlocked[global.totalWeapons+2] = true; //M-tank
    
    
    //Names
    global.weaponName[megabuster] = "M.BUSTER";
    global.weaponName[rushcoil] = "R.COIL";
    global.weaponName[rushjet] = "R.JET";
    
    global.weaponName[metalblade] = "M.BLADE";
    
    global.weaponName[pharaohshot] = "P.SHOT";
    
    global.weaponName[starcrash] = "S.CRASH";
    
    global.weaponName[silvertomahawk] = "SILVER.T";
    global.weaponName[windstorm] = "W.STORM";
	global.weaponName[hornetchaser] = "H.CHASER";
    
    
    //Ammo
    global.weaponAmmo[megabuster] = 0;
    global.weaponAmmo[rushcoil] = 2;
    global.weaponAmmo[rushjet] = 1; //Per second
    
    global.weaponAmmo[metalblade] = 0.25;
    
    global.weaponAmmo[pharaohshot] = 1;
    
    global.weaponAmmo[starcrash] = 2; //2 when fired
    global.weaponAmmoContact[starcrash] = 3; //3 when colliding with an enemy or projectile
    
    global.weaponAmmo[silvertomahawk] = 1;
    global.weaponAmmo[windstorm] = 1;
	global.weaponAmmo[hornetchaser] = 1;
}


//When the level starts, all pickups should spawn
if global.levelStart == true
{
    event_user(0);
    alarm[0] = 1;
}


//Loading Configs
load_configs();