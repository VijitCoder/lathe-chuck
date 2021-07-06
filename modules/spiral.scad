// Spirales
// Secondary Modules, shared by few primary modules.

module spiral(revolutions, diameter, thickness, height, gap, resolution)
{
    eps = 0.2;
    radius = diameter/2;
    revolutions = min(revolutions, radius/(thickness+gap)-eps);
    pitch = thickness + gap;
    angleStep = 360/round(resolution);

    union()
    for (angle = [0:angleStep:360*revolutions-angleStep]) {
        r0 = radiusAt(radius, angle, pitch);
        r1 = radiusAt(radius, angle+angleStep, pitch);
        r2 = radiusAt(radius-thickness, angle+angleStep, pitch);
        r3 = radiusAt(radius-thickness, angle, pitch);

        linear_extrude(height = height, slices = 1) {
                polygon(
                    points=[
                        [r0*sin(angle),r0*cos(angle)],
                        [r1*sin(angle+angleStep),r1*cos(angle+angleStep)],
                        [r2*sin(angle+angleStep+eps),r2*cos(angle+angleStep+eps)],
                        [r3*sin(angle-eps),r3*cos(angle-eps)]
                    ],
                    paths=[[0,1,2,3]]
                );
        }
    }
 }

module jaw_spiral(_revolutions=4, _diameter=86, _thickness=2.3, _height=3, _gap=3.8, _resolution=100)
{
    union()
    {
        rotate ([0,0,-120])
            spiral(_revolutions, _diameter, _thickness, _height, _gap, _resolution);

        // LARGE BASE
        translate ([0,0,-3.99])
            cylinder (h=4, r=124/2, $fn=res);
    }
}
