use strict;
use warnings;
our %detector;
our %configuration;
our %parameters;

use Getopt::Long;
use Math::Trig;

my $DetectorMother="root";

my $DetectorName = 'det1_tracker_vertex';
my $DetectorNameS = 'det1_tracker_vtxSupp';

my $offset=70.9;

my $VTX_offset=5;

my $Beampipe_outer=3.32;

sub det1_tracker_vertex
{
    my $Rin=$Beampipe_outer+0.5;


#--------------- VERTEX Support --------------------------

my $NUML  = 1;  
# my $NUMS  = $NUML;
 my $NUMS  = 0;
 my @zS    = ($VTX_offset,$VTX_offset,$VTX_offset,$VTX_offset,$VTX_offset,$VTX_offset);
# my @z    = (0,0,0,0);
 my @RinS  = ($Rin,     $Rin+1,     $Rin+3,     $Rin+5,     $Rin+10,     $Rin+14);
 my @RoutS = ($Rin+0.005,$Rin+1+0.005,$Rin+3+0.05,$Rin+5+0.05,$Rin+10+0.05,$Rin+14+0.05);
 my @DzS   = (10,11,18,24,36,40);
 my @nameS = ("1","2","3","4","5","6"); 
 my @motherS = ("$DetectorMother","$DetectorMother","$DetectorMother","$DetectorMother","$DetectorMother","$DetectorMother"); 
# my $matS  = ("Vacuum");
# my $rotBeam=0.025;
 my $rotBeam=0.0;
# my $NUM  = 2;
 my @z    = ($VTX_offset,$VTX_offset);
# my @z    = (0,0,0,0);
# my @Rin  = (3.00,5.00);
# my @Rout = (3.045,5.045);
# my @Dz   = (90,125);
# my @name = ("1","2"); 
 #my @mother = ("$DetectorMother","$DetectorMother"); 
# my $mat  = ("Air");

 my $matS  = ("G4_Si");

 for(my $n=1; $n<2; $n++)
 {


    my %detector=init_det();
    $detector{"name"}        = "$DetectorNameS\_$nameS[$n-1]";
    $detector{"mother"}      = "$motherS[$n-1]" ;
    $detector{"description"} = "$DetectorNameS\_$nameS[$n-1]";
    $detector{"pos"}        = "0*cm 0*cm $VTX_offset*cm";
    $detector{"rotation"}   = "0*deg $rotBeam*rad 0*deg";
 #   $detector{"color"}      = "fbc83c"; 
    $detector{"color"}      = "f9e7bb"; 
    $detector{"type"}       = "Tube";
    $detector{"dimensions"} = "$RinS[$n-1]*cm $RoutS[$n-1]*cm $DzS[$n-1]*cm 0*deg 360*deg";
    $detector{"material"}   = $matS;
    $detector{"mfield"}     = "no";
    $detector{"ncopy"}      = 1;
    $detector{"pMany"}       = 1;
    $detector{"exist"}       = 1;
    $detector{"visible"}     = 1;
    $detector{"style"}       = 1;
    $detector{"sensitivity"} = "flux";
    $detector{"hit_type"}    = "flux";
    my $id=61000+$n*100;
    $detector{"identifiers"} = "id manual $id";
     print_det(\%configuration, \%detector);
 }



}
