% ********************
% opérateur mutation *
% ********************
function[child]=mutation(parent,stringlength,borneinf,bornesup);
% ***********************************
% choix du point de mutation mpoint *
% ***********************************
mpoint=round(rand*(stringlength-1))+1;
child=parent;
child(mpoint)=abs(parent(mpoint)-1);
%*********************************************
% conversion en réel de colonne lengthsize+1 *
%*********************************************
child(:,stringlength+1)=sum(2.^(size(child(:,1:stringlength),2)-1:-1:0).*child(:,1:stringlength))*(bornesup-borneinf)/(2.^stringlength-1)+borneinf;
%****************************************************
% calcul de la fitness pour la colonne lengthsize+2 *
%****************************************************
child(:,stringlength+2)=fun(child(:,stringlength+1));
return
















