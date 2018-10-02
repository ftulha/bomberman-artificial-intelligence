function [ qq ] = myAstar()
 import java.util.Stack
 my_stack=Stack();

%%set grid size
r=15;
c=r;
goal=input('Enter goal=');
start=[1 1];
x=ones(r,c)*4;
for it=1:2:r
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
    if sum(curr==goal)==2
        break;
    end
    
    x(curr(1),curr(2))=2;%2isclosed
    [i,j]=find(x==3);
    mini=i(1);
    minj=j(1);
    for k=1:size(i)-1
       if h(i(k),j(k))>h(i(k+1),j(k+1))
           mini=i(k+1);
           minj=j(k+1);
       end
    end
    curr=[mini minj];
    
end
x(curr(1),curr(2))=1;
p0=my_stack.pop;
x(p0(1,1),p0(1,2))=1;
for i=1:my_stack.size-1
    p1=my_stack.pop;
    if (sum(p1(1,:)==p0(2,:))==2)
        x(p0(2,1),p0(2,2))=1;
        p0=p1;
    end
    
end
%%brick loc
x(6,1)=8;
x(goal(1),goal(2))=8;
check=start;
sizec=length(qq);
wtg=1;
chk_bmb=0;
bi=0;
move=[0 0];
while(1)
    if ~(sum((check-[1 0])==0))
       
        if x(check(1)-1,check(2))==wtg
           move=[-1 0]
            
            %check(1)=check(1)-1;
            %x(check(1),check(2))=8-wtg;
            qq(length(qq)+1)=1;
        elseif x(check(1)-1,check(2))==8
            %check(1)=check(1)-1;
            x(check(1)-1,check(2))=1;
            qq(length(qq)+1)=5;
            wtg=8-wtg; 
            chk_bmb=1;
            move=[0 0];
        end
    end
    if ~(sum((check-[0 1])==0))
        if x(check(1),check(2)-1)==wtg
            move=[0 -1];
            %check(2)=check(2)-1;
            %x(check(1),check(2))=8-wtg;
            qq(length(qq)+1)=2; 
        elseif x(check(1),check(2)-1)==8
            %check(2)=check(2)-1;
            x(check(1),check(2)-1)=1;
            qq(length(qq)+1)=5;
            wtg=8-wtg;
            chk_bmb=1;
            move=[0 0];
        end
    end
    if ~(sum((check+[1 0])==r+1))
        if x(check(1)+1,check(2))==wtg
            move=[1 0];
            %check(1)=check(1)+1;
            %x(check(1),check(2))=8-wtg;
            qq(length(qq)+1)=3;
        elseif x(check(1)+1,check(2))==8
            %check(1)=check(1)+1;
            x(check(1)+1,check(2))=1;
            qq(length(qq)+1)=5;
            wtg=8-wtg;
            chk_bmb=1;
            move=[0 0];
        end
    end    
    if ~(sum((check+[0 1])==c+1))
        if x(check(1),check(2)+1)==wtg
            move=[0 1];
            %check(2)=check(2)+1;
            %x(check(1),check(2))=8-wtg;
            qq(length(qq)+1)=4;
        elseif x(check(1),check(2)+1)==8
            %check(2)=check(2)+1;
            x(check(1),check(2)+1)=1;
        qq(length(qq)+1)=5;
        wtg=8-wtg;
        chk_bmb=1;
            move=[0 0];
        end
    end
     %x(check(1),check(2))=8-wtg;   
    check=check+move;
     if sizec==length(qq)
         break;
     end
     
    if chk_bmb
        bi=bi+1;
    else
        bi=0;
        
    end
    if bi==4
       chk_bmb=0;
       wtg=8-wtg;
       qq(length(qq)+1)=0;
       qq(length(qq)+1)=0;
       qq(length(qq)+1)=0;
    else
        x(check(1),check(2))=8-wtg;
    end
sizec=length(qq);
    

end
qq
x
end