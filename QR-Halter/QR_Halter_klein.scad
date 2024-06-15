
linear_extrude(height = 69) {
rotate([0,0,0])
import("qr-halter_klein.svg");
}
 
 translate([20, 9.5, 47]) {
     rotate([90, 90, 180])
    
linear_extrude(2)
    text( "Oberlab",size = 5,font = "Arial:style=Bold");

 }
 
 /*
 
  translate([16, 11,0])
 cube(size = [1,1,22], center = true/false);


  translate([20, 20,48])
 cube(size = [1,1,22], center = true/false);
 */