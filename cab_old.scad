use <arc_sectors.scad>;
//linear_extrude(length) arc(radius,[start_angle,end_angle],width,fn);

function toscale(x)=x*2.375; //Scale 00 to gauge 1

w=toscale(34/2); //Width of cab (/2)
h=toscale(33);    //Height of cab
c_cab=toscale(13.5); //mid height of cab (where cab goes from vertical to sloped)
t_cab=toscale(27); //Top of cab (under roof)
corner_rad=toscale(2); //radius of panel corners

cab();
mirror([0,1,0]) cab();

/*
    color("blue")
    //translate([20,20,50])
    linear_extrude(toscale(1))
    polygon([[0,0],[0,10],[10,10],[10,0]]);
*/

module cab()
{
    //Top reference
    //color("red") translate([0,0,t_cab]) cube([100,100,1]);
    
    //lower front panel
    cube([toscale(1),w-corner_rad,c_cab]);
    
    //lower side panel
    translate([corner_rad,w-toscale(1),0])
    cube([toscale(14.5)-corner_rad,toscale(1),c_cab]);
    
    //lower corner
    translate([corner_rad,w-corner_rad,0])
    rotate([0,0,90])
    linear_extrude(c_cab)
    arc(corner_rad/2,[0,90],toscale(1),50);
    
    //upper front panel
    translate([0,0,c_cab])
    rotate ([0,10,0])
    cube([toscale(1),w-corner_rad,toscale(10)]);
    
    //upper side panel
    translate([corner_rad,w,c_cab])
    rotate([90,0,0])
    linear_extrude(toscale(1))
    polygon([[0,0],[toscale(14.5)-corner_rad,0],[toscale(14.5)-corner_rad,toscale(10)],[toscale(1.8),toscale(10)]]);
    
    //upper corner
    translate([corner_rad,w-corner_rad,c_cab-toscale(0.3)])
    rotate([10,0,90])
    linear_extrude(t_cab-c_cab-toscale(3.1))
    arc(corner_rad/2,[0,90],toscale(1),50);
    
    //upper cab curve
    translate([-7.5,0,t_cab-88]) 
    rotate([0,-80,0]) 
    linear_extrude(toscale(1))
    arc(toscale(33.7),[0,24],toscale(3.7),50);
    
    //Front roof curve
    roof_rad=toscale(3);
    color("blue")
    
    translate([roof_rad+toscale(2.5),0,t_cab-toscale(4)])
    rotate([90,280,0])
    linear_extrude(w-corner_rad)
    arc(roof_rad,[0,90],toscale(1),50);

}
