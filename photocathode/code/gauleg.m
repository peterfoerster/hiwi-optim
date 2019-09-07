%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calcola i nodi e i pesi per la formula di quadratura di 
% Gauss_Legendre di ordine n in un intervallo (a,b) 
% INPUT: a primo estremo dell'intervallo
%        b secondo estremo dell'intervallo  
%        n numero dei nodi
% OUTPUT: x vettore contenente i nodi
%         w vettore contenente i pesi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [x,w]= gauleg(a,b,n)

  m=(n+1)/2;
  xm=0.5*(b+a);
  xl=0.5*(b-a);
  xx=[];
  
  for i=1:m
    z=cos(pi*(i-0.25)/(n+0.5));
    while 1
      p1=1.0;
      p2=0.0;
      for j=1:n
        p3=p2;
        p2=p1;
        p1=((2.0*j-1.0)*z*p2-(j-1.0)*p3)/j;
      end
      pp=n*(z*p1-p2)/(z*z-1.0);
      z1=z;
      z=z1-p1/pp;
      if (abs(z-z1)<eps), break, end
    end
    xx(i)=xm-xl*z;
    xx(n+1-i)=xm+xl*z;
    ww(i)=2.0*xl/((1.0-z*z)*pp*pp);
    ww(n+1-i)=ww(i);
  end

  x=xx;
  w=ww;
end
