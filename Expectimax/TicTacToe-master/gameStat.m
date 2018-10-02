%% Tic Tac Toe game status function

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Get the game status %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function winner = gameStat(state)
	global b;
	winner = b;
	% diagonal match
	if ( (state(1,1) == state(2,2)) && (state(1,1) == state(3,3)) )
		winner = state(1,1);
	elseif ((state(3,1) == state(2,2)) && (state(3,1) == state(1,3)))
		winner = state(3,1);

	% row match
	elseif ((state(3,1) == state(3,2)) && (state(3,1) == state(3,3)))
		winner = state(3,1);
	elseif ((state(2,1) == state(2,2)) && (state(2,1) == state(2,3)))
		winner = state(2,1);
elseif ((state(1,1) == state(1,2)) && (state(1,1) == state(1,3)))
		winner = state(1,1);

	% column match
	elseif ((state(1,1) == state(2,1)) && (state(1,1) == state(3,1)))
		winner = state(1,1);
	elseif ((state(1,2) == state(2,2)) && (state(1,2) == state(3,2)))
		winner = state(1,2);
elseif ((state(1,3) == state(2,3)) && (state(1,3) == state(3,3)))
		winner = state(1,3);	
	end
end



