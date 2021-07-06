// Secondary modules: cut the holes for connecting the scroll and gear ring

module gear_screws_cutouts()
{
    for ( i = [0 : 6] )
        rotate( [180, 0, i * 360 / 7])
            translate([30, 0, 0])
                _screw_cutouts();
}

module _screw_cutouts()
{
    cylinder (h=8, r=bolt_shaft_diam/2, $fn=res);       // drill size
    cylinder (h=4.76, r=bolt_thread_diam/2, $fn=res);   // screw size
     translate ([0,0,-9])
        cylinder (h=2+8, r=bolt_head_diam/2, $fn=res);  // bolt head size
}
