$fn=60;
color("SlateGray")

difference(){
cylinder(h = 6, d=10, center = true);
cylinder(h = 9, d=7, center = true);
translate(v = [-2, 2, -4.5])

cube(size = [2,9,9]);
}
color("SlateGray")
translate(v = [-5, -3, -3])
cube(size = [1,6,6]);



