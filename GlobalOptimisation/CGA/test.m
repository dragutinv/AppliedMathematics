popsize=4;
pc=0.5;
v=[1 1 1 1 1;2 2 2 2 2 ;3 3 3 3 3;4 4 4 4 4]
stringlength=5
for x=1:popsize;
   if rand<pc;
      parent1=v(x,:);
      parent2=v(round(rand*(popsize-1))+1,:);
      if parent1~=parent2
         cpoint=round(rand*(stringlength-2))+1
         child1=[parent1(:,1:cpoint) parent2(:,cpoint+1:stringlength)]
				child2=[parent2(:,1:cpoint) parent1(:,cpoint+1:stringlength)]
      else sprintf('on croise pas')
      end
   end
   
end 


%child1=[parent1(:,1:cpoint) parent2(:,cpoint+1:stringlength)]
%child2=[parent2(:,1:cpoint) parent1(:,cpoint+1:stringlength)]
