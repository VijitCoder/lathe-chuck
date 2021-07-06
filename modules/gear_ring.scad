// Note: for view or render this module uncomment its call in module_switch.scad

module gear_ring()
{
    translate([0,0,-8])
        rotate([0,180,0])
            difference() {
                union() {
                    difference() {
                         bevel_gear (
                            number_of_teeth=gear2_teeth,
                            cone_distance=gear_cone_distance,
                            axis_angle=gear_axis_angle,
                            bore_diameter=gear2_bore_diam,
                            outside_circular_pitch=gear_outside_circular_pitch
                         );
                        translate ([0,0,-gear2_thickness])
                            cube([gear2_diam*3,gear2_diam*3,20],center=true);
                    }
                    translate([0,0,-4.2])
                        cylinder(r1=gear2_diam/2-0.75,r2=gear2_diam/2,h=gear2_bevel);
                }

                translate([0,0,-50])
                    cylinder(r=gear2_bore_diam/2,h=100);

                rotate([0,0,-6.5])
                    translate([0,0,-1])
                        gear_screws_cutouts();

                translate([0,0,-10])
                    difference() {
                        cylinder(r=gear2_diam/2+10,h=20);
                        cylinder(r=gear2_diam/2,h=20);
                    }
            }
}

// See in screws_plate.scad:
// gear_screws_cutouts()
