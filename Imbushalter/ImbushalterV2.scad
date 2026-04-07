
/*
*******************************************
Objekt Info: Imbushalter

*******************************************
Version: 06.04.2026 khf

//***************   Auswahl   *************

keine

//*****************************************

//***************   Libraries  ************/
include <../lib/std.scad>
//*****************************************/

//***************  Parameter   *************

$fn=100;

//**************   Programm  **************/


difference() {translate(v = [-13, 0, 0]) {
cuboid(
    [120,30,15], rounding=2,
    edges=[
    TOP+FRONT,
    //TOP+BACK,
    TOP+LEFT,
    TOP+RIGHT,

    DOWN+FRONT,
    DOWN+BACK,
    DOWN+LEFT,
    DOWN+RIGHT,

    FRONT+RIGHT,
    FRONT+LEFT,

    //BACK+LEFT,
    //BACK+RIGHT,

    ]
  );
  }
  

//******************************************
union() { //10mm Loch
translate(v = [-60, 3, 0]) {
cylinder(h = 40, r1 = 6, r2 = 6, center = true);
translate(v = [0, -1, 0]) {    
cylinder(h = 40, r1 = 6, r2 = 6, center = true); 
 }  
 }    
} 
//******************************************

union() { //8mm Loch
translate(v = [-43, 3, 0]) {
cylinder(h = 40, r1 = 5, r2 = 5, center = true);
translate(v = [0, -1, 0]) {    
cylinder(h = 40, r1 = 5, r2 = 5, center = true); 
 }  
 }    
} 

//******************************************

//******************************************

union() { //6mm Loch
translate(v = [-28, 3, 0]) {
cylinder(h = 40, r1 = 4, r2 = 4, center = true);
translate(v = [0, -1, 0]) {    
cylinder(h = 40, r1 = 4, r2 = 4, center = true); 
 }  
 }    
} 

//******************************************

//******************************************

union() { //5mm Loch
translate(v = [-16, 3, 0]) {
cylinder(h = 40, r1 = 3, r2 = 3, center = true);
translate(v = [0, -1, 0]) {    
cylinder(h = 40, r1 = 3, r2 = 3, center = true); 
 }  
 }    
} 

//******************************************

//******************************************

union() { //4mm Loch
translate(v = [-5, 3, 0]) {
cylinder(h = 40, r1 = 2.5, r2 = 2.5, center = true);
translate(v = [0, -1, 0]) {    
cylinder(h = 40, r1 = 2.5, r2 = 2.5, center = true); 
 }  
 }    
} 

//******************************************




//******************************************

union() { //3mm Loch
translate(v = [6, 3, 0]) {
cylinder(h = 40, r1 = 2, r2 = 2, center = true);
translate(v = [0, -0.5, 0]) {    
cylinder(h = 40, r1 = 2, r2 = 2, center = true); 
 }  
 }    
} 

//******************************************


//******************************************

union() { //2.5mm Loch
translate(v = [17, 3, 0]) {
cylinder(h = 40, r1 = 2, r2 = 2, center = true);
translate(v = [0, -0.5, 0]) {    
cylinder(h = 40, r1 = 2, r2 = 2, center = true); 
 }  
 }    
} 

//******************************************

//******************************************

union() { //2mm Loch
translate(v = [27, 3, 0]) {
cylinder(h = 40, r1 = 2, r2 = 2, center = true);
translate(v = [0, -0.5, 0]) {    
cylinder(h = 40, r1 = 2, r2 = 2, center = true); 
 }  
 }    
} 

//******************************************

//******************************************

union() { //1.5mm Loch
translate(v = [38, 3, 0]) {
cylinder(h = 40, r1 = 2, r2 = 2, center = true);
translate(v = [0, -0.5, 0]) {    
cylinder(h = 40, r1 = 2, r2 = 2, center = true); 
 }  
 }    
} 

//******************************************


}

//******************************************
//******************************************

// 10mm Beschriftung
rotate([90,180,0]) { 
union() {
translate(v = [165, 3, 9]) {

//******* Parameter ********************
n="10"; //Name
//**************************************
color("SlateGray")
translate([-111, -5.5,4])
linear_extrude(3)
text(n,  font = "Arial", size = 6);
}
} 
}
//******************************************

//******************************************
// 8mm Beschriftung
rotate([90,180,0]) { 
union() {
translate(v = [152, 3, 9]) {

//******* Parameter ********************
n="8"; //Name
//**************************************
color("SlateGray")
translate([-111, -5.5,4])
linear_extrude(3)
text(n,  font = "Arial", size = 6);
}
} 
}
//******************************************

//******************************************
// 6mm Beschriftung
rotate([90,180,0]) { 
union() {
translate(v = [137, 3, 9]) {

//******* Parameter ********************
n="6"; //Name
//**************************************
color("SlateGray")
translate([-111, -5.5,4])
linear_extrude(3)
text(n,  font = "Arial", size = 6);
}
} 
}
//******************************************

//******************************************
// 5mm Beschriftung
rotate([90,180,0]) { 
union() {
translate(v = [124.5, 3, 9]) {

//******* Parameter ********************
n="5"; //Name
//**************************************
color("SlateGray")
translate([-111, -5.5,4])
linear_extrude(3)
text(n,  font = "Arial", size = 6);
}
} 
}
//******************************************

//******************************************
// 4mm Beschriftung
rotate([90,180,0]) { 
union() {
translate(v = [113.5, 3, 9]) {

//******* Parameter ********************
n="4"; //Name
//**************************************
color("SlateGray")
translate([-111, -5.5,4])
linear_extrude(3)
text(n,  font = "Arial", size = 6);
}
} 
}
//******************************************


//******************************************
// 3mm Beschriftung
rotate([90,180,0]) { 
union() {
translate(v = [104, 3, 9]) {

//******* Parameter ********************
n="3"; //Name
//**************************************
color("SlateGray")
translate([-111, -5.5,4])
linear_extrude(3)
text(n,  font = "Arial", size = 6);
}
} 
}
//******************************************

//******************************************
// 2.5mm Beschriftung
rotate([90,180,0]) { 
union() {
translate(v = [89, 3, 9]) {

//******* Parameter ********************
n="2.5"; //Name
//**************************************
color("SlateGray")
translate([-111, -5.5,4])
linear_extrude(3)
text(n,  font = "Arial", size = 6);
}
} 
}
//******************************************

//******************************************
// 2mm Beschriftung
rotate([90,180,0]) { 
union() {
translate(v = [82, 3, 9]) {

//******* Parameter ********************
n="2"; //Name
//**************************************
color("SlateGray")
translate([-111, -5.5,4])
linear_extrude(3)
text(n,  font = "Arial", size = 6);
}
} 
}
//******************************************

//******************************************
// 1.5mm Beschriftung
rotate([90,180,0]) { 
union() {
translate(v = [67, 3, 9]) {

//******* Parameter ********************
n="1.5"; //Name
//**************************************
color("SlateGray")
translate([-111, -5.5,4])
linear_extrude(3)
text(n,  font = "Arial", size = 6);
}
} 
}
//******************************************


