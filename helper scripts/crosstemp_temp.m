solution=cell(1,2);
solution{1}=zeros(100000,10);
solution{2}=zeros(100000,1);
parfor Xi=1:size(solution{1},1)
  Min_cost=10^9;
  for Xj=1:10
      Iter_mat=[Xj/1 Xj/2 Xj/3 Xj/4 Xj/5 Xj/6 Xj/7 Xj/8 Xj/9 Xj/10];
      Total_cost=Xi^2-Xi;
      if Total_cost<Min_cost
          Min_cost=Total_cost;
          solution{1}(Xi,:)=Iter_mat;
          solution{2}(Xi)=Min_cost;
      end
  end
end

solution1=zeros(100000,10);
    solution2=zeros(100000,1);
    parfor Xi=1:size(solution1,1)
      Min_cost=10^9;
      for Xj=1:10
          Iter_mat=[Xj/1 Xj/2 Xj/3 Xj/4 Xj/5 Xj/6 Xj/7 Xj/8 Xj/9 Xj/10];
          Total_cost=Xi^2-Xi;
          if Total_cost<Min_cost
              Min_cost=Total_cost;
              solution1(Xi,:)=Iter_mat;
              solution2(Xi)=Min_cost;
          end
      end
    end