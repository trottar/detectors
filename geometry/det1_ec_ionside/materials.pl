use strict;
use warnings;
use materials;
use lib ("$ENV{GEMC}/io");
use utils;



our %configuration;

sub materials
{
	# Scintillator
	my %mat = init_mat();
	$mat{"name"}          = "scintillator";
	$mat{"description"}   = "ec scintillator material";
	$mat{"density"}       = "1.032";
	$mat{"ncomponents"}   = "2";
	$mat{"components"}    = "C 9 H 10";	
	print_mat(\%configuration, \%mat);

	
	
#	%mat = init_mat();
#	$mat{"name"}          = "PbWO4";
#	$mat{"description"}   = "Lead Tungsten";
#	$mat{"density"}       = "0.8280";
#	$mat{"ncomponents"}   = "6";
#	$mat{"components"}    = "G4_O 4 G4_W 1 G4_Pb 1";
#	print_mat(\%configuration, \%mat);

#G4int natoms;
#  // a = 16.00*g/mole;
#  // G4Element* elO  = new G4Element(name="Oxygen"  ,symbol="O" , z= 8., a);

#  a = 183.84*g/mole;
#  G4Element* elW = new G4Element(name="Tungsten" ,symbol="W",  z=74., a);

#  a = 207.20*g/mole;
#  G4Element* elPb = new G4Element(name="Lead"    ,symbol="Pb", z=82., a);

#  density = 8.280*g/cm3;
#  G4Material* PbWO4= new G4Material(name="PbWO4", density, ncomponents=3);
#  PbWO4->AddElement(elO , natoms=4);
#  PbWO4->AddElement(elW , natoms=1);
#  PbWO4->AddElement(elPb, natoms=1);


	
}

materials();

