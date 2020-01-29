#!/usr/bin/perl -w

use strict;
use warnings;
#use lib ("$ENV{GEMC}/api/perl");
use lib ("$ENV{GEMC}/io");
use utils;
use materials;



our %configuration;


sub define_materials
{
	# uploading the mat definition
	

  #      Carbon dioxide, STP
	my %mat = init_mat();
	$mat{"name"}          = "CO2";
	$mat{"description"}   = " Carbon dioxide";
     #   my $g=1.977*(273.)/(293.)/(1000.);
	$mat{"density"}       = "0.00184205";
	$mat{"ncomponents"}   = "2";
	$mat{"components"}    = "C 1  O 2";
	print_mat(\%configuration, \%mat);


	# Ar10C02
	%mat = init_mat();
	$mat{"name"}          = "Ar10CO2";
	$mat{"description"}   = "Argon GEM gas ";
	$mat{"density"}       = "0.001802";
	$mat{"ncomponents"}   = "2";
	$mat{"components"}    = "G4_Ar 0.90 CO2 0.10 ";
	print_mat(\%configuration, \%mat);

	
}
define_materials();
