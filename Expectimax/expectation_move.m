function [toReturn, ret] = expectation_move(current, player, blocked)
%MINIMIZING_MOVE Summary of this function goes here
    toReturn = ''; %The optimal move to return that maximizes player 1's utility
    ret = 0;
    move = (rand(1,4));
    N = move(1);
    S = move(2);
    E = move(3);
    W = move(4);
    decision = max(move);
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
%     [toReturn, ret] = evalBoundary([North South East West], current, blocked);
    
%     min([North South East West]);
    
%     %Put in the boundary conditions later
%     if move == North
%         toReturn = 'N';
%     elseif move == South
%         toReturn = 'S';
%     elseif move == East
%         toReturn = 'E';
%     elseif move == West
%         toReturn = 'W';
%     else
%         disp('Tie between values. Here is the move array');
%         disp([North South East West]);
%         toReturn = 'N';
%     end   
end

