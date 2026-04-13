
/*
*******************************************
Objekt Info: Halterung für Kantenfräser

*******************************************
Version: 13.04.2026 khf

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
    [140,32,15], rounding=2,
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
translate(v = [-61, 0, 0]) {
cylinder(h = 40, r1 = 5, r2 = 5, center = true);

 }  
}    
 
//******************************************

//******************************************

union() { //6mm Loch
translate(v = [-31, 0, 0]) {
cylinder(h = 40, r1 = 5, r2 = 5, center = true);
 }    
} 
//******************************************

//******************************************

union() { //6.35mm Loch
translate(v = [-5, 0, 0]) {
cylinder(h = 40, r1 = 5, r2 = 5, center = true);
translate(v = [0, -1, 0]) {    
cylinder(h = 40, r1 = 2.5, r2 = 2.5, center = true); 
  }  
 }    
} 

//******************************************

//******************************************

union() { //4.76mm Loch
translate(v = [18, 0, 0]) {
cylinder(h = 40, r1 = 5, r2 = 5, center = true);
 }    
} 

//******************************************

//******************************************

union() { //3.17mm Loch
translate(v = [38, 0, 0]) {
cylinder(h = 40, r1 = 5, r2 = 5, center = true);
    }  
  }    
}
//******************************************

//******************************************
//******************************************

// 9.52mm Beschriftung
rotate([90,180,0]) { 
union() {
translate(v = [163, 3, 10]) {

//******* Parameter ********************
n="9.52"; //Name
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
// 7.96mm Beschriftung
rotate([90,180,0]) { 
union() {
translate(v = [134, 3, 10]) {

//******* Parameter ********************
n="7.96"; //Name
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
// 6.35mm Beschriftung
rotate([90,180,0]) { 
union() {
translate(v = [113.5, 3, 10]) {

//******* Parameter ********************
n="6.35"; //Name
//**************************************
color("SlateGray")
translate([-117, -5.5,4])
linear_extrude(3)
text(n,  font = "Arial", size = 6);
  }
 } 
}
//******************************************

//******************************************
// 4.76mm Beschriftung
rotate([90,180,0]) { 
union() {
translate(v = [89, 3, 10]) {

//******* Parameter ********************
n="4.76"; //Name
//**************************************
color("SlateGray")
translate([-115, -5.5,4])
linear_extrude(3)
text(n,  font = "Arial", size = 6);
  }
 } 
}
//******************************************

//******************************************
// 3.17mm Beschriftung
rotate([90,180,0]) { 
union() {
translate(v = [67, 3, 10]) {

//******* Parameter ********************
n="3.17"; //Name
//**************************************
color("SlateGray")
translate([-114, -5.5,4])
linear_extrude(3)
text(n,  font = "Arial", size = 6);
  }
 } 
}
//******************************************

/*
translate(v = [-61, 23, -10]) {
cylinder(h = 4, d=30, center = true);
}

translate(v = [-31, 23, -10]) {
cylinder(h = 4, d=25, center = true);
}

translate(v = [-5, 23, -10]) {
cylinder(h = 4, d=22, center = true);
}



translate(v = [18, 23, -10]) {
cylinder(h = 4, d=20, center = true);
}

translate(v = [38, 23, -10]) {
cylinder(h = 4, d=16, center = true);
}
*/