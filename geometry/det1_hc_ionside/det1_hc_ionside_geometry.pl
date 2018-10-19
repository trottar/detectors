use strict;
our %detector;
our %configuration;

use Getopt::Long;
use Math::Trig;

my $DetectorMother="root";

my $DetectorName = 'det1_hc_ionside';

my $offset=70.9;

my $offset_inner=40.3;

sub det1_hc_ionside
{
 my $NUM  = 10;
#  my @z    = (412.5-30+$offset);
#  my @z    = (500+$offset);
# my $z    = 574.2698253;
 my $z    =  520;
#  my @Rin  = (50);
#   my @Rin  = (60);
#  my @Rout = (300);
#  my @Rout1 = (250);

###  my @Rin1  = (45);
### my @Rout1 = (300);
###  my @Rin2  = (60);
### my @Rout2 = (300); 
#  my @Dz   = (29);
 my $Dz   = 5;
# my @name = (""); 
 my @mother = ("$DetectorMother"); 
 my @mat  = ("G4_Fe");
 my @rot  = (0);

 for(my $n=1; $n<=$NUM; $n++)
 {
 
    my  $Rin1 = 45+($n-1)*1;
    my  $Rin2 = 46+($n-1)*1;
 
    my  $Rout1 = 300;
    my  $Rout2 = 300;
    my $z1=$z+ ($n-1)*($Dz+7); 

    print "*************   $n,$Rin1, $Rout1 $z1 \n" ;
    my $name1 =("iron_hcap\_$n");


    my %detector=init_det();
    $detector{"name"}        = "$DetectorName\_$name1";
    $detector{"mother"}      = "$mother[0]" ;
    $detector{"description"} = "$DetectorName\_$name1";
    $detector{"pos"}        = "-25*cm 0*cm $z1*cm";
    $detector{"rotation"}   = "$rot[0]*deg 0*deg 0*deg";
#     $detector{"color"}      = "008080"; #blue
    $detector{"color"}      = "9900CC";
    $detector{"type"}       = "Cons";
    $detector{"dimensions"} = "$Rin1*cm $Rout1*cm $Rin2*cm $Rout2*cm $Dz*cm 0*deg 360*deg";
    $detector{"material"}   = $mat[0];
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
