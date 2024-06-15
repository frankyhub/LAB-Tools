
//difference() {
linear_extrude(height = 69) {
rotate([0,0,0])
import("QR-Halter_gross.svg");
}
 
 translate([27, 9.5, 47]) {
     rotate([90, 90, 180])
    
linear_extrude(3)
    text( "Oberlab",size = 5,font = "Arial:style=Bold");

 }
 
  /*
 $fn=80;
 rotate([33, 90, 0])
   translate([-35, 35,-10])
 color( "red", 1.0 )
 cylinder(h = 6, r1 = 20, r2 = 20);
// }

 
  translate([16, 11,0])
 cube(size = [1,1,22], center = true/false);


  translate([20, 20,48])
 cube(size = [1,1,22], center = true/false);
 */