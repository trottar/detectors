use strict;
our %detector;
our %configuration;

use Getopt::Long;
use Math::Trig;

my $DetectorMother="root";

my $DetectorName = 'det1_tracker_iondownstream';

my $offset=70.9;

my $offset_inner=40.3;

sub det1_tracker_iondownstream
{
 my $NUM  = 3;
 my @z    = (450+$offset,500+$offset,550+$offset);
 my @Rin  = (6,7,7);
 my @Rout = (30,35,40);
 my @Xpos = (-26,-28,-31);
 my @Dz   = (1,1,1);
 my @name = ("1","2","3"); 
 my @mother = ("$DetectorMother","$DetectorMother","$DetectorMother"); 
# my @mat  = ("Vacuum","Vacuum","Vacuum");
 my @mat  = ("G4_Si","G4_Si","G4_Si");
 my @rot  = (0);
 my @x    = (0);
 my $DetectorNameD = 'det1_tracker_iondownstream';

 for(my $n=1; $n<=$NUM; $n++)
 {
    my %detector=init_det();
    $detector{"name"}        = "$DetectorNameD\_$name[$n-1]";
    $detector{"mother"}      = "$mother[$n-1]" ;
    $detector{"description"} = "$DetectorNameD\_$name[$n-1]";
    $detector{"pos"}        = "$Xpos[$n-1]*cm 0*cm $z[$n-1]*cm";
    $detector{"rotation"}   = "0*deg 0.05*rad 0*deg";   
#    $detector{"color"}      = "FF8000";
#    $detector{"color"}      = "FF8000";
    $detector{"color"}      = "09e5f4";
    $detector{"type"}       = "Tube";
    $detector{"dimensions"} = "$Rin[$n-1]*cm $Rout[$n-1]*cm $Dz[$n-1]*cm  10*deg 330*deg";
    $detector{"material"}   = $mat[$n-1];
    $detector{"mfield"}     = "no";
    $detector{"ncopy"}      = 1;
    $detector{"pMany"}       = 1;
    $detector{"exist"}       = 1;
    $detector{"visible"}     = 1;
    $detector{"style"}       = 1;
    $detector{"sensitivity"} = "flux";
    $detector{"hit_type"}    = "flux";
    my $id=82000+$n*100;
    $detector{"identifiers"} = "id manual $id";
     print_det(\%configuration, \%detector);
 }
}
