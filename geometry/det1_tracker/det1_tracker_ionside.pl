use strict;
use warnings;
our %detector;
our %configuration;
our %parameters;

use Getopt::Long;
use Math::Trig;

my $DetectorMother="root";

my $DetectorName = 'det1_tracker_ionsideGEM';

my $offset=70.9;

my $offset_inner=40.3;

sub det1_tracker_ionside
{
 my $myz=440.5;
 my $mymyz1    = ($myz-70+$offset-3);
 my $mymyz2    = ($myz-85+$offset-3);
 my $NUM  = 8;
# my @z    = (215,222,226,231,236,241,246,$mymyz1,$mymyz2);
 my @z    = (222,226,231,236,241,246,$mymyz1,$mymyz2);
# my @Rin  = (5,6,15,13,13,13,14,14,14,25,25);
 my @Rin  = (13,13,13,14,14,14,25,25);
# my @Rout = (30,32,95,97,100,105,110,113,115,180,180);
 my @Rout = (97,100,105,110,113,115,180,180);
 my @Dz   = (1,1,1,1,1,1,5,5);
 my @name = ("1","2","3","4","5","6","7","8"); 
 my @mother = ("$DetectorMother","$DetectorMother","$DetectorMother","$DetectorMother","$DetectorMother","$DetectorMother","$DetectorMother","$DetectorMother"); 
 my $mat  = ("Ar10CO2");

 for(my $n=1; $n<=$NUM; $n++)
 {
    my %detector=init_det();
    $detector{"name"}        = "$DetectorName\_$name[$n-1]";
    $detector{"mother"}      = "$mother[$n-1]" ;
    $detector{"description"} = "$DetectorName\_$name[$n-1]";
    $detector{"pos"}        = "-5*cm 0*cm $z[$n-1]*cm";
    $detector{"rotation"}   = "0*deg 0*deg 0*deg";
    $detector{"color"}      = "FF8000"; 
    $detector{"type"}       = "Tube";
    $detector{"dimensions"} = "$Rin[$n-1]*cm $Rout[$n-1]*cm $Dz[$n-1]*cm 0*deg 360*deg";
    $detector{"material"}   = $mat;
    $detector{"mfield"}     = "no";
    $detector{"ncopy"}      = 1;
    $detector{"pMany"}       = 1;
    $detector{"exist"}       = 1;
    $detector{"visible"}     = 1;
    $detector{"style"}       = 1;
    $detector{"sensitivity"} = "flux";
    $detector{"hit_type"}    = "flux";
    my $id=72000+$n*100;
    $detector{"identifiers"} = "id manual $id";
     print_det(\%configuration, \%detector);
 }

 


}
