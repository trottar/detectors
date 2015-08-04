#!/usr/bin/perl -w

use strict;
use lib ("$ENV{GEMC}/io");
use utils;
use parameters;
use geometry;
use math;

use Math::Trig;

# Help Message
sub help()
{
	print "\n Usage: \n";
	print "   geometry.pl <configuration filename>\n";
 	print "   Will create the CLAS12 Central Time of Flight (ctof) using the variation specified in the configuration file\n";
 	print "   Note: The passport and .visa files must be present to connect to MYSQL. \n\n";
	exit;
}

# Make sure the argument list is correct
# If not pring the help
if( scalar @ARGV != 1)
{
	help();
	exit;
}

# Loading configuration file from argument
our %configuration = load_configuration($ARGV[0]);

# One can change the "variation" here if one is desired different from the config.dat
# $configuration{"variation"} = "myvar";

# To get the parameters proper authentication is needed.
our %parameters    = get_parameters(%configuration);

# Assign paramters to local variables
my $NUM_BARS = $parameters{"ctof_number_of_bars"};
my $dx1    =   $parameters{"bar_top_width"}*$inches/2.0;      # width at top,cm
my $dx2    =   $parameters{"bar_bottom_width"}*$inches/2.0;   # width at bottom, cm
my $dy     =   $parameters{"bar_length"}*$inches/2.0;         # length, cm
my $dz     =   $parameters{"bar_heigth"}*$inches/2.0;         # heigth, cm
my $theta0 = 360./$NUM_BARS;                                  # double the angle of one of the trapezoid sides

# midway between R_outer and R_inner - cm
my $R =  25.0 + $dz + 0.1;

build_mother();
build_paddles();


sub build_mother
{
	my %detector = init_det();
	
	$detector{"name"}        = "ctof";
	$detector{"mother"}      = "root";
	$detector{"description"} = "Central TOF Mother Volume";
	$detector{"pos"}         = "0*cm 0.0*cm 0*mm";
	$detector{"rotation"}    = "0*deg 0*deg 0*deg";
	$detector{"color"}       = "000000";
	$detector{"type"}        = "Tube";
	
	# allowing a gap to contain the paddles
	my $Rin        = $R - $dz - 0.1;
	my $Rout       = $R + $dz + 0.1;
	my $DZ         = $dy;
	
	$detector{"dimensions"}  = "$Rin*cm $Rout*cm $DZ*cm 0*deg 360*deg";
	$detector{"material"}    = "G4_AIR";
	$detector{"mfield"}      = "no";
	$detector{"visible"}     = 0;
	$detector{"style"}       = 0;
	print_det(\%configuration, \%detector);
}

sub build_paddles
{
	for(my $n=1; $n<=$NUM_BARS; $n++)
	{
		my $pnumber     = cnumber($n-1, 10);
		
		my %detector = init_det();

		$detector{"name"}        = "paddle_$pnumber";
		$detector{"mother"}      = "ctof" ;
		$detector{"description"} = "Central TOF Scintillator number $n";
		
		# positioning
		# The angle $theta is defined off the y-axis (going clockwise) so $x and $y are reversed
		my $theta  = ($n-1)*$theta0;
		my $theta2 = $theta + 90;
		my $x      = sprintf("%.3f", $R*cos(rad($theta)));
		my $y      = sprintf("%.3f", $R*sin(rad($theta)));
		my $z      = "0";
		$detector{"pos"}        = "$x*cm $y*cm $z*cm";
		$detector{"rotation"}   = "90*deg $theta2*deg 0*deg";
		$detector{"color"}      = "66bbff";
		$detector{"type"}       = "Trd";
		$detector{"dimensions"} = "$dx1*cm $dx2*cm $dy*cm $dy*cm $dz*cm";
		$detector{"material"}   = "scintillator";
		$detector{"visible"}     = 1;
		$detector{"style"}       = 1;
		$detector{"sensitivity"} = "ctof";
		$detector{"hit_type"}    = "ctof";
		$detector{"identifiers"} = "paddle manual $n";
		
		print_det(\%configuration, \%detector);
	}
}









