if instance_exists(objMegaman)
{
    with objMegaman playerCamera();
}

instance_deactivate_all(true);
instance_activate_object(objGlobalControl);
instance_activate_object(obj_gme);
instance_activate_object(objControllerControl);
