# 3 Jaw Lathe Chuck

This is a 3D printing project.

[Original thing](https://www.thingiverse.com/thing:624625)

This repo stores only the source files (scad). There is no generated models because the source is parametric. You should to generate the models corresponding your needs.

I'am **not the author** of this thing. I made this repo because I need to capture **the remix steps** that I will do.
             
### What is changed

_25.05.2019_

Models changes :
- lower walls of rear housing, higher the central bushing for the nut M10;
- added reversed jaws, step up from the center;
- fixed resolution for the scroll;
- holes size for screw the scroll and gear ring now depends on bolt sizes, see parameters.scad
- face housing, risen the cuts for outer nuts at the same height, as cuts in the inner tube. Also made these cuts wider.

Code changes:
- decomposition of all-in-one SCAD file to a few files;
- more purity in the code;
- remove useless: `spiral_thread()`, `base_plate()`
- rename: `rnd_cnr()` -> `round_corner()`
- rename: `rnd_cnr_chuck()` -> `round_corner_chuck()`
- rename: `3mmscrew_cutouts()` -> `_screw_cutouts()`
