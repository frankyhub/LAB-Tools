//Platinenhalter 31.07.2021


//******* Parameter ********************
n="Lucky Wheel"; //Name
x=-23;      //Text-Position +>rechts
y=1.5;      //Platinen-Dicke
//**************************************





//*******Programm **********************

include <lib/std.scad>
difference(){
cuboid(
    [70,52,10], rounding=5,
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

translate([8,-4,3]) 
cube(size = [35 ,y,13],center = true);
    
    //Batterie
    translate([-12,11,22]) 
cube(size = [25.5 ,16.7,52],center = true);


}
color("SlateGray")
translate([x, -20,4])
linear_extrude(2)
text(n,  font = "Arial", size = 6);




