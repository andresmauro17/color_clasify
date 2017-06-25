rango=0.3:-0.1:0.1;
 de=2.2
for i = 1:length(rango)
  division=de/rango(i)
  temp=uint8(division);
  grupo(i)=double(temp);
end


assignin('base','fila_captura',fila_captura)
% primera_fila=['l1','a1','b1','c1','h1','l2','a2','b2','c2','h2','dl','dc','dh','de',grupo_str]
