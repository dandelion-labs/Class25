//Class 25 Body

include <cab.scad>;
include <bogie.scad>;

panel_width=2;
body_height=26;
body_width=81-panel_width*2;
beam_width=6.5;
beam_height=12.5;

translate([-225,0,body_height]) showCab();
translate([225,0,body_height]) mirror([1,0,0]) showCab();

translate([-130,0,0]) showBogie();
translate([130,0,0]) mirror([1,0,0]) rotate([0,0,0]) showBogie();
frame();

module frame()
{
    //side beams - beams will need trimming/sanding down at ends to accomodate cab 3d prints
    translate([-210,body_width/2-beam_width,body_height]) beam(420);
    translate([-210,-body_width/2,body_height]) beam(420);
    
    //end beams
    color("orange")  
    {
        translate([-210,-body_width/2,body_height]) rotate([0,0,90]) beam(body_width);
        translate([210+beam_width,-body_width/2,body_height]) rotate([0,0,90]) beam(body_width);
    }
    
    //center beams
    color("orange")
    {
        translate([0+beam_width/2,-body_width/2+beam_width,body_height])
        rotate([0,0,90])
        beam(body_width-beam_width*2);
        
        translate([65+beam_width/2,-body_width/2+beam_width,body_height])
        rotate([0,0,90])
        beam(body_width-beam_width*2);
        
        translate([-65+beam_width/2,-body_width/2+beam_width,body_height])
        rotate([0,0,90])
        beam(body_width-beam_width*2);
        
    }
    //bogie beams
    color("orange")
    {
        translate([-130-beam_width,-body_width/2+beam_width,body_height])
        rotate([90,0,90])
        beam(body_width-beam_width*2);
       
        translate([-130-beam_width,-body_width/2+beam_width,body_height+beam_width])
        rotate([90,0,90])
        beam(body_width-beam_width*2);
        
        translate([130-beam_width,-body_width/2+beam_width,body_height])
        rotate([90,0,90])
        beam(body_width-beam_width*2);
       
        translate([130-beam_width,-body_width/2+beam_width,body_height+beam_width])
        rotate([90,0,90])
        beam(body_width-beam_width*2);
    }
}    

module beam(length)
{
    cube([length,beam_width,beam_height]);
    echo(Beam=length);
}
