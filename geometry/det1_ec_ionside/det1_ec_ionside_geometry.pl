use strict;
our %detector;
our %configuration;

use Getopt::Long;
use Math::Trig;

my $DetectorMother="root";

my $DetectorName = 'det1_ec_ionside';

my $offset=70.9;

my $offset_inner=40.3;

sub det1_ec_ionside
{
 my $NUM  = 1;
# my $myz=412.5;
 my $myz=430.5;
 
 my @z    = ( $myz-30+$offset);
 my @Rin1  = (40);
 my @Rout1 = (240);
 my @Rin2  = (45);
 my @Rout2 = (240); 
 my @Dz   = (20);
 my @name = (""); 
 my @mother = ("$DetectorMother"); 
# my @mat  = ("Kryptonite");
# my @mat  = ("PbWO4");
 my @mat  = ("G4_Fe");
 my @rot  = (0);

 for(my $n=1; $n<=$NUM; $n++)
 {
    my %detector=init_det();
    $detector{"name"}        = "$DetectorName\_$name[$n-1]";
    $detector{"mother"}      = "$mother[$n-1]" ;
    $detector{"description"} = "$DetectorName\_$name[$n-1]";
    $detector{"pos"}        = "-23*cm 0*cm $z[$n-1]*cm";
    $detector{"rotation"}   = "$rot[$n-1]*deg 0*deg 0*deg";
    $detector{"color"}      = "0000FF"; #blue
    $detector{"type"}       = "Cons";
    $detector{"dimensions"} = "$Rin1[$n-1]*cm $Rout1[$n-1]*cm $Rin2[$n-1]*cm $Rout2[$n-1]*cm $Dz[$n-1]*cm 0*deg 360*deg";
    $detector{"material"}   = $mat[$n-1];    
#     $detector{"type"}       = "Tube";
#     $detector{"dimensions"} = "$Rin[$n-1]*cm $Rout[$n-1]*cm $Dz[$n-1]*cm 0*deg 360*deg";
#     $detector{"material"}   = $mat[$n-1];
    $detector{"mfield"}     = "no";
    $detector{"ncopy"}      = 1;
    $detector{"pMany"}       = 1;
    $detector{"exist"}       = 1;
    $detector{"visible"}     = 1;
    $detector{"style"}       = 1;
    $detector{"sensitivity"} = "no";
    $detector{"hit_type"}    = "no";
    $detector{"identifiers"} = "no";
     print_det(\%configuration, \%detector);
 }
}
