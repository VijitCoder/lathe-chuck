// Note: for view or render this module uncomment its call in module_switch.scad

// See also module `housing_print_supports`.

module face_housing()
{
    difference ()
    {
        // BODY

        union()
        {
            translate ([0,0,-37])
                centre_bore();
            translate ([0,0,-34])
                outer_housing();
            translate ([0,0,3.1])
                cylinder (h=8,r=((chuck_outer_diam+1)/2),$fn=res);
        }
        translate ([0,0,-50])
            cylinder (h=70,r=22/2,$fn=res); // make center bore larger
        translate ([0,0,-14.5])
            cylinder (h=26,r=chuck_center_hole/2);

        // JAW SLOTS

        for ( i = [0 : (N+1)] )
        {
            rotate( i * 360 / N, [0, 0, 1])
            {
                translate ([0,-4.25,6])
                    cube ([55,8.5,6]);
                translate ([0,-8.25,0.1])
                    cube ([55,16.5,6]);
            }
        }

        // CUTOUTS

        rotate([0,0,90/N])
            drive_gear_cutouts();
        rotate([0,0,90/N-19.8])
            locking_pins();
        rotate([0,0,90/N+19.8])
            locking_pins();
        rotate([0,0,-90/N])
        {
            translate ([0,0,-6])
            {
                backplate_screws();
                backplate_center_screws();
                round_corner_chuck();
            }
        }
    }
}

module centre_bore()
{
    difference ()
    {
        union ()
        {
            translate ([0,0,-5])
                cylinder (h=53,r=(((chuck_center_hole+chuck_inner_thickness*2)-clearance)/2),$fn=res);
            //translate ([0,0,32.5])
            //    cylinder (h=8,r=(((chuck_center_hole+chuck_inner_thickness*3)-clearance)/2),$fn=res); // DP: New feature
        }
        translate ([0,0,-7])
            cylinder (h=58,r=chuck_center_hole/2);
    }
}


module drive_gear_cutouts()
{
    for ( i = [0 :(N+1)] )
    {
        rotate( i * 360 / N, [0, 0, 1])
        {
            translate ([0,-32.98,-23.44])
                rotate ([90,0,0])
                    cylinder (h=24,r=31.15/2,$fn=res); // outer pin + tolerance
            translate ([0,-12,-23.44])
                rotate ([90,0,0])
                    cylinder (h=50,r=8.15/2,$fn=res);  // inner pin + tolerance
        }
    }
}

module backplate_screws()
{
    _deep = -(chuck_outer_diam - chuck_outer_thickness)/2;

    for ( i = [0 : (N+1)] )
    {
        rotate( i * 360 / N, [0, 0, 1])
        {
            translate ([0,_deep,-63])
                cylinder (h=38.5,r=bolt_thread_diam/2,$fn=screw_res);               // shaft
            translate ([0,_deep,-20.5])
                cylinder (h=10,r=bolt_thread_diam/2,$fn=screw_res);                 // shaft
            translate ([0,_deep,-24.25])
                cylinder (h=3.25,r=bolt_head_diam/2,$fn=hex_res);                   // hex nut
            translate ([-2.5,_deep,-24.25])
                cube ([5,10,3.25]);
            translate ([0,_deep,-20.5])
                cylinder (h=3.25,r=bolt_head_diam/2,$fn=hex_res);                   // hex nut
            translate ([-4.375,_deep,-20.5])
                cube ([8.75,10,3.25]);
        }
    }
}

module backplate_center_screws()
{
    _deep = -29/2;

    for ( i = [0 : (N+1)] )
    {
        rotate( i * 360 / N, [0, 0, 1])
        {
           translate ([0,_deep,-63])
                 cylinder (h=38.5,r=3.7/2,$fn=screw_res);             // shaft
           translate ([0,_deep,-20.5])
                 cylinder (h=10,r=3.7/2,$fn=screw_res);               // shaft
           translate ([0,_deep,-24.25])
                cylinder (h=3.25,r=bolt_head_diam/2,$fn=hex_res);     // hex nut
           translate ([-2.5,-49/2,-24.25])
                cube ([5,10,3.25]);
           translate ([0,_deep,-20.5])
                cylinder (h=3.25,r=7.75/2,$fn=hex_res);               // hex nut
            translate ([-4.375,-49/2,-20.5])
                cube ([8.75,10,3.25]);
        }
    }
}

module outer_housing()
{
    difference ()
    {
        translate ([0,0,-8])
            cylinder (h=48,r=((chuck_outer_diam+1)/2), $fn=res);
        translate ([0,0,-9])
            cylinder (h=50,r=(((chuck_outer_diam-chuck_outer_thickness*2)+clearance)/2),$fn=res);
    }
}

module locking_pins()
{
    for ( i = [0 : (N+1)] )
    {
        rotate( i * 360 / N, [0, 0, 1])
        {
           translate ([0,-((chuck_outer_diam-chuck_outer_thickness)+0.5)/2,-43])
                cylinder (h=48,r=bolt_shaft_diam/2,$fn=screw_res);  // shaft
           translate ([0,-((chuck_outer_diam-chuck_outer_thickness)+0.5)/2,-43])
                cylinder (h=24,r=bolt_thread_diam/2,$fn=screw_res); // thread
           translate ([0,-((chuck_outer_diam-chuck_outer_thickness)+0.5)/2,-43])
                cylinder (h=3.5+1,r=bolt_head_diam/2,$fn=screw_res); // head
        }
    }
}

module round_corner_chuck()
{
    difference()
    {
    translate ([0,0,11])
        cylinder (r=110/2,h=10);
    translate ([0,0,10])
    rotate ([0,0,0])
    rotate_extrude(convexity = 10, $fn = 100)
        translate([90/2, 0, 0])
            circle(r = 8, $fn = 40);
    translate ([0,0,10])
        cylinder (r=86/2,h=10);
    }
}
