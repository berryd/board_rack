/*
############## GROCERY LIST ##############
2x 1-3/8 poplar dowel
2x 8' 2x4
2x 8' 1x6x8

1x 1-3/8 wing drill bit
screws (1-3/4)
*/

shaft_d=1+3/8;
shaft_l=1*12;
angle=30;
shafts=6;

bottom_plank_w=6;
bottom_plank_t=1;
bottom_plank_h=8*12;

top_plank_w=3+3/4;
top_plank_t=1+3/4;
top_plank_h=(bottom_plank_h-(0.25*12));

rack_spacing = 16;

metric_conversion=24.5;

module shaft() {
	iter=(top_plank_h*metric_conversion-((0.5*12)*metric_conversion))/shafts;
echo(iter);
	for(i=[-shafts/2+1:shafts/2]) {
		translate([0,0,-i*iter]) rotate([90-angle,0,0]) 
			cylinder(r1=shaft_d/2*metric_conversion,r2=shaft_d/2*metric_conversion,shaft_l*metric_conversion);
	}
}

module rack_half() {
	cube([top_plank_w*metric_conversion,top_plank_t*metric_conversion,top_plank_h*metric_conversion],center=true);
	translate([0,top_plank_t/2*metric_conversion,0]) 
		cube([bottom_plank_w*metric_conversion,bottom_plank_t*metric_conversion,bottom_plank_h*metric_conversion],center=true);
	shaft();
}

module rack() {
	rack_half();
	translate([-rack_spacing*metric_conversion,0,0]) rack_half();
}

rack();

