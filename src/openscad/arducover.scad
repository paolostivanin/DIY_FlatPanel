// Revision 1.1 (2023-Aug-30)

// Case
difference() {
    cube([90, 54, 17]);
    #translate([0, 2])cube([90, 50, 15]);
}


// Back
difference(){
    difference(){
        #translate([70, 0])cube([20, 54, 17]);
        #translate([70, 2])cube([18, 50, 15]);
    }
    #translate([88, 20])cube([2, 10, 3]);
}


// Front
difference(){
    difference(){
        #translate([0, 0])cube([20, 54, 17]);
        #translate([2, 2])cube([18, 50, 15]);
    }
    #translate([0, 20])cube([2, 25, 10]);
}


// This is for holding the cable, so that I don't have to disconnect the USB every time. The cable diameter is 3.45mm
ThreadThick = 0.25;
ThreadWidth = 0.40;
HoleWindage = 0.2;			// extra clearance
Protrusion = 0.1;			// make holes end cleanly

function IntegerMultiple(Size,Unit) = Unit * ceil(Size / Unit);

CableOD = 3.5;                              // cable jacket

Base = [4*CableOD,4*CableOD,3*ThreadThick];	  // overall base and slab thickness
CornerRadius = CableOD/2;                   // radius of square corners
CornerSides = 4*4;                          // total sides on square corner cylinders
NumSides = 6*3;                             // total sides for cylindrical base

module CableClip() {
    intersection() {
        resize(Base + [0,0,2*(Base[2] + CableOD)])
        sphere(d=Base[0],$fn=NumSides);

        union() {
            translate([0,0,Base[2]/2])
            cube(Base,center=true);

            for (j=[-1,1]) {
                translate([0,j*(Base[1]/2 - 0.125*(Base[1] - CableOD)/2),(Base[2] - Protrusion)])
                    resize([Base[0]/0.75,0,0])
                        cylinder(d1=0.75*(Base[1]-CableOD),
                        d2=(Base[1]-CableOD)/cos(0*180/NumSides),
                        h=(CableOD + Protrusion),
                        center=false,$fn=NumSides);
            }
        }
    }

//    color("Green",0.2)
//    translate([0,0,Base[2] + CableOD/2])
//    rotate([0,90,0])
//    cylinder(d=CableOD,h=2*Base[0],center=true,$fn=48);
}

#translate([30, 54, 8])rotate([270, 0, 0])CableClip();