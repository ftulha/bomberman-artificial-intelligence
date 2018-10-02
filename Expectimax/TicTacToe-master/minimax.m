%% Minimax algorithm for Tic Tac Toe game implementation


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Start of minimax algorithm implementation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [bestScore, bestChild] = minimax(state, maximizingPlayer, depth)
	bestChild = [];
	if ( isGameOver(state) || depth == 0 ) 
		bestScore = evaluate(state,maximizingPlayer, depth);

	else
		
		if (maximizingPlayer)
     			bestScore =  -inf;
     		else
     			bestScore = inf;
     		end

		childrenBoard = getChildren(state,maximizingPlayer) ;
		i = 1;
        size = 1;
		size = size(childrenBoard ,2)/3;

 		while i <= size
 				
			childBoard = childrenBoard(:,3*i-2:3*i);
            aa = maximizingPlayer;
			score = minimax(childBoard, maximizingPlayer, depth-1);
			if (maximizingPlayer)
				if (bestScore < score)
					bestScore = score;
					bestChild = childBoard ;
				end
 			else
				if (bestScore > score)
					bestScore = score;
					bestChild = childBoard;
				end
			end
			
			i = i + 1;
		end
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% evaluate score from player perspective %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function score = evaluate(state, player, depth)
	global b;
	global x;
	winner = gameStat(state);
	if (winner == b)
		score = 0;
	elseif (winner == x)
		score =  10 + depth;
	else
		score = -10 - depth;
	end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Get all children board  %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function childrenBoard = getChildren(state, player)
	global b;
	maxRow = 3;
	maxCol = 3;
	rowCur = 1;
	childrenBoard =[];
	while rowCur <= maxRow
		colCur  = 1;
		while colCur <= maxCol			
			if (state(rowCur,colCur) == b)
				dummyBoard = state;
				dummyBoard(rowCur,colCur) = player;
				childrenBoard = [childrenBoard,dummyBoard];
			end
			colCur = colCur + 1;
		end
		rowCur = rowCur + 1;
	end 
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Check for game over  %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function gameOver = isGameOver(state)
	global b;
	winner = gameStat(state);
	if  (ismember([b],state) && winner == b)
		gameOver = false;
	else
		gameOver =  true; 
end

end