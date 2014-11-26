%*********************************************
% Algorithme g�n�tique canonique (J.Holland) *
%*********************************************
clear all
hold on
%********************************
% initialisation des param�tres *
%********************************
stringlength=8; % longueur d'un chromosome
popsize=6; % taille de la population
borneinf=0; % borne inf de l'espace de recherche
bornesup=1; % borne sup de l'espace de recherche
pm=0.5; % probabilit� de mutation
pc=0.5; % probabilit� de crossover
N=2^stringlength; % nombre de points � afficher
%**********************************
% initialisation de la population *
%**********************************
oldpop=initialise(popsize,stringlength,borneinf,bornesup)

%**************************************************************
% boucle tant que l'on n'a pas atteint la derni�re g�n�ration *
%**************************************************************
finalgen=20;
for gen=1:1:finalgen;
   sprintf('generation num�ro',gen)
   %********************************
   % selection g�n�ration courante *
   %********************************
   newpop=selection(oldpop,stringlength,popsize)
   
   %********************************
   % crossover g�n�ration courante *
   %********************************
      if rand<pc
         x=round(rand*(popsize-1))+1;
         y=round(rand*(popsize-1))+1;
         while x==y
            y=round(rand*(popsize-1))+1;
         end
         parent1=newpop(x,:);
         parent2=newpop(y,:);
        [child1,child2]=croisement(parent1,parent2,stringlength,borneinf,bornesup);
     newpop(x,:)=child1;
     newpop(y,:)=child2;
  end
  
 
   %********************************
   % mutation  g�n�ration courante *
   %********************************
   for x=1:popsize
      if rand<pm
         parent=newpop(x,:);
         newpop(x,:)=mutation(parent,stringlength,borneinf,bornesup);
      end
   end
   
   %*******************************************
   % calcul de la fitness g�n�ration courante *
   %*******************************************
   oldpop=newpop
   %**********************
   %affichage des points *
   %**********************
   for h=borneinf:(bornesup-borneinf)/N:bornesup
      plot(h,fun(h),'k.-')
   end
   for x=1:popsize
      plot(oldpop(x,stringlength+1),oldpop(x,stringlength+2),'ro')
   end
   pause
   %for x=1:popsize
      %plot(oldpop(x,stringlength+1),oldpop(x,stringlength+2),'ro')
   %end

 
end