import java.util.Stack
my_stack=Stack();

%%set grid size
r=15;
c=r;
goal=[9,9];
start=[1 1];
x=ones(r,c)*4;
for(it=1:2:r)
    x(it,:)=zeros(1,r);
    x(:,it)=zeros(r,1);
end
% x(1,:)=ones(1,15)*4;
% x(2,15)=0;
% x(2,12)=0;
% x(6,:)=ones(1,15)*4;
% x(6,1)=0;
% x(6,3)=0;
% x(6,4)=4;
% x(4,4)=4;
% x(3,4)=4;
% x(2,4)=4;
% x(5,5)=4;
% x(3,6)=4;
%%
x(start(1),start(2))=5;
x(goal(1),goal(2))=9;
h=ones(r,c)*100000000;
g=zeros(r,c);
curr=start;
h(1,1)=calc_man(0,goal,curr);
%my_stack.add([curr ;[0 0]]);
prev_curr=[];
qq=[];
while(1)
    mvmt=g(curr(1),curr(2))+1;
    if sum((curr-[1 0])==0)
       disp('cannot go up')
    elseif sum(x(curr(1)-1,curr(2))~=[2 3 4])==3
        h(curr(1)-1,curr(2))=calc_man(mvmt,goal,curr-[1 0]);
        x(curr(1)-1,curr(2))=3;
        g(curr(1)-1,curr(2))=mvmt;
    elseif (x(curr(1)-1,curr(2))==2 && g(curr(1)-1,curr(2))<=g(curr(1),curr(2)))
        prev_curr=curr-[1 0];
    end
    if sum((curr-[0 1])==0)
       disp('cannot go left')
    elseif sum(x(curr(1),curr(2)-1)~=[2 3 4])==3
        h(curr(1),curr(2)-1)=calc_man(mvmt,goal,curr-[0 1]);
        x(curr(1),curr(2)-1)=3;
        g(curr(1),curr(2)-1)=mvmt;
    elseif (x(curr(1),curr(2)-1)==2 && g(curr(1),curr(2)-1)<=g(curr(1),curr(2)))
        prev_curr=curr-[0 1];
    end
    if sum((curr+[1 0])==r+1)
       disp('cannot go down')
    elseif sum(x(curr(1)+1,curr(2))~=[2 3 4])==3
        h(curr(1)+1,curr(2))=calc_man(mvmt,goal,curr+[1 0]);
        x(curr(1)+1,curr(2))=3;
        g(curr(1)+1,curr(2))=mvmt;
    elseif (x(curr(1)+1,curr(2))==2 && g(curr(1)+1,curr(2))<=g(curr(1),curr(2)))
        prev_curr=curr+[1 0];
    end
    if sum((curr+[0 1])==c+1)
       disp('cannot go right')
    elseif sum(x(curr(1),curr(2)+1)~=[2 3 4])==3
        h(curr(1),curr(2)+1)=calc_man(mvmt,goal,curr+[0 1]);
        x(curr(1),curr(2)+1)=3;
        g(curr(1),curr(2)+1)=mvmt;
    elseif (x(curr(1),curr(2)+1)==2 && g(curr(1),curr(2)+1)<=g(curr(1),curr(2)))
        prev_curr=curr+[0 1];
    end
    curr
    prev_curr
    my_stack.push([curr ;prev_curr]);
    x(curr(1),curr(2))=2;%2isclosed
    [i,j]=find(x==3);
    mini=i(1)
    minj=j(1)
    for k=1:size(i)-1
       if h(i(k),j(k))>h(i(k+1),j(k+1))
           mini=i(k+1);
           minj=j(k+1);
       end
    end
    
    
        
    %end
    
    %prev_curr=curr;
    curr=[mini minj];
    %mL.add([curr ;prev_curr]);
    %my_stack.push([curr ;prev_curr]);
    if sum(curr==goal)==2
        break;
    end
    %qq(length(qq)+1,:)=[h(mini,minj) curr curr_prev]
    %pause(2)
    
    
end
x(curr(1),curr(2))=1;
p0=my_stack.pop
x(p0(1,1),p0(1,2))=1;
for i=1:my_stack.size-1
    p1=my_stack.pop
    if (sum(p1(1,:)==p0(2,:))==2)
        disp('ok')
        x(p0(2,1),p0(2,2))=1;
        p0=p1;
    end
    
end

disp(x);

check=start;
sizec=length(qq);
while(1)
    if sum((check-[1 0])==0)
       disp('cannot go up')
    elseif x(check(1)-1,check(2))==1
        check(1)=check(1)-1;
        x(check(1)-1,check(2))=7;
        qq(length(qq)+1)=1;
    end
    if sum((curr-[0 1])==0)
       disp('cannot go left')
    elseif x(curr(1),curr(2)-1)==1
       check(2)=check(2)-1;
       x(check(1),check(2)-1)=7;
       qq(length(qq)+1)=2; 
    end
    if sum((curr+[1 0])==r+1)
       disp('cannot go down')
    elseif x(curr(1)+1,curr(2))==1
        check(1)=check(1)+1;
        x(check(1)+1,check(2))=7;
        qq(length(qq)+1)=3;
    end
    if sum((curr+[0 1])==c+1)
       disp('cannot go right')
    elseif x(curr(1),curr(2)+1)==1
        check(2)=check(2)+1;
        x(check(1),check(2)+1)=7;
        qq(length(qq)+1)=4;
    end
    
    if sizec==length(qq)
        break;
    end
    
    sizec=length(qq);
    

end