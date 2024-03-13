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
pauseKey = vk_space;
weaponSwitchLeftKey = vk_numpad1;
weaponSwitchRightKey = vk_numpad3;

leftKey2 = ord("Q");
rightKey2 = ord("D");
upKey2 = ord("Z");
downKey2 = ord("S");
jumpKey2 = ord("J");
shootKey2 = ord("U");
slideKey2 = ord("V");
pauseKey2 = vk_numpad8;
weaponSwitchLeftKey2 = vk_numpad4;
weaponSwitchRightKey2 = vk_numpad6;

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
    global.totalWeapons = 7; //8 weapons in total including the buster, but since 0 is also a valid weapon ID, the value becomes 7
    
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
    global.weaponUnlocked[3] = true;
    global.weaponSlot[4] = metalblade;
    global.weaponUnlocked[4] = true; //Unlocked because there's no RM for it yet
    global.weaponSlot[5] = starcrash;
    global.weaponUnlocked[5] = true; //Unlocked because there's no RM for it yet
    global.weaponSlot[6] = rushcoil;
    global.weaponUnlocked[6] = true; //Usually, Rush Coil is available from the beginning as well
    global.weaponSlot[7] = rushjet;
    global.weaponUnlocked[7] = false; //We have no RM that unlocks Rush Jet yet
    
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
}


//When the level starts, all pickups should spawn
if global.levelStart == true
{
    event_user(0);
    alarm[0] = 1;
}

