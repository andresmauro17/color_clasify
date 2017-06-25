

function[delta1,delta2,delta3,diferencia]=fcn_delta(v1_muestra1,v2_muestra1,v3_muestra1,v1_muestra2,v2_muestra2,v3_muestra2);

delta1=v1_muestra2-v1_muestra1;
delta2=v2_muestra2-v2_muestra1;
delta3=v3_muestra2-v3_muestra1;

diferencia=sqrt(delta1^2+delta2^2+delta3^2)

