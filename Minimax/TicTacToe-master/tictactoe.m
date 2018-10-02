%% Tic Tac Toe game implementation

% To start the game run at the octave command prompt
% > tictactoe()
%=====================================================

% define the valid state of the spaces in Tic Tac Toe grid

function [] = tictactoe()
	% declare global variables
	global gBoardInit;
	gBoardInit = 0;
	global x;
	x = 1;  % X For OnePlayerPay it is the computer
     global o ;
	o = 0;   % O For onePlayerPlay, it is player
     global b;
	b = -1; % blank

	% Initial board state as all empty
	fprintf('starting TicTacToe');

	

    state = ones(3,3) * b ; % initialise 3*3 grid with all b 	    
	currentPlayer = o;
	drawBoard(currentPlayer, state,'','' );

	winner = b;

	% continue playing until board is not all full and there is no winner
	while (winner == b && ismember([b],state))	
	
		% two player playing
		%[state, currentPlayer] = play(currentPlayer ,state);
		%winner = gameStat(state);
				
		% one player play with computer
		[state] = onePlayerPlay(currentPlayer ,state) ;
		 drawBoard(currentPlayer , state, '','');
		 winner = gameStat(state);
	end

	if winner == o % O won
        xlabel('O Won the Game');
     elseif winner == x % X won
        xlabel('X won the Game');
     else % tie
        xlabel('The game is Tie');
     end

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Two players play
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [state, currentPlayer] = play(currentPlayer, state)
	global b;
	global x;
	global o;
	[xcord,ycord] = ginput(1);
	[row, col] = getGridPosition(xcord,ycord);
	% if the board position is already non blank, do not allow the move
	% get the click only within grid area
	if ( 1<=row && row <=3 && 1<=col && col <=3 )

		if (state(row,col) == b)	
			state(row,col) = currentPlayer;
			drawBoard(currentPlayer, '',row,col );
			% switch the player
			if (currentPlayer == x)
				currentPlayer = o;
			else
				currentPlayer = x;
			end
		end
	end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Play with computer
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [state] = onePlayerPlay(player,state)
	global b;
	global x;
	[xcord,ycord] = ginput(1);
	[row, col] = getGridPosition(xcord,ycord);
	winner = b; % initialize
% get the click only within grid area
	if ( 1<=row && row <=3 && 1<=col && col <=3 )
		% if the board position is already non blank, do not allow the move
		if (state(row,col) == b)	
			state(row,col) = player;
			drawBoard(player, '',row,col );
			winner = gameStat(state);
	
			if(winner == b)
				iplayer = x;
				[bestScore,bestChild]  = minimax(state,iplayer, 3);

				if (size(bestChild,1) >0)
					state = bestChild;
					winner = gameStat(bestChild);
				end
		
		 	end
		end
	end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Get board position on click   %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function [row, col] = getGridPosition(x,y)
	row = ceil(y);
	col = ceil(x);
end

