

#this program is for I3- calculate the potential 

$charge[1] = -0.347862;
$charge[2] =  0.078145;
$charge[3] = -0.460566;
$charge[4] =  0.078145;
$charge[5] = -0.347862;

@coord1 = (0.0 , 0.0 ,  -12.1);
@coord2 = (0.0 , 0.0 ,  -9.14);
@coord3 = (0.0 , 0.61184 ,  -6.05);
@coord4 = (0.0 , 0.0 ,  -2.96);
@coord5 = (0.0 , 0.0 ,  0.0);

#print "$coord1[2]\n";


#atomic unit constant

#$epsilon = 8.854187 * (10 **(-12)) ;
$epsilon = 1,0;
$pi = 3.14159265359 ;
$k = (4 * $pi * $epsilon)**(-1) ;

$bohrrev = (0.529177)**(-1) ;

for ($i = 1 ; $i < 101 ; $i++){
    
    $dis = 0.1 * $i ;

#   calculate distance
   $R[1] = ( (0.0 - $coord1[0])**2 + (0.0 - $coord1[1])**2 + ($dis - $coord1[2])**2 ) ** 0.5  * $bohrrev;
   $R[2] = ( (0.0 - $coord2[0])**2 + (0.0 - $coord2[1])**2 + ($dis - $coord2[2])**2 ) ** 0.5  * $bohrrev;
   $R[3] = ( (0.0 - $coord3[0])**2 + (0.0 - $coord3[1])**2 + ($dis - $coord3[2])**2 ) ** 0.5  * $bohrrev;
   $R[4] = ( (0.0 - $coord4[0])**2 + (0.0 - $coord4[1])**2 + ($dis - $coord4[2])**2 ) ** 0.5  * $bohrrev;
   $R[5] = ( (0.0 - $coord5[0])**2 + (0.0 - $coord5[1])**2 + ($dis - $coord5[2])**2 ) ** 0.5  * $bohrrev;

    $pot[$i] = $k * ( $charge[1] / $R[1] + $charge[2] / $R[2] + $charge[3] / $R[3] + $charge[4] / $R[4] + $charge[5] / $R[5] ) ;

    print "$pot[$i] \n";
    }





