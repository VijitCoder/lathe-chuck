// Note: for view or render this module uncomment its call in module_switch.scad

module jaw(number)
{
    difference()
    {
        rotate ((360/N)*(number-1),[0,0,1])
            jaw_complete();
        translate ([0,0,0.2])
            // params: _revolutions=9, _diameter=125, _thickness=2.3, _height=3, _gap=3.8, _resolution=100
            jaw_spiral(9, 125, 2.3, 3, 3.8, 100);
    }
    rotate ((360/N)*(number-1),[0,0,1])
        jaw_number(number);
}

module jaw_complete()
{
    jaw_base();
    if (direct_jaw)
        jaw_cap();
    else
        jaw_cap_reverse();
}

module jaw_base()
{
    translate ([dist_center,0,0])
        difference()
        {
            union()
            {
                translate ([0, -4, 5.1])
                    cube ([jaw_length, 8.0, 6.2]);  // jaw slot width - 8.5 (neck) and 16.5 (foot)
                translate ([0, -8, -0.1])
                    cube ([jaw_length, 16, 5.9]);
            }
        translate ([2.5,0,0])
            jaw_point();
        translate ([jaw_length-17.75,0,-16])
            jaw_cutaway();
    }
}

module jaw_cap()
{
    translate ([dist_center, 0, 11.2])
        difference()
        {
            _shift = 1.5;

            translate ([-_shift, -8, 0.1])
                cube ([jaw_length + _shift, 16, 20]);

            // First step up
            translate ([12, 0, -6])
                jaw_cutaway();

            // Second step up
            jaw_cutaway();

            // Just round the ouside wall
            translate ([jaw_length-17.75, 0, -16])
                jaw_cutaway();

            translate ([1,0,0])
                jaw_point();

            translate ([1,0,0])
                jaw_point_notch();
        }
}

module jaw_cap_reverse()
{
    translate ([dist_center, 0, 11.2])
        difference()
        {
            _shift = 1.5;
            _stepLength = jaw_length/3;

            translate ([-_shift, -8, -0.1])
                cube ([jaw_length + _shift, 16, 20]);

            // First step up
            translate ([dist_center + _shift*2 - _stepLength*2, 0, -6])
                jaw_cutaway_reverse();

            // Second step up
            translate ([dist_center + _shift*2 - _stepLength, 0, 0])
                jaw_cutaway_reverse();

            // Just round the ouside wall
            translate ([jaw_length-17.75,0,-16])
                jaw_cutaway();

            translate ([1,0,0])
                jaw_point();

            translate ([1,0,0])
                jaw_point_notch();
        }
}

module jaw_cutaway()
{
    difference()
    {
         translate ([14,-9,14])
             cube ([jaw_length*2/3,18,23]);
         translate ([-3,0,13])
             cylinder (h=25,r=40/2,$fn=res);
    }
}

module jaw_cutaway_reverse()
{
    difference()
    {
        _shift = 1.5 + 0.2;
        _cutLength = jaw_length*2/3 + 0.2;

        translate ([-_shift, -9, 14])
            cube ([_cutLength, 18, 23]);

        translate ([-_shift + _cutLength + 17, 0, 14])
            cylinder (h=25, r=40/2, $fn=res);
    }
}

module jaw_number(number)
{
    rotate ([90,0,180])
        translate ([-30,12,7.5])
            drawtext(str(number)); // using TextGenerator.scad
}

// Make a point at center
module jaw_point()
{
    difference()
    {
    translate ([-3,0,0])
        cube ([18,30,60],center=true);
    translate ([15-3,4,-1])
        rotate ([0,0,60])
            cube ([22,22,63],center=true);
    translate ([15-3,-4,-1])
        rotate ([0,0,-60])
            cube ([22,22,63],center=true);
    }
}

module jaw_point_notch()
{
    translate ([-8,0,-1.25])
        for (i=[0:4.25:22])
        {
            translate ([0,-3,i])
                cube ([6,6,1]);
        }
}

module jaws()
{
    for ( i = [1 : N] )
        jaw(i);
}

// See in spiral.scad:
// spiral()
// jaw_spiral()
