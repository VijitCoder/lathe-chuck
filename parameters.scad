// Parameters

// Bolt sizes
// M4 version
bolt_head_diam = 7.5;
bolt_shaft_diam = 3.5;
bolt_thread_diam = 4;

// M3 version
// bolt_head_diam = 6;
// bolt_shaft_diam = 2.8;
// bolt_thread_diam = 3;

N = 3;                      //number of jaws (1, 2, 3, 4, 5, or 6) *works best at 3 and 4, 7 overlaps
res=20;                     //low (20) for testing, change to high (120-200) for printing
direct_jaw=true;            // Boolean parameter here for steps direction on the jaw:
                            // TRUE - jaw steps down from the center; FALSE - jaw steps up from the center.
chuck_outer_diam =100;      //max 100
chuck_outer_thickness=8;    //max 8
chuck_center_hole=20;       //max 20
chuck_inner_thickness=8;    //max 8
clearance=0.4;              //0.4
jaw_length=40;              //40
dist_center=12;             //12
screw_res=20;               //lower resolution for small features
hex_res=6;                  //6-sided for hex nuts and hex head bolts
pin_radius=((bolt_shaft_diam/2)+clearance);

function radiusAt(radius, angle, pitch) = radius - pitch * (angle/360);

//bevel_gear_pair parameters
gear1_teeth = 14;
gear2_teeth = 41;
gear2_diam = 77.9;
gear2_bore_diam = 36;
gear2_thickness = 12;
gear2_bevel = 2.2;
gear_axis_angle = 90;
gear_cone_distance = 42.4;
gear_outside_circular_pitch = 352;
