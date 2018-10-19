use strict;
use warnings;
our %detector;
our %configuration;
our %parameters;

use Getopt::Long;
use Math::Trig;

my $DetectorMother="root";

my $DetectorName = 'det1_beamline_pipe_eleside';

sub det1_beamline_pipe_eleside
{
my $NUM  = 7;
my @name=(
"VertexChamber","VertexFlare","VertexExitWindow","EleExitAperture","IonExtranceAperture","IonBeamPipe","EleBeamPipe",
);
my @mother = (
"$DetectorMother","$DetectorMother","$DetectorMother","$DetectorName\_VertexExitWindow","$DetectorName\_VertexExitWindow","$DetectorMother","$DetectorMother",
);
my @mat  = (
"G4_Be",  "G4_Be",      "G4_Al",          "G4_Galactic",     "G4_Galactic",        "G4_Al",   "G4_Al",
);
my @x    = (
0,        0,              0,              -1.3650*tan(0.025),  1.3650*tan(0.025),     0,     0,
);
my @z1    = (
-0.06,   -1.28 ,      -1.28 -0.002/2,    -1.28-0.002/2,        -1.28-0.002/2,       -3.5948,  -1.6,
);
my @z2    = (
0+0.15,    -0.06,     -1.28 +0.002/2,    -1.28 +0.002/2,       -1.28+0.002/2,       -1.28,  -1.28,
);
my @Rin1  = (
32.2,      62.1,            0,             0,                      0,                 30.0,     20.0,
);
my @Rout1  = (
32.2+1,    62.1+2,         0+56.0,        21.0,                   21.0,               30.0+2,   20.0+1,
);
my @Rin2  = (
32.2,       32.2,         0,              0,                       0,                 20.0,     20.0,
);
my @Rout2  = (
32.2+1,     32.2+1,        0+56.0,        21.0,                   21.0,               20.0+1,   20.0+1,
);
my @rot  = (
0.0,      0.025,            0.025,         0,                      0,                   0.050,    0,
);
my @color = (
"fbc83c","8b9494","8b9494","f5ecd9","f5ecd9","8b9494","8b9494",
);

 for(my $n=1; $n<=$NUM; $n++)
 {
    my %detector=init_det();
    $detector{"name"}        = "$DetectorName\_$name[$n-1]";
    $detector{"mother"}      = "$mother[$n-1]" ;
    $detector{"description"} = "$DetectorName\_$name[$n-1]";
    $detector{"pos"}        = "$x[$n-1]*m 0*m 0*m";
    $detector{"rotation"}   = "0*rad $rot[$n-1]*rad 0*rad";
    $detector{"color"}      = $color[$n-1]; 
    $detector{"type"}       = "Polycone";
    $detector{"dimensions"} = "0*deg 360*deg 2*counts $Rin1[$n-1]*mm $Rin2[$n-1]*mm $Rout1[$n-1]*mm $Rout2[$n-1]*mm $z1[$n-1]*m $z2[$n-1]*m";    
    $detector{"material"}   = $mat[$n-1];
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
1;
