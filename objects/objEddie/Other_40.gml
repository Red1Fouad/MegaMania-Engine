if sprite_index == sprEddie or (leaving and sprite_index == sprRushTeleport and floor(image_index) == 0) {
    print("DESTROYED");
    instance_destroy();
}