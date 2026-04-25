svg_file = "";
scale_factor = 2.8;
height = 5;

add_handle = true;

handle_diameter = 14;
handle_height = 25;

handle_x = 0;
handle_y = 0;

module base_shape() {
    offset(delta = 0.01)
        offset(delta = -0.01)
            import(file = svg_file, center = true, dpi = 96);
}

union() {
    
        scale([scale_factor, scale_factor, 1])
            linear_extrude(height = height, center = false)
                base_shape();

        if (add_handle) {
            translate([handle_x, handle_y, 0])
                cylinder(h = handle_height, d = handle_diameter, $fn = 128);
        }
}