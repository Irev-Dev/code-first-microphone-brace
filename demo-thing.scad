$fn=30;

union() {
    translate([2.5,0,0])rotate([0,-90,0])linear_extrude(5)polygon([
        [0, 2],
        [0, -2],
        [2, 0]
    ]);

    translate([0,0,2])rotate([10,0,0])translate([-2.5, -12, 0])cube([5, 24, 1]);
    translate([0, 10, 6.5])rotate([10,0,0])sphere(2);
    translate([0, -10, 3])rotate([10,0,0])sphere(2);

};
