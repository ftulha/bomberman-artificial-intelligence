function [toReturn, ret] = BreakTie(arr, blocked, position)
% Takes an array and returns the decision as a direction
disp('I am in breaktie');
ret = 0;
N = arr(1);
S = arr(2);
E = arr(3); 
W = arr(4);
toReturn = '';
decision = min([N S E W])
% alpha = 20000000000000;
% check alpha value for the current matrix

% if N == alpha && S == alpha
   
% elseif S == alpha && W == alpha
%     elseif S == alpha && W == alpha
%     elseif N == alpha && E == alpha
%         elseif S == alpha && W == alpha
%             elseif S == alpha && E == alpha
%             
%     if (blocked(position(2) + 1, position(1)) ~= -10
%     
% pN = [position(1) position(2) + 1];
% pS = [position(1) position(2) - 1];
% pE = [position(1) + 1 position(2)];
% pW = [position(1) - 1 position(2)];
if decision == N 
    toReturn = 'N';
elseif decision == S 
    toReturn = 'S';
elseif decision == E 
    toReturn = 'E';
elseif decision == W 
    toReturn = 'W';
else
    disp('Exception!');
end 

if decision == 10000000
    ret = 1
else
    ret = 0
end

end