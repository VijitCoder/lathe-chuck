// Note: for view or render this module uncomment its call in module_switch.scad

module scroll()
{
    translate([0,0,-4])
        difference() {
            intersection() {
                translate ([0,0,-5])
                    cylinder(r=42, h=15, $fn=res);

                union() {
                    translate ([0,0,4])
                        jaw_spiral();

                    cylinder(r=42, h=4, $fn=res);
                }
            }
            translate ([0,0,-1])
                cylinder(r=18,h=10, $fn=res);

            rotate([0,0,-30])
                translate ([10,-0.1,4])
                    cube([10.2,10,10]);

            rotate([0,180,-45])
                translate ([0,0,4.8])
                    gear_screws_cutouts();
        }
}

// See in spiral.scad:
// jaw_spiral()

// See in screws_plate.scad:
// gear_screws_cutouts()
