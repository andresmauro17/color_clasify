clc 
clear all



% ----- MUESTRA 1---------
% L1=43.31
% A1=47.63
% B1=14.12

L1=71.8746
A1=-31.1827
B1=34.6002


% ----- MUESTRA 2---------
% L2=47.34
% A2=44.58
% B2=15.16

L2=67.8047
A2=-37.0901
B2=39.7973


lab1=[L1,A1,B1]
lab2=[L2,A2,B2]
paral=2;
parac=1;

[de,dl,dc,dh] = cmcde(lab1,lab2,paral,parac)

[DE,DL,DC,DH] = fcn_delta_cmc(L1,A1,B1,L2,A2,B2,paral,parac) 
