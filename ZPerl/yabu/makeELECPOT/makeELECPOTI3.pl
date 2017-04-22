

#this program is for I3- calculate the potential 

$charge[1] = -0.54657 ;
$charge[2] =  0.093139;
$charge[3] = -0.54657 ;

@coord1 = (0.0 , 0.0 , -5.8);
@coord2 = (0.0 , 0.0 , -2.9);
@coord3 = (0.0 , 0.0 ,  0.0);

#print "$coord1[2]\n";


#atomic unit constant

#$epsilon = 8.854187 * (10 **(-12)) ;
$epsilon = 1,0;
$pi = 3.14159265359 ;
$k = (4 * $pi * $epsilon)**(-1) ;

$bohrrev = (0.529177)**(-1) ;

for ($i = 1 ; $i < 101 ; $i++){
    
    $dis = 0.1 * $i ;

    $pot[$i] = $k * ( $charge[1] / (($dis - $coord1[2])*$bohrrev) + $charge[2] / (($dis - $coord2[2])*$bohrrev) + $charge[3] / (($dis - $coord3[2])*$bohrrev) ) ;

    print "$pot[$i] \n";
    }





