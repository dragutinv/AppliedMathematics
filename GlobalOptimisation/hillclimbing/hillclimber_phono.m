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
    hold on;
     plot(x1,y1)
    % ************
    % hillclimber
    % ************
    t=length(x1);
    n=1;
    bestindice(n)=fix(t*rand)+1; % choix aléatoire du point de départ
    bestx=x1(bestindice(n));
     for i=1:200 % 200 itérations
    indicenew=fix(t*rand)+1;
    xnew=x1(indicenew);
    ynew=y1(indicenew);
                if ynew>y1(bestindice(n)) 
            n=n+1;
           bestindice(n)=indicenew; % enregistrement de tous les meilleurs indices rencontrés
           % x1(bestindice)
           end
     end
     % bestx=x(bestindice);
     for j=1:length(bestindice) 
         plot(x1(bestindice(j)),y1(bestindice(j)),'ro')
         pause % appuyer sur la touche espace pour passer au meilleur indice suivant
     end


