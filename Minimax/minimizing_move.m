function [toReturn, ret] = minimizing_move(current, player, blocked)
%MINIMIZING_MOVE Summary of this function goes here
    toReturn = ''; %The optimal move to return that maximizes player 1's utility
    
    South  = manhattan([current(1) current(2) + 1], player,blocked);
    North = manhattan([current(1) current(2) - 1], player, blocked);
    East = manhattan([current(1) + 1 current(2)], player, blocked);
    West = manhattan([current(1) - 1 current(2)], player, blocked);

    [toReturn, ret] = evalBoundary([North South East West], current, blocked);
    
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

