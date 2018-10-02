function bool = isTerminal(player, goal)
%ISTERMINAL Summary of this function goes here
%   Detailed explanation goes here
    if(player - goal == [0 0])
        bool = 1;
    else
        bool = 0;
    end
end

