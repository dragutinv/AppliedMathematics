% **********************
% op�rateur croisement *
% **********************
function[child1,child2]=croisement(parent1,parent2,stringlength,borneinf,bornesup);
% *************************************
% choix du point de croisement cpoint *
% *************************************
cpoint=round(rand*(stringlength-2))+1;
%*********************
% Calcul des enfantss *s
%*********************
child1=[parent1(:,1:cpoint) parent2(:,cpoint+1:stringlength)];
child2=[parent2(:,1:cpoint) parent1(:,cpoint+1:stringlength)];
%*********************************************
% conversion en r�el de colonne lengthsize+1 *
%*********************************************
child1(:,stringlength+1)=sum(2.^(size(child1(:,1:stringlength),2)-1:-1:0).*child1(:,1:stringlength))*(bornesup-borneinf)/(2.^stringlength-1)+borneinf;
child2(:,stringlength+1)=sum(2.^(size(child2(:,1:stringlength),2)-1:-1:0).*child2(:,1:stringlength))*(bornesup-borneinf)/(2.^stringlength-1)+borneinf;
%****************************************************
% calcul de la fitness pour la colonne lengthsize+2 *
%****************************************************
child1(:,stringlength+2)=fun(child1(:,stringlength+1));
child2(:,stringlength+2)=fun(child2(:,stringlength+1));
return