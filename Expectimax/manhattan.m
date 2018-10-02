function dist = manhattan(current, goal, blocked)
%MANHATTAN Summary of this function goes here
% For the enemy the goal would be the position of the player
%     dist = sqrt((current(1) - goal(1))^2 + ((current(2) - goal(2))^2));
%     dist2 = sqrt(sum((current-goal).^2));
%     dist;
%     dist2;
%     disp('here')
% %     current
%     blocked(current(2), current(1)) 
%     if current(1) == 0 && current(2) == 0
%         dist = sum(abs(goal-current));
%     elseif current(1) == 1 && current(2) ==  0
%         dist = sum(abs(goal-current));
%     elseif current(1) == 0 && current(2) == 1
%         dist = sum(abs(goal-current));
% %     elseif current(1) == 1 && current(2) == 0
% %         dist = sum(abs(goal-current));
%     else
%         if blocked(current(2), current(1)) == -10 
%             dist = 10000000000;
%         else
%             dist = sum(abs(goal-current));
%         end
%     end
    
% if current(1) >= 1 && current(2) >= 1 && current(1) <= 15 && current(2) <= 15
%     if blocked(current(2), current(1)) == -10 
%             dist = 10000000;
%     else
%         dist = sum(abs(goal-current));
%     end
% else
    dist = sum(abs(goal-current));
% end

end