% ****************
% lecture du phono
% ****************
clear all
% ECG et lecture taille de l'échantillon
siz1=wavread('a3pddecg.wav','size');
siz1(1)=6000;
[y1,f1,b1]=wavread('a3pddecg.wav',siz1(1));
% PHONO et lecture taille de l'échantillon
%siz2=wavread('a3pddphono.wav','size')
%[y2,f2,b2]=wavread('a3pddphono.wav',siz2(1));
%lecture période d'échantillonnage
t1=1/f1;
%t2=1/f2;
% calcul de l'axe temporel
for N=1:siz1(1),
   x1(N)=N*t1;
end
%for N=1:siz2(1),
%   x2(N)=N*t1;
%end
% affichage en fonction du temps
figure
plot(x1,y1)
hold on;
y2=-y1;
%*******************
%* Recuit simulé   *
%*******************
% on entre le vecteur v 
% on sort la valeur de x qui conduit au maximum de v
l=length(x1);
k=0.01; % plus adapté que 1.38*10^-23;
%******************
% initialisations
%******************
inew=fix(l*rand)+1;% nouveau point généré au hasard
icur=fix(l*rand)+1;% point courant généré au hasard
ibest=icur;% meilleur indice de départ
temp=800;% température initiale
t=0; % temps courant
n=1;
while temp>=2
   % boucle température
   for j=1:20
   % nb calculs par valeur de température
   temp;
   deltaE=y2(inew)-y2(icur);
    if deltaE<=0 
       % sprintf(' on accepte une baisse de l énergie')
      icur=inew
      		if y2(icur)<y2(ibest(n))    
               n=n+1;
               ibest(n)=icur;
            end
    else
     	u=rand
         if u<exp(-deltaE/(k*temp)) 
					 % sprintf('on accepte une augmentation de l énergie avec une probabilité fonction de la température')
				   icur=inew;
            n=n+1;
					 ibest(n)=icur;
         end
         % sprintf('on n accepte pas d augmentation de l énergie')
			end
	% sprintf('nouveau point choisi au hasard')
	t=t+1;
	inew=fix(l*rand)+1; 
end
temp=temp/2; 
% sprintf('décroissance température')
end
  for j=1:length(ibest)
    plot(x1(ibest(j)),y1(ibest(j)),'g+')
		plot(x1(ibest(n)),y1(ibest(n)),'ro')
  end

      