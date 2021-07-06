// Note: for view or render this module uncomment its call in module_switch.scad

module rear_housing()
{
    difference ()
    {
        translate ([0,0,-39.25])
        {
            difference ()
            {
                union ()
                {
                    translate ([0,0,-(2.75+6)])
                        // This object is the wall. Use h max = 43.75.
                        cylinder (h=13.75,r=(((chuck_outer_diam-chuck_outer_thickness*2)-clearance)/2),$fn=res);
                    translate ([0,0,-8.75])
                        cylinder (h=6,r=((chuck_outer_diam+1)/2),$fn=res);
                }
                translate ([0,0,-2.75])
                    cylinder (h=62,r=(((chuck_outer_diam-chuck_outer_thickness*2)-5+clearance)/2),$fn=res);

                // gear cutouts
                rotate ([0,0,29.5]) // This rotation works with 3 jaws
                    for ( i = [0 :(N+1)] )
                    {
                        rotate( i * 360 / N, [0, 0, 1])
                            {
                                translate ([0,-30,15])
                                    rotate ([90,0,0])
                                        cylinder (h=20,r=33/2,$fn=res);
                                translate ([-16.5,-44,15])
                                    cube ([33,12,40]);
                            }
                    }
                rotate ([0,0,-29.5]) // This rotation works with 3 jaws
                {
                    translate ([0,0,-5.25])
                        backplate_screw_cutouts();
                    translate ([0,0,-5.25])
                        backplate_center_screw_cutouts();
                }
            }
            translate ([0,0,-4.75])
                cylinder (h=25,r=21.65/2,$fn=res); // (h=12,r=21.75/2,$fn=res)center bore bit??
        }
        // M10 drive bolt
        translate ([0,0,-25])
            cylinder (r=19.5/2,h=25,$fn=hex_res);
        translate ([0,0,-50])
            cylinder (r=10/2,h=40,$fn=res);
    }
}

// for testing
module rear_housing_test(){
    difference ()
    {
        translate ([0,0,-2.99])
            cylinder (h=34,r=((chuck_outer_diam-chuck_outer_thickness*2)/2),$fn=res);
        translate ([0,0,-3])
            cylinder (h=52,r=(((chuck_outer_diam-chuck_outer_thickness*2)-6)/2),$fn=res);
        translate ([0,-30,15])
            rotate ([90,0,0])
                cylinder (h=20,r=28/2,$fn=res);
    }
}

module backplate_center_screw_cutouts() {
    for ( i = [0 : (N+1)] )
    {
        rotate( i * 360 / N, [0, 0, 1])
        {
           translate ([0,-((chuck_center_hole+chuck_inner_thickness))/2,0])
                 cylinder (h=10,r=bolt_shaft_diam/2,$fn=res);    // shaft
           translate ([0,-((chuck_center_hole+chuck_inner_thickness))/2,-4.25])
                 cylinder (h=3+1.5,r=bolt_head_diam/2,$fn=res);  // head
        }
    }
}

module backplate_screw_cutouts() {
    for ( i = [0 : (N+1)] )
    {
        rotate( i * 360 / N, [0, 0, 1])
        {
            translate ([0,-((chuck_outer_diam-chuck_outer_thickness))/2,0])
                cylinder (h=10,r=bolt_shaft_diam/2,$fn=screw_res);       // shaft
            translate ([0,-((chuck_outer_diam-chuck_outer_thickness))/2,-4.25])
                cylinder (h=3+1.5,r=bolt_head_diam/2,$fn=screw_res);    // head
        }
    }
}
