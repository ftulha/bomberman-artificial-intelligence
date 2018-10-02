function [decision, ret] = evalBoundary(array, position, blocked)
%EVALBOUNDARY Summary of this function goes here
% The array input will be in the order: [N S E W]. Tie's will be checked
% in this function and the decision to move in will be returned as a
% result. Tie's will be resolved clockwise from North all the way to West.
decision = '';

% check corner cases. left origin.[1 1]
North = array(1);
South = array(2);
East = array(3);
West = array(4);
alpha = 20000000000000; % a large number to represnt a state that cannot be visited

if position == [1 1]
    %move either south or east
    [decision, ret] = BreakTie([alpha South East alpha], blocked, position);
elseif position == [1 15]
    %move either east or north
    [decision, ret] = BreakTie([North alpha East alpha], blocked, position);
elseif position == [15 1]
    %move either west or south
    [decision, ret] = BreakTie([alpha South alpha West], blocked, position);
elseif position == [15 15]
    %move either west or north
    [decision, ret] = BreakTie([North alpha alpha West], blocked, position);
elseif position(1) == 1
    %when in first col never go west, only go north, east or south
    [decision, ret] = BreakTie([North South East alpha], blocked, position);
elseif position(2) == 1
    %when in first row never go north, only go east, west or south
    [decision, ret] = BreakTie([alpha South East West], blocked, position);
elseif position(1) == 15
    %when in 15th col never go east, only go north, south or west
    [decision, ret] = BreakTie([North South alpha West], blocked, position);
elseif position(2) == 14
    %when in 15th row never go south, only go north, east or west
    [decision, ret] = BreakTie([North alpha East West], blocked, position);
else
    [decision, ret] = BreakTie([North South East West], blocked, position);
end

% now we have to check if the new move is valid in terms of the position
end
