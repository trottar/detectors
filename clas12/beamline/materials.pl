use strict;
use warnings;

our %configuration;


sub materials
{
	# Beamline_Tungsten
	my %mat = init_mat();
	$mat{"name"}          = "beamline_W";
	$mat{"description"}   = "beamline tungsten alloy 17.6 g/cm3";
	$mat{"density"}       = "17.6";
	$mat{"ncomponents"}   = "2";
	$mat{"components"}    = "G4_Fe 0.08 G4_W 0.92";
	print_mat(\%configuration, \%mat);
}






