// Note: for view or render this module uncomment its call in module_switch.scad

module drive_gear()
{
    difference ()
    {
        union()
        {
            difference ()
            {
                union ()
                {
                    translate ([0,-14.1619,-23.44])
                        rotate ([90,0,0]){
                            cylinder (h=7,r=8/2,$fn=res);    // center pin
                        }
                    translate ([0,-40,-23.44])
                        rotate ([-90,0,0])
                            bevel_gear (
                                number_of_teeth=gear1_teeth,
                                cone_distance=gear_cone_distance,
                                outside_circular_pitch=gear_outside_circular_pitch,
                                bore_diameter=0
                                );
                }
                translate ([-25,-45,-54])
                    cube ([50,6,60]);
            }
            translate ([0,-38.98,-23.44])
                rotate ([90,0,0])
                    cylinder (h=11,r=31/2,$fn=res);          // (h=9,r=31/2,$fn=res)outer pin
        }
        translate ([0,-40.5,-23.44])
            rotate ([90,0,0])
                cylinder (h=10,r=9.5/2,$fn=hex_res);         // 8mm hex key socket r=9.4 is a tight fit
        translate ([0,-48,-23.44])
            rotate ([90,0,0])
                cylinder (h=2,r1=7/2,r2=10/2,$fn=res);       // chamfer hex socket
        torus();
        translate ([0,3.8,0])
            round_corner();

        translate ([0,-14,-23.44])
            rotate ([90,0,0])
             {
                 cylinder (h=3.5+15,r=2.8/2,$fn=res); // M3 bolt for axle reinforcement
                 cylinder (h=3.5,r=6/2,$fn=res);      // M3 bolt for axle reinforcement
             }

    }
    //translate ([0,0,-49]) //FOR TESTING ONLY
    //    outer_housing();    //FOR TESTING ONLY
}

module drive_gears()
{
    // make and position 3 drive gears
    rotate ([0,0,29.5])
        for ( i = [0 :(N+1)] )
        {
        rotate( i * 360 / N, [0, 0, 1])
            translate ([0,-0.25,0]) // to give a bit of clearance
                drive_gear();
        }
}

module torus()
{
    translate([0,-(chuck_outer_diam-chuck_outer_thickness)/2+2.71,-23.44])
    rotate ([90,0,0])
    rotate_extrude(convexity = 10, $fn = 100)
    translate([31/2, 0, 0])
    circle(r = (pin_radius), $fn = 100);
}

module round_corner()
{
    difference ()
    {
        translate ([0,-50,-23.44])
            rotate ([90,0,0])
            cylinder (h=8,r=40/2);

            translate([0,-50,-23.44])
              rotate ([90,0,0])
                rotate_extrude(convexity = 10, $fn = 100)
                    translate([25/2, 0, 0])
                        circle(r = 8/2, $fn = 100);
            translate ([0,-46,-23.44])
                rotate ([90,0,0])
                    cylinder (h=8,r=24/2);
    }
}
