% *********************************
% initialisation de la population *
%**********************************

function[pop,res,res2]=initialise(popsize,stringlength,borneinf,bornesup);

%****************************************************************************************
% tirage aléatoire de  popsize nombres compris entre 0 et 1, arrondis pour code binaire *
%****************************************************************************************
pop=round(rand(popsize,stringlength+2)) % calcul de la partie binaire
res=2.^((size(pop(:,1:stringlength),2)-1):-1:0);
puissance2mat=res;

%***************************************************
% uniformisation de taille avec la matrice binaire *
%***************************************************
for p=1:1:popsize-1;
puissance2mat=[puissance2mat;res];
end
res2=puissance2mat.*pop(:,1:stringlength);

%*********************************************
% conversion en réel de colonne lengthsize+1 *
%*********************************************
for p=1:1:popsize;
pop(p,stringlength+1)=sum(res2(p,:))*(bornesup-borneinf)/(2.^stringlength-1)+borneinf;
end

%****************************************************
% calcul de la fitness pour la colonne lengthsize+2 *
%****************************************************
for p=1:1:popsize;
   % pop(p,stringlength+2)=pop(p,stringlength+1)
 pop(p,stringlength+2)=fitness(pop(p,stringlength+1));
end

%*************************************************************************************
% retourne la matrice population avec code binaire, puis valeur réelle, puis fitness *
%*************************************************************************************
return

