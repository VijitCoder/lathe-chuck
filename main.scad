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
About changes see readme.md
*/

//------- Import libraries ----------

// Parametric Involute Bevel and Spur Gears by GregFrost
use <libs/parametric_involute_gear_v5.0.scad>

// OpenSCAD 3D Text Generator by Phil Greenland, published Mar 10, 2013
use <libs/TextGenerator.scad>

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
