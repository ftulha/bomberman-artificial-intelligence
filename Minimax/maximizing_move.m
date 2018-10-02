function [toReturn, ret] = maximizing_move(current, goal, blocked)
%MAXIMIZING_MOVE Summary of this function goes here
%   This will take in the player's current position and return the best
%   possible move for player 1.
    toReturn = ''; %The optimal move to return that maximizes player 1's utility
    
    South  = manhattan([current(1) current(2) + 1], goal, blocked);
    North = manhattan([current(1) current(2) - 1], goal,blocked);
    East = manhattan([current(1) + 1 current(2)], goal, blocked);
    West = manhattan([current(1) - 1 current(2)], goal, blocked);
%     
%     East = manhattan([current(1) current(2) + 1], goal); 
%     West = manhattan([current(1) current(2) - 1], goal); 
%     North = manhattan([current(1) + 1 current(2)], goal);
%     South = manhattan([current(1) - 1 current(2)], goal);
%     [North South East West]
    [toReturn, ret] = evalBoundary([North South East West], current, blocked);
    
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
%     
% %     [North South East West]
end

