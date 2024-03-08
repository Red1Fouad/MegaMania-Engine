function playerDeactivateObjects() {
    if (!is_undefined(sectionLeft) && !is_undefined(sectionRight) && 
        !is_undefined(sectionTop) && !is_undefined(sectionBottom)) {
        instance_activate_region(sectionLeft-16, sectionTop-16, abs(sectionRight - sectionLeft)+16, abs(sectionBottom - sectionTop)+16, true);
    } else {
        show_message("Sections not properly initialized!");
    }
}
