%*********************************************
% Algorithme génétique canonique (J.Holland) *
%*********************************************
clear all
hold on
%********************************
% initialisation des paramètres *
%********************************
stringlength=8; % longueur d'un chromosome
popsize=6; % taille de la population
borneinf=0; % borne inf de l'espace de recherche
bornesup=1; % borne sup de l'espace de recherche
pm=0.5; % probabilité de mutation
pc=0.5; % probabilité de crossover
N=2^stringlength; % nombre de points à afficher
%**********************************
% initialisation de la population *
%**********************************
oldpop=initialise(popsize,stringlength,borneinf,bornesup)

%**************************************************************
% boucle tant que l'on n'a pas atteint la dernière génération *
%**************************************************************
finalgen=20;
for gen=1:1:finalgen;
   sprintf('generation numéro',gen)
   %********************************
   % selection génération courante *
   %********************************
   newpop=selection(oldpop,stringlength,popsize)
   
   %********************************
   % crossover génération courante *
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
   % mutation  génération courante *
   %********************************
   for x=1:popsize
      if rand<pm
         parent=newpop(x,:);
         newpop(x,:)=mutation(parent,stringlength,borneinf,bornesup);
      end
   end
   
   %*******************************************
   % calcul de la fitness génération courante *
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