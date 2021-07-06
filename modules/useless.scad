// From readme.md:
// > remove useless spiral_thread(), base_plate()
//
// Here I what to see, what exactly they can do, even unused. Probably they were made for debugging.

module spiral_thread() {
	// number of revolutions around the circle
	_revolutions = 8.5; //4, for jaw 8

	// outside diameter of the spiral
	_diameter = 116; //86, for jaw 108

	// thickness of each ring of the spiral
	_thickness = 2.3;//2.3, for jaw....

	// height of the spiral
	_height = 3; //3

	// gap between rings of the spiral
	_gap = 3.8; //3.8, for jaw maybe make smaller
	// number of sections around the circle
	_resolution = 100;//100+ for printing
	difference ()
	{
		union()
		{
			spiral(_revolutions, _diameter, _thickness, _height, _gap, _resolution);
				translate ([0,0,-3.99])
					cylinder (h=4,r=((chuck_outer_diam-chuck_outer_thickness*2)/2),$fn=res);
		}
			////REMOVE END OF SPIRAL
			translate ([-9,12,0])
				cube ([10,8,6]);
			translate ([0,0,-20])
				cylinder (h=24,r=((chuck_center_hole+chuck_inner_thickness*2)/2),$fn=res);
			translate ([0,0,-35])
				rear_housing();
			translate ([0,0,-25])
				outer_housing();
	}
	difference()
	{
		rotate ([0,0,13.65])
		locking_pins();
	}
	{
		for ( i = [0 : 6] )
		rotate( i * 360 / 7,[0,0,1])
		 translate([30, 0, -8.75])
             _screw_cutouts();
	}
}

module base_plate() {
	difference ()
	{
		translate ([0,0,-3.99])
			cylinder (h=4,r=((chuck_outer_diam-chuck_outer_thickness*2)/2),$fn=res);
		translate ([0,0,-20])
			cylinder (h=24,r=((chuck_center_hole+chuck_inner_thickness*2)/2),$fn=res);
	}
}
