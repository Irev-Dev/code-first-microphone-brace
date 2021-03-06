include <lib/polyround.scad> // make sure you run dependencies.sh

$fn=30;

mountInset=4;
insetToMonitorBottom=150;
mountClearance=5;
mountHoleDiameter=3;
mountHoleDistance=100;
micDiameter=67;
mountWidth=20;

screwDiameter=4;
screwHeadDiameter=8;
minThickness=1.5;
cuffThickness=3;
cuffHeight=50;
tiny=0.05;

microphoneScrewDiameter=6;

bottom= -mountHoleDistance-mountClearance-insetToMonitorBottom;

translateCuff=[0,bottom-micDiameter/2,-cuffHeight+mountWidth];

module ScrewHole() {
    rotate([0,-90,0]){
        cylinder(d=screwDiameter,h=50);
        translate([0,0,-50])cylinder(d=screwHeadDiameter,h=50);
    }
}

module BraceBody() {
    radiiPoints=[
        [4+mountInset*2, -mountHoleDistance/2, 500],
        [4, 0, 2],
        [0,0,2],
        [0,-mountHoleDistance-mountClearance-5,0],
        [mountInset,-mountHoleDistance-mountClearance-5,2],
        [mountInset,bottom-micDiameter/2,0],
        [mountInset+20,bottom-micDiameter/2,0],
    ];
    difference(){
        polyRoundExtrude(radiiPoints, mountWidth, 2, 3 ,fn=8);
        translate(translateCuff)cylinder(d=micDiameter-cuffThickness*2, h=100);
        translate([minThickness,0,mountWidth-screwDiameter-1.1]){
            translate([0,-mountClearance,0])ScrewHole();
            translate([0,-mountClearance-mountHoleDistance,0])ScrewHole();
        }
    }
}

module CuffBrace () {
    translate(translateCuff){
        $fn=50;
        difference(){
            union() {
                rotate([0,0,-45])
                    translate([0,micDiameter/2-2,microphoneScrewDiameter+offset])rotate([-90,0,0])
                        cylinder(d1=microphoneScrewDiameter+12, d2=microphoneScrewDiameter+5, h=cuffThickness/2+5);
                linear_extrude(cuffHeight)offset(cuffThickness/2+tiny)offset(-(cuffThickness/3+tiny))
                    difference() {
                        circle(d=micDiameter);
                        circle(d=micDiameter-cuffThickness*2);
                        translate([-micDiameter-15,-micDiameter/2]) 
                            square([micDiameter, micDiameter]);
                        translate([-micDiameter,-micDiameter-15])
                            square([micDiameter*2, micDiameter]);

                    }
            }
            offset=10;
            rotate([0,0,-45])
                translate([0,-100,microphoneScrewDiameter+offset])
                    rotate([-90,0,0])
                        cylinder(d=microphoneScrewDiameter, h=200);
            rotate([0,0,45])
                translate([0,0,microphoneScrewDiameter+offset])
                    rotate([-90,0,0])
                        cylinder(d=30, h=200);
        }
    } 
}

union() {
    CuffBrace();

    BraceBody();
    translate([0,-7,mountWidth-0.3])cylinder(d=20, h=0.3);
    translate([30,-295,mountWidth-0.3])cylinder(d=20, h=0.3);
}

