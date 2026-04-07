
/*
*******************************************
Objekt Info: USB-Kabelhalter

*******************************************
Version: 05.04.2026 khf

//***************   Auswahl   *************

keine

//*****************************************

//***************   Libraries  ************/
include <../lib/std.scad>
//*****************************************/

//***************  Parameter   *************

$fn=100;

//**************   Programm  **************/


difference() {
cuboid(
    [100,20,30], rounding=2,
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

union() {

cylinder(h = 40, r1 = 2.5, r2 = 2.5, center = true);
translate(v = [0, -7, 0]) {    
cube(size = [5,15,40], center = true); 
 
 }    
translate(v = [0, -1, 11]) {    
cube(size = [14,7,16], center = true); 
 } 
} 

union() {
translate(v = [-14, 0, 0]) {
cylinder(h = 40, r1 = 2.5, r2 = 2.5, center = true);
}   
translate(v = [-14, -7, 0]) {    
cube(size = [5,15,40], center = true); 
 
 }    
translate(v = [-14, -1, 11]) {    
cube(size = [17,7,16], center = true); 
 } 
}

union() {
translate(v = [-40, 0, 0]) {
cylinder(h = 40, r1 = 2.5, r2 = 2.5, center = true);
}   
translate(v = [-40, -7, 0]) {    
cube(size = [5,15,40], center = true); 
 
 }    
translate(v = [-40, -1, 11]) {    
cube(size = [14,7,16], center = true); 
 } 
}

union() {
translate(v = [-27, 0, 0]) {
cylinder(h = 40, r1 = 2.5, r2 = 2.5, center = true);
}   
translate(v = [-27, -7, 0]) {    
cube(size = [5,15,40], center = true); 
 
 }    
translate(v = [-27, -1, 11]) {    
cube(size = [14,7,16], center = true); 
 } 
}

union() {
translate(v = [14, 0, 0]) {
cylinder(h = 40, r1 = 2.5, r2 = 2.5, center = true);
}   
translate(v = [14, -7, 0]) {    
cube(size = [5,15,40], center = true); 
 
 }    
translate(v = [14, -1, 11]) {    
cube(size = [14,7,16], center = true); 
 } 
} 

union() {
translate(v = [27, 0, 0]) {
cylinder(h = 40, r1 = 2.5, r2 = 2.5, center = true);
}   
translate(v = [27, -7, 0]) {    
cube(size = [5,15,40], center = true); 
 
 }    
translate(v = [27, -1, 11]) {    
cube(size = [14,7,16], center = true); 
 } 
} 

union() {
translate(v = [40, 0, 0]) {
cylinder(h = 40, r1 = 2.5, r2 = 2.5, center = true);
}   
translate(v = [40, -7, 0]) {    
cube(size = [5,15,40], center = true); 
 
 }    
translate(v = [40, -1, 11]) {    
cube(size = [14,7,16], center = true); 
    } 
   }
  }

