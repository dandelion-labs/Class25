//Class 25 Bogie - from 4mm/foot drawing


b_length=28.4; //half length of bogie frame
b_height=7; //height of bogie frame
b_width=3; //width of members //3
wf=22; //width of end frame
midline=(2*b_width+wf)/2; //midline of frame
b_scale=2.375; //Scaling from original 1:76 (00 gauge) -> 2.375 (1:32 Gauge 1)

//showBogie();

module showBogie()
{
	
    scale(b_scale)
    {
        showLeftFrame();
        showRightFrame();
        showEndFrames();
        showUnderFrame();
        showFrontMotor();
        showRearMotor();
        showBoss();
        showWheels();
        //showTrack();
    }
 
//wheel();
}

module sideFramePart()
{
   
   
    difference() {
        cube([b_length,b_width,b_height]);
         // tl cutout
        translate([0,0,5.6]) cube([12,b_width,b_height-5.6]);
        translate([12,0,5.6]) rotate([0,-38,0]) cube([2.3,b_width,2.3]);
        // bl cutout
        translate([0,0,0]) cube([12,b_width,b_height-5.6]); 
        translate([12-1.4,0,0.05]) rotate([0,45,0]) cube([1.9,b_width,1.9]);
         // tr cutout
        translate([b_length-4.6,0,b_height-2.4]) cube([4.6,b_width,b_height-2.4]);
        translate([b_length-4.5,0,b_height-2.4]) rotate([0,-58,0]) cube([4.5,b_width,4.5]);
        // br cutout
        translate([b_length-6.3,0,0]) cube([6.3,b_width,2.6]); 
        translate([b_length-6.3+1.5,0,0])  rotate([0,30,0]) cube([3,b_width,3]);
        // frame profile
        translate([b_length-14,0,0]) cube([14.6,1,b_height]);
        translate([5,-3,0])  rotate([0,0,6]) cube([9.8,b_width,b_height]);
         // hub cutout
        translate([14.9,0,0]) cube([4.3,2,5]);
        // frame cutouts
        translate([0,0,b_height/2-1.2]) cube([3.3,b_width/2,2.4]);
        translate([3.3,b_width/2,b_height/2]) rotate([90,0,0]) cylinder(h=b_width/2+1,d=2.4,center=false,$fn=20);
        translate([7.4,0,b_height/2-1.2]) cube([2.3,b_width,2.4]);
        translate([7.4,b_width+1,b_height/2]) rotate([90,0,0]) cylinder(h =b_width+1,d=2.4,center=false,$fn=20);
        translate([7.4+2.3,b_width+1,b_height/2]) rotate([90,0,0]) cylinder(h =b_width+1,d=2.4,center=false,$fn=20);
        //axel holes
        translate([14.9+2.15,b_width+1,2.5]) rotate([90,0,0]) cylinder(h =5,d=3/b_scale,center=false,$fn=10);
        // center beam screw holes
        translate([3.3,b_width,b_height/2]) rotate([90,0,0]) cylinder(h =b_width+1,d=1.8/b_scale,center=false,$fn=20);
        //end frame screw holes
        translate([b_length-1,b_width-1,0]) rotate([0,0,0]) cylinder(h =b_height,d=1.8/b_scale,center=false,$fn=20);
    }
  // color("red") translate([l-1,b_width,b_height/2]) rotate([90,0,0]) cylinder(h =b_width+1,d=1.8,center=false,$fn=20);
    //hub
    translate([14.9+0.5,1,0.5]) cube([3.3,1,4]);
    translate([14.9+2.15,1,2.5]) rotate([90,0,0]) cylinder(h =0.5,d=3,center=false,$fn=20);
    difference()
    {
        translate([15.8,1,-1]) cube([2.5,2,2]);
        translate([17.6,1,-1.5]) rotate([0,20,0]) cube([2,2,2]);
        translate([16.5,1,-1.5])  mirror(0,1,0)  rotate([0,20,0]) cube([2,2,2]);
    }

}

module sideUnderFramePart()
{
    difference(){
        translate([0,2,-2]) cube([14.9,1,2]);
        //corner cutout
        translate([11.9,2,-2])  rotate([0,70,0]) cube([3.3,1,3.3]);
        //frame cutouts
        offset=1.5;
        for(count=[0:2])
        {    
            translate([(count*3.8)+offset,2,-1.5]) cube([1.5,1,0.9]);
            translate([(count*3.8)+offset,3,-1.05]) rotate([90,0,0]) cylinder(h=1,d=0.9,center=false,$fn=20);
            translate([(count*3.8)+offset+1.5,3,-1.05]) rotate([90,0,0]) cylinder(h=1,d=0.9,center=false,$fn=20);
        }
    }
    translate([13.5,b_width-2.5,-0.5]) cube([7.1,b_width-0.5,0.5]);

}

module endFrame()
{
     translate([b_length-2,-midline+b_width,b_height/2-0.9]) cube([2,wf,2]);
    difference()
    { 
        translate([b_length-2,-midline+b_width-2,b_height/2-1.4]) cube([2,wf+4,0.5]);
        //screw holes
        translate([b_length-1,-midline+b_width-1,b_height/2-1.4]) cylinder(h =b_width,d=(1.8/b_scale),center=false,$fn=20);
        translate([b_length-1,midline-b_width+1,b_height/2-1.4]) cylinder(h =b_width,d=(1.8/b_scale),center=false,$fn=20);
    }
}

module underFramePart()
{
    difference()
    {
         translate([-5,-midline+b_width,2]) cube([10,2,3]);
         translate([-3.3,-midline+b_width+2,b_width/2]) rotate([90,0,0]) cylinder(h=b_width+3,d=1.5);
        translate([3.3,-midline+b_width+2,b_width/2]) rotate([90,0,0]) cylinder(h=b_width+3,d=1.5);
    }
    translate([-4,-midline+b_width+1.5,2]) rotate([-15,0,0]) cube([8,6,2]);
    translate([-4,0,0.5]) cube([8,4,2]);
}
module motorMount()
{
    //Absolute dimensions
    l=55;
    w=20;
    h=2;
    scale(1/b_scale) color("purple") translate([0,-w/2,1])
    {
        //base with hole
        difference()
        {
            cube([l,w,h]);
            translate([15,5,0]) cube([l-20,w/2,2]);
        }
        //back clip
        translate([l-2,0,2]) cube([2,w,2]);
        translate([l-3,0,4]) cube([3,w,2]);
        //side walls
        translate([0,0,2]) cube([35,2,2]); 
        translate([0,w-2,2]) cube([35,2,2]);
        //front clip
        translate([8,0,2]) cube([2,w,10.5]);
        translate([8,0,10.5]) cube([3,w,2]);
        
    }
}
module motor()
{
    //Absolute dimensions
    scale(1/b_scale) color("blue")
    {
        translate([-20,-8,0])
        {
        //base
        cube ([40,16,8.5]);
        translate([40,0,0]) cube([2,16,2]);
        //axel
        translate([30,37.5+8,3]) rotate([90,0,0]) cylinder(h=75,d=2.5,center=false);
        //motor housing
        translate([5,0,5]) rotate([0,10,0]) cube([25,16,20]);
        }
    }
}

module sandBox()
{
    color("pink")
    {
        difference()
        {
            translate([-b_length-2,-midline,b_height/2-4]) cube([6.4,b_width,7.7]);
            translate([-b_length-2.1,-midline-1.5,b_height/2+2.5]) rotate([-40,0,0]) cube([7,b_width/2,4]);
            translate([-b_length+1.5,-midline+0,b_height/2-4]) rotate([0,40,0]) cube([4,b_width,7]);
            translate([-b_length-5.5,-midline-0,b_height/2+4]) rotate([0,40,0]) cube([4,b_width+1,4]);
             translate([-b_length+2.5,-midline-0,b_height/2+4]) rotate([0,50,0]) cube([4,b_width+1,4]);
            translate([-b_length-0.5,-midline+1,-0.5])  cube([3,2,3.2]);
        }
        
    }
   //color("blue") translate([-l-0.5,-midline+1,-0.5])  cube([3,2,2.9]);
}

module wheel()
{
   dia=35.69; 
   translate([17.2,midline-2*b_width,2.5]) rotate([90,0,180])
    {
        scale(1/b_scale) //Absolute values
        difference()
        {
            union()
            { 
                difference(){
                    union()
                    {
                        cylinder(h=1.2,d1=dia+4,d2=dia,$fn=100);
                        translate([0,0,1]) cylinder(h=3.5,d1=dia,d2=dia-0.1,$fn=100);
                    }
                    translate([0,0,4]) cylinder(h=3,d1=dia-8,d2=dia-2);
                }
                translate([0,0,4]) cylinder(h=1,d=10);
            } 
            //axel
            cylinder(h=9,d=2.5);
        }
 
    }
}

module showWheels()
{
    wheel();
    mirror([1,0,0]) wheel();
    mirror([0,1,0]) wheel();
    mirror([0,1,0]) mirror([1,0,0]) wheel();
}


module showLeftFrame()
{
    //LH Frame side
    translate([0,-midline,0])
   {
        sideFramePart();
        sideUnderFramePart();
        mirror([1,0,0])  sideFramePart();
        mirror([1,0,0]) sideUnderFramePart(); 
   }  
   sandBox();
}

module showRightFrame()
{
    //RH Frame side
    mirror([0,1,0]) showLeftFrame();
    mirror([0,1,0]) sandBox();
}

module showEndFrames()
{
    //End frames
    endFrame();
    mirror(0,1,0) endFrame();
}

module showUnderFrame()
{
    difference()
    {
        union()
        {
            motorMount();
            mirror([1,0,0]) motorMount();
            underFramePart();
            mirror([0,1,0]) underFramePart();
        }
        cylinder(h=3,d=4,$fn=10);
    }
}

module showBoss()
{
    difference()
    {
        translate([0,0,2.5]) cylinder(h=6,d=7);
        cylinder(h=9,d=4,$fn=10);
    }
}

module showFrontMotor()
{
    translate([-12.8,0,1.3]) rotate([0,0,180]) motor();
}

module showRearMotor()
{
   translate([12.8,0,1.3])  motor();
}

module showTrack()
{
    color("green") scale(1/b_scale) //Absolute values
    {
        
        //translate([-150,-22.5-5,-17]) cube([300,3,5]);
        translate([-150,22.5,-17]) cube([300,3,5]);
       mirror([0,1,0]) translate([-150,22.5,-17]) cube([300,3,5]);
    }
}
