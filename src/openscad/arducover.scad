// Esterno
difference() {
    cube([110, 64, 17]);
    #translate([0, 2])cube([110, 60, 15]);
}


// Retro
difference(){
    difference(){
        #translate([90, 0])cube([20, 64, 17]);
        #translate([90, 2])cube([18, 60, 15]);
    }
    #translate([108, 20])cube([2, 10, 3]);
}


// Fronte
difference(){
    difference(){
        #translate([0, 0])cube([20, 64, 17]);
        #translate([2, 2])cube([18, 60, 15]);
    }
    #translate([0, 30])cube([2, 25, 10]);
}


// I need a 110x60x15 EFFECTIVE.
// 0-2, (2-3)buco, 3-6 sul retro. Altezza 3mm
// 0-3, (3-5.5)buco, 5.5-6 fronte. Altezza 10mm 