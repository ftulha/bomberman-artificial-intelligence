function initialize(game)
%'Here everytime'
turn = 'Player'; %Let the games begin. 
height = 0;
check = 1;
done = 0;
blocked = zeros(15,15);
update = [1 1];
go = 'N';
for i=2:2:15
    for j=2:2:15
       blocked(i,j)=-10; 
    end
end

%The initialize function is the main function responsible for playing the
%game. It creates the GameBoard and GameFigure, while changing the position and
%size of the GameFigure. It also sets a KeyPressFcn and a KeyDownFcn, which
%corresponds to different key inputs. There is a timer object, which calls
%the "poll" function every .01 seconds. The game is initialized by setting
%certain variables
prompt = 'Set the goal state!';
goal = input(prompt);
% goal = [15 15];

bd = game.GameBoard;
game.GameFigure = gcf;
set(game.GameFigure, 'Name', 'BOMBERMAN!')
set(game.GameFigure, 'Units','normalized','Position',[.2 .05 .6 .8]);
set(game.GameFigure, 'KeyPressFcn', @keyDown);
set(game.GameFigure, 'KeyReleaseFcn', @keyUp);

%Create Timer function
a = timer('ExecutionMode', 'fixedRate', 'Period', 0.06, 'TimerFcn', @(h,d) poll);

%Variable initialization
rightarrow_keypress = 0; leftarrow_keypress = 0; uparrow_keypress = 0; downarrow_keypress = 0;
w_keypress = 0; a_keypress = 0; s_keypress = 0; d_keypress = 0;
v_keypress = 0; b_keypress = 0; n_keypress = 0; m_keypress = 0;
p1_img = imread('p1down1.png','Back',[0 .6 .3]);
p2_img = imread('p2up1.png','Back',[0 .6 .3]);
e1_img = imread('e-up.png','Back',[0 .6 .3]);

%Start Timer function
start(a);    

    function keyUp(H,eventData)
        %This function makes a certain key unpressed. It checks if it is 
        %pressed (1), and if it is, this function reinitialized it back to 
        %unpressed (0).
        %Altering this function to introduce concurrency so that only one
        %player may move at one time.
       
        switch eventData.Key
           case 'rightarrow'
                if rightarrow_keypress == 1
                    rightarrow_keypress = 0;
                end
           case 'leftarrow'
                if leftarrow_keypress == 1
                    leftarrow_keypress = 0;
                end
           case 'uparrow'
                if uparrow_keypress == 1
                    uparrow_keypress = 0;
                end
           case 'downarrow'
                if downarrow_keypress == 1
                    downarrow_keypress = 0;
                end
           case 'w'
                if w_keypress == 1
                    w_keypress = 0;
                end
           case 'a'
                if a_keypress == 1
                    a_keypress = 0;
                end
           case 's'
                if s_keypress == 1
                    s_keypress = 0;
                end
           case 'd'
                if d_keypress == 1
                    d_keypress = 0;
                end
            case 'v'
                if v_keypress == 1
                    v_keypress = 0;
                end
            case 'b'
                if b_keypress == 1
                    b_keypress = 0;
                end
            case 'n'
                if n_keypress == 1
                    n_keypress = 0;
                end
            case 'm'
                if m_keypress == 1
                    m_keypress = 0;
                end
           otherwise
        end
    end

    function keyDown(H,eventData)
        %This function makes a certain key pressed. It sets that key to
        %being pressed down (1), and it also creates a different image if
        %the keys are responsible for player movement (WASD and arrow
        %keys). If the key is E or Return/Enter, it calls the placeBomb
        %function of the Player class.
        
        switch eventData.Key
            case 'rightarrow'
                rightarrow_keypress = 1;
                p2_img = imread('p2left1.png','Back',[0 .6 .3]);
            case 'leftarrow'
                leftarrow_keypress = 1;
                p2_img = imread('p2right1.png','Back',[0 .6 .3]);
            case 'uparrow'
                uparrow_keypress = 1;
                p2_img = imread('p2up1.png','Back',[0 .6 .3]);
            case 'downarrow'
                downarrow_keypress = 1;
                p2_img = imread('p2down1.png','Back',[0 .6 .3]);
            case 'w'
                w_keypress = 1;
                p1_img = imread('p1up1.png','Back',[0 .6 .3]);
            case 'a'
                a_keypress = 1;
                p1_img = imread('p1right1.png','Back',[0 .6 .3]);
            case 's'
                s_keypress = 1;
                p1_img = imread('p1down1.png','Back',[0 .6 .3]);
            case 'd'
                d_keypress = 1;
                p1_img = imread('p1left1.png','Back',[0 .6 .3]);
            case 'v'
                v_keypress = 1;
                e1_img = imread('e-right.png','Back',[0 .6 .3]);
            case 'b'
                b_keypress = 1;
                e1_img = imread('e-left.png','Back',[0 .6 .3]);
            case 'n'
                n_keypress = 1;
                e1_img = imread('e-up.png','Back',[0 .6 .3]);
            case 'm'
                m_keypress = 1;
                e1_img = imread('e-down.png','Back',[0 .6 .3]);
            case 'e'
                game.PlayerList{1}.placeBomb();
            case 'return'
                game.PlayerList{2}.placeBomb();
            case 'q'
                stop(a);
                close(gcf);
            otherwise
        end
    end
    
    function playerActions
        %This function is responsible for player movement. It checks if a
        %key is pressed (1), and if it is, it calls the move function of
        %the Player class to move a specified increment.
        
        %We would like to implement the move function here such that the
        %player moves at every time step by maximizing his advantage.
        player1 = game.PlayerList{1};
        enemy1 = game.PlayerList{3};
        update = player1.Position;
        if check == 1
%             height = height + 1;
            'Player 1 pos';
            player1.Position;
            check = 0;
        else
            'Enemy 1 pos';
            enemy1.Position;
            check = 1;
        end
        % Check whose turn it is
        if(isTerminal(player1.Position, goal))
            warndlg('Player 1 has reached the goal state. CONGRATULATIONS!');
            stop(a);
            %pause(2);
            close(gcf);
            done = 1;
        else
            if(check_collision(player1.Position, enemy1.Position))
                warndlg('Player 1 has been killed! The enemy was better!');
                stop(a);
%                 pause(2);
                close(gcf);
                done = 1;
            else
                if(strcmp(turn,'Player'))
                    'i come here';
                    [go, ret] = maximizing_move(player1.Position, goal, blocked);
%                     if ret == 1                  
                        player1.move(go);
                        if(update == player1.Position)
                            player1.move('S');
                        else
                            
                        end
%                         player1.move(go); 
%                     else
%                         player1.move(go);
                    % maximizing_move is the direction that maximizes utility
                    %maximizing_move(player1.Position, goal)
%                     pos = player1.Position;
%                     if blocked(pos(2), pos(1)) == -10
                    %redo cuz you are stuck
%                     player1.move(maximizing_move(player1.Position, goal, blocked));
%                     else
                        turn = 'Enemy';
%                     end
%                         if update == player1.Position
% %                             player1.move('S');
% %                             player1.move(maximizing_move(player1.Position, goal, blocked))
%                             disp('Break this');
%                         end                   
%                     end
                else
                    [go, ret] = expectation_move(enemy1.Position, player1.Position, blocked)
%                     if ret == 1                  
                        enemy1.move(go);
%                         enemy1.move(go);
%                     else
%                         enemy1.move(go);
                     % same concept applies here
                    turn = 'Player';
%                     end
                end
            end
        end

%         if rightarrow_keypress == 1;
%             player2.move('E');
%         end
%         if leftarrow_keypress == 1;
%             player2.move('W');
%         end
%         if uparrow_keypress == 1;
%             player2.move('N');
%         end
%         if downarrow_keypress == 1;
%             player2.move('S');
%         end
        if w_keypress == 1;
            player1.move('N');
        end
        if a_keypress == 1;
            player1.move('W');
        end
        if s_keypress == 1;
            player1.move('S');
        end
        if d_keypress == 1;
            player1.move('E');
        end
        if v_keypress == 1;
            enemy1.move('W');
        end
        if b_keypress == 1;
            enemy1.move('E');
        end
        if n_keypress == 1;
            enemy1.move('N');
        end
        if m_keypress == 1;
            enemy1.move('S');
        end
    end

    function showPlayers
        %This function adds each of the player icons into a guidata as part
        %of the GameFigure property. It checks the current position of the
        %figure, then saves it to the GameFigure. Upon recalling this function,
        %it shows the position of the player icon.
        p = [];
        pcol = {[1 0 0],[0 0 1], [0 0 0]};
        ax = gca;
        set(ax,'Parent',game.GameFigure);
        for i = 1:length(game.PlayerList)
            if i == 1
                img = p1_img;
            elseif i == 2
                img = p2_img;
            else
                img = e1_img;
            end
            z = flipdim(img,1);
            player = game.PlayerList{i};
            x = player.Position(1); y = player.Position(2);
            %box = patch([x-.5 x-.5 x+.5 x+.5], [16-y-.5 16-y+.5 16-y+.5 16-y-.5],pcol{i});
            hold on
            box = imagesc([x+.32 x-.32],[16-(y+.45) 16-(y-.45)],z);
            set(box,'Parent',ax);
            p(end+1) = box;
        end
        hold off
        guidata(game.GameFigure,p);
    end

    function timeStep
        %This function checks the time each time the function is called. It
        %compares the clock time (using the clock built-in function) and
        %compares it to the list of bombs in the Bombs property of the
        %Board class. If the elapsed time is greater than 1 second, it
        %changes the StartTime property of the bomb and calls the update
        %function of the Bomb class.
        tstep = clock;
        i = 1;
        while i <= length(bd.Bombs)
            if etime(tstep,bd.Bombs{i}.StartTime) >= 1
                bd.Bombs{i}.StartTime = tstep;
                bd.Bombs{i}.update();
            end
            i = i+1;
        end
    end      

    function checkAlive
        %This function loops through the game's current PlayerList property
        %and checks the IsAlive property of each player. If the IsAlive
        %property registers a false (0), it stops the timer function and
        %shows a warning dialog that indicates the game is over.
        for i = 1:length(game.PlayerList)
            if game.PlayerList{i}.IsAlive == 0
                stop(a);
                warndlg(['Player ' game.PlayerList{i}.Name ' has been killed!'],'GAME OVER!');
            end
        end
    end

    function poll(H, eventData)
        %The poll function is called every .01 seconds. It recalls the
        %display function of the Board to update the GameBoard. Then it
        %calls playerActions and showPlayers to show the new position of
        %the player movement. It also calls timeStep and checksAlive to
        %update the time of bombs and player alive status respectively.
        %The drawnow function redraws the board. Furthermore, it also
        %checks if the current figure (game.GameFigure) is still open. If the
        %current figure is closed, or terminated, it immediately stops the
        %game.
        display(bd);
        playerActions;
        if(done == 0)
            showPlayers;
            timeStep;
            drawnow;
            figure(game.GameFigure);
            checkAlive;
            if isempty(findobj('type','figure')) == 1
                'This is the height'
                height
                stop(a);
            end
        else
            height
%             disp('Aha!');
        end
        
    end

end