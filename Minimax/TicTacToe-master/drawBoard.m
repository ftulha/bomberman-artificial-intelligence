%% Tic Tac Toe board and supporting functions for the game


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Common functions for the game board
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% draws the blank Tic Tac Toe board %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function []  = drawBoard(currentPlayer, state, row, col)
	global gBoardInit ;
	if gBoardInit == 1
		if (isempty(state) )
			updateBoard(currentPlayer, row,col);
		else
			redrawBoard(state);
		end
	else
		initialiseBoard(currentPlayer, state);	
	end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initialise the board  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function initialiseBoard(currentPlayer, state)
	global gBoardInit;
	global x;
	gBoardInit = 1;
	close all;
     figure('Name', 'Tic tac Toe');
	plot(1,1);
	if (currentPlayer == x ) 
		xlabel('Current Player: X');
	else
		xlabel('Current Player: O');
	end

 	axis([0, 3, 0, 3], 'equal');
	set(gca,'xTick',0:3,'xTickLabel','');
	set(gca,'yTick',0:3,'yTickLabel','');
     grid on;
	% gridlinestyle doesn't work with gnuplot graphics_toolkit
	% need to use FLTK graphics toolkit
	set(get(gcf,'children'),'gridlinestyle','-') 
	set(get(gcf,'children'), 'linewidth', 5);
	hold on;

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Update the board state at single position
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function updateBoard(currentPlayer, row,col)
	global x;
	if (currentPlayer == x )
		drawX(row,col);
		xlabel('Current Player: O');
	else
		drawO(row,col);
		xlabel('Current Player: X');
	end 

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% display the current board state %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function redrawBoard(state)
	global x;
	global o;
	for i = 1:size(state,1)
		for j = 1:size(state, 2)
			if (state(i,j) == o)
				drawO(i,j);
			elseif (state(i,j)== x)
				drawX(i,j)
			end
		end
	end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% draw a X at given position %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function drawX(row, col)
	center = [col-0.5,row-0.5];
	plot([center(1)-0.3,center(1)+0.3],[center(2)-0.3,center(2)+0.3], 'LineWidth',4);
	plot([center(1)+0.3,center(1)-0.3],[center(2)-0.3,center(2)+0.3], 'LineWidth',4);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% draw O at given position  %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function drawO(row, col)
     center = [col-0.5,row-0.5]; 
	r = 0.3;
	t = linspace(0,2*pi,100)'; 
	circsx = r.*cos(t) + center(1); 
	circsy = r.*sin(t) + center(2); 
	plot(circsx,circsy, 'm','LineWidth',4); 
end


