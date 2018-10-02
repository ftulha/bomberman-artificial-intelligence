function bool = check_collision(player, enemy)
%COLLISION Summary of this function goes here
%   Detailed explanation goes here
    if(player - enemy == [0 0])
        bool = 1;
    else
        bool = 0;
    end

end

