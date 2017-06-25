clc 
clear all


% % ----- MUESTRA 1---------
% L1=43.31
% A1=47.63
% B1=14.12
% C1=sqrt(A1.^2+B1.^2)
% H1= atand(B1/A1)
% 
% 
% 
% % ----- MUESTRA 2---------
% L2=47.34
% A2=44.58
% B2=15.16
% C2=sqrt(A2.^2+B2.^2)
% H2= atand(B2/A2)
% 
% % ----------------CORBALAN------
% 
% DL=L2-L1
% DC=C2-C1
% DH=2(sqrt(C2*C1))*sind((H2-H1)/(2))
% 
% 
% %-------------- minolta ---------------------------
% 
% DL=L2-L1;
% DA=A2-A1;
% DB=B2-B1;
% DC=C2-C1;
% 
% 
% DEab=sqrt(DL^2+DA^2+DB^2)
% 
% DH=sqrt((DEab)^2-(DL)^2-(DC)^2)
% 
% 
% % ******************* dela cmc **********************************
% % ***************************************************************
% 

l=2;
c=1;

% ----- MUESTRA 1---------
L1=43.31
A1=47.63
B1=14.12
C1=sqrt(A1^2+B1^2)
H1= atand(B1/A1)

if H1 < 0
H1=H1+360
end

if H1 <= 0
H1=H1-360
end

% ----- MUESTRA 2---------
L2=47.34
A2=44.58
B2=15.16
C2=sqrt(A2^2+B2^2)
H2= atand(B2/A2)






DL=L2-L1;
DA=A2-A1;
DB=B2-B1;
DC=C2-C1;

DH=sqrt(DA^2+DB^2-DC^2);

% ------ SL--------
if L1<16
    SL=0.511;
elseif L1 >=16
         SL=(0.040975*L1)/((1)+(0.01765*L1));
end



SC=((0.0638*C1)/(1+0.0131*C1))+(0.638);


% ------ T--------
if 164 < H1 & H1 < 345
    T=0.56+(abs(0.2*cosd(H1+168)));

else
    T=0.36+(abs(0.4*cosd(H1+35)));
end

F=sqrt((C1^4)/(C1^4+1900));

SH=SC*(F*T+1-F);

DL = DL/(SL*l); 
DC = DC/(SC*c); 
DH = DH/SH; 

DE=sqrt((DL)^2 + (DC)^2+(DH)^2)

% DE=sqrt(((DL)/(l*SL))^2 + ((DC)/(c*SC))^2+(DH/SH)^2)


% DL
% DC
% DH

