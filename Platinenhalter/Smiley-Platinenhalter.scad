//Platinenhalter 31.07.2021


//******* Parameter ********************
n="Smiley"; //Name
x=-12.5;      //Text-Position +>rechts
y=1.6;      //Platinen-Dicke
//**************************************





//*******Programm **********************

include <lib/std.scad>
difference(){
cuboid(
    [70,35,10], rounding=5,
    edges=[
    TOP+FRONT,
    TOP+BACK,
    TOP+LEFT,
    TOP+RIGHT,
    FRONT+RIGHT,
    FRONT+LEFT, 
    BACK+LEFT,
    BACK+RIGHT    
    ],
    $fn=60
);

translate([0,9,3]) 
cube(size = [54,y,13],center = true);

}
color("SlateGray")
translate([x, -10.5,4])
linear_extrude(2)
text(n,  font = "Arial", size = 6);
