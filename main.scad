/*
COPY RIGHTS

Date - 03/01/2014
Project- 3 jaw chuck
Version -1.1

Author - Bobwomble

Scad file cleaned up by Durwin Pye, Thanks

Rev : Eriobis
Date : 14/11/2018
Note : Added 3mm bolt version

Rev : Vijit
Date : 25.05.2019
Models changes :
- lower walls of rear housing, higher the central bushing for the nut M10;
- added reversed jaws, step up from the center;
- fixed resolution for the scroll;
- holes size for screw the scroll and gear ring now depends on bolt sizes, see parameters.scad
- face housing, risen the cuts for outer nuts at the same height, as cuts in the inner tube. Also made these cuts wider.

Other code changes:
- decomposition of all-in-one SCAD file to a few files;
- more purity in the code;
- remove useless: spiral_thread(), base_plate()
- rename: rnd_cnr() -> round_corner()
- rename: rnd_cnr_chuck() -> round_corner_chuck()
- rename: 3mmscrew_cutouts() -> _screw_cutouts()
*/

//------- Import libraries ----------

// Parametric Involute Bevel and Spur Gears by GregFrost
use <libs/parametric_involute_gear_v5.0.scad>;

// OpenSCAD 3D Text Generator by Phil Greenland, published Mar 10, 2013
use <libs/TextGenerator.scad>;

//------- Import modules ------------

include <parameters.scad>
include <module_switch.scad>

include <modules/drive_gear.scad>
include <modules/face_housing.scad>
include <modules/gear_ring.scad>
include <modules/housing_print_supports.scad>
include <modules/rear_housing.scad>
include <modules/jaw.scad>
include <modules/scroll.scad>

include <modules/spiral.scad>
include <modules/screws_plate.scad>
