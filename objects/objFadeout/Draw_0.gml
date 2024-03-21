var oldCol, oldAlpha;
oldCol = draw_get_color();
oldAlpha = draw_get_alpha();

draw_set_color(c_black);
draw_set_alpha(blackAlpha);

// Ensure that global.viewX, global.viewY, global.viewWidth, and global.viewHeight are properly initialized
var viewX = global.viewX;
var viewY = global.viewY;
var viewWidth = global.viewWidth;
var viewHeight = global.viewHeight;

// Check if any of the view coordinates are unset
if (is_undefined(viewX) || is_undefined(viewY) || is_undefined(viewWidth) || is_undefined(viewHeight)) {
    show_debug_message("One or more view coordinates are unset.");
} else {
    // Draw the rectangle
    draw_rectangle(viewX, viewY, viewX + viewWidth, viewY + viewHeight, false);
}

draw_set_color(oldCol);
draw_set_alpha(oldAlpha);
