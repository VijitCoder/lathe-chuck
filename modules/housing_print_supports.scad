// Note: for view or render this module uncomment its call in module_switch.scad

// This module uses with `face_housing`.

module housing_print_supports()
{
    translate ([0,0,11.2])
        rotate ([180,0,0])
        {
            housing_print_support1();
            housing_print_support2();
        }
}

module housing_print_support1() {
    for ( b = [0 : (N+1)] )
    {
        rotate( b * 360 / N, [0, 0, 1])
        {
            difference()
            {
                 translate ([10,-2.5,0.1])
                     cube ([8,5,11]);
                 translate ([10.4,-2.1,0])
                     cube ([7.2,4.2,10]);
            }
        }
    }
}

module housing_print_support2() {
    for ( b = [0 : (N+1)] )
    {
        rotate( b * 360 / N, [0, 0, 1])
        {
            difference()
            {
             translate ([41,-2.5,0.1])
                 cube ([10,5,10.9]);
             translate ([41.4,-2.1,0])
                 cube ([9.2,4.2,9.9]);
            }
        }
    }
}
