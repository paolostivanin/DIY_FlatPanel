// Revision 1.1 (2023-Aug-30)

// The panel is 359mm x 269mm. There is a black frame of 20mm, so we can reduce the cover size.
panel_width = 340;
panel_depth = 240;

// The panel is 3mm high, the foot are 4mm hight. Total height 7mm.
panel_height = 3;
scope_diameter = 95;
foot_height = 4;
foot_width = 5;
foot_depth = 8;

module feet() {
    cube([foot_width, foot_depth, foot_height]);
}

difference() {
    cube([panel_width, panel_depth, panel_height]);
    #translate([panel_width/2, panel_depth/2])cylinder(panel_height, scope_diameter, scope_diameter);
}

#translate([0, 0, panel_height])feet();
#translate([panel_width-foot_width, 0, panel_height])feet();
#translate([0, panel_depth-foot_depth, panel_height])feet();
#translate([panel_width-foot_width, panel_depth-foot_depth, panel_height])feet();