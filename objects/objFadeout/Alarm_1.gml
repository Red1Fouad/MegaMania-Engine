if type == "restart"
{
    room_restart();
    global.weapon[playerID] = megabuster;
}
else if type == "room"
{
    room_goto(myRoom);
    global.weapon[playerID] = megabuster;
}

