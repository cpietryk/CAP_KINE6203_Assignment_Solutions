%% Comment Section
%Name:Christopher Pietryk
%Date:10/1/25
%Description: Tic-Tac-Toe Game. This code generates a tic-tac-toe gameboard
%and allows the user to play a game of tic-tac-toe against the computer. It
%asks the user to play and if they want to go first. The code then uses a
%numerous amount of if statements to respond accordingly to every single
%scenario, making the program unbeatable.
%% Code
close all, clear all, clc %Clear Everything
response=input('Welcome, would you like to play a game of Tic-Tac-Toe? Y or N\n','s');
if strcmpi(response,'Y')||strcmpi(response,'yes') %Ensures casing does not matter. AI used to figure out how to include yes and y
    clc
    %Determine who will go first
    GameOrder=input('You will be X, and I will be O. Would you like to go first? Y or N\n','s');
    clc
    %% Game Board
    fig(1)=figure('Position',[0.8 0.8 0.8 0.8]); %Positions and sizes the figure/gameboard
    axis(1)=axes; %Setting up axis
    hold on
    %Board Limits
    axis(1).XLim=[0 9];
    axis(1).YLim=[0 9];
    %Get rid of axis labels
    axis(1).YTick='';
    axis(1).XTick='';
    %Board Lines
    xline(axis(1),3,'k');
    xline(axis(1),6,'k');
    yline(axis(1),3,'k');
    yline(axis(1),6,'k');
    %Text to Specify Location on Board. Takes in coordinates and axis.
    t1=text(axis(1),1.5,7.5,'1','FontSize',25,'HorizontalAlignment','center');
    t2=text(axis(1),1.5,4.5,'2','FontSize',25,'HorizontalAlignment','center');
    t3=text(axis(1),1.5,1.5,'3','FontSize',25,'HorizontalAlignment','center');
    t4=text(axis(1),4.5,7.5,'4','FontSize',25,'HorizontalAlignment','center');
    t5=text(axis(1),4.5,4.5,'5','FontSize',25,'HorizontalAlignment','center');
    t6=text(axis(1),4.5,1.5,'6','FontSize',25,'HorizontalAlignment','center');
    t7=text(axis(1),7.5,7.5,'7','FontSize',25,'HorizontalAlignment','center');
    t8=text(axis(1),7.5,4.5,'8','FontSize',25,'HorizontalAlignment','center');
    t9=text(axis(1),7.5,1.5,'9','FontSize',25,'HorizontalAlignment','center');
    %% Indexing
    % Indexing total column, row, and diagonal values to calculate their
    % sum
    C1=0;
    C2=0;
    C3=0;
    R1=0;
    R2=0;
    R3=0;
    D1=0;
    D2=0;
    %Matrix Board keeps track of what everyone is picking 1's will be the
    %user and 5's will be the computer
    MatrixBoard=zeros([3 3]);
    %Compturn keeps track of if the computer already moved
    Compturn=0;
    %% Actual Game
    %User goes 1st
    if strcmpi(GameOrder,'Y')||strcmpi(GameOrder,'yes')
        for turn=1:9 %Length of game
        UserPick=input("Pick a space by typing in the space number and hitting enter\n",'s'); %Takes in string
        figure(fig)
        UserPick=str2double(UserPick); %This turns the string into a number or NaN, so if the user picks anything it won't crash
    %Don't let user screw up game
    %While loop goes until user picks something that exists
    while UserPick<1 || UserPick>9 || isnan(UserPick) %Checks if pick is in the range and is a numberwith isnan
    clc
    fprintf('Please pick a a space that exists\n')
    UserPick=input("Pick a space by typing in the space number and hitting enter\n",'s');
    UserPick=str2double(UserPick);
    figure(fig)
    end
    %While Loop goes until user picks a space that has not been taken i.e.
    %matrixboard shows a 0
    while MatrixBoard(UserPick)~=0 && ~isnan(UserPick)
        clc
        fprintf('Space is taken. Please pick another space.\n')
        UserPick=input("Pick a space by typing in the space number and hitting enter\n",'s');
        UserPick=str2double(UserPick);
        figure(fig)
    end
    figure(fig)
    %Call on User Function to get updated board. Outputs MatrixBoard
    %updates
    [MatrixBoard]=UserTicTacToe(MatrixBoard,t1,t2,t3,t4,t5,t6,t7,t8,t9,axis(1),fig(1),UserPick);
    %Check if someone won by calculating sums of each row, columns, and
    %diagonal
    C1=sum(MatrixBoard(:,1));
    C2=sum(MatrixBoard(:,2));
    C3=sum(MatrixBoard(:,3));
    R1=sum(MatrixBoard(1,:));
    R2=sum(MatrixBoard(2,:));
    R3=sum(MatrixBoard(3,:));
    D1=sum(MatrixBoard([1 5 9]));
    D2=sum(MatrixBoard([3 5 7]));
    figure(fig(1))
    %Break loop if someone won or tied by checking sums, will be 3 (1,1,1) for user and 15
    %for compuer (5,5,5)
    if C1==15||C1==3
        xline(1.5,'Color','r','LineWidth',3)
        break
    elseif C2==15||C2==3
        xline(4.5,'Color','r','LineWidth',3)
        break
    elseif C3==15||C3==3
        xline(7.5,'Color','r','LineWidth',3)
        break
    elseif R1==15||R1==3
        yline(7.5,'Color','r','LineWidth',3)
        break
    elseif R2==15||R2==3
        yline(4.5,'Color','r','LineWidth',3)
        break
    elseif R3==15||R3==3
        yline(1.5,'Color','r','LineWidth',3)
        break
    elseif D1==15||D1==3
        plot([0 9],[9 0],'r-','LineWidth',3)
        break
    elseif D2==15||D2==3
        plot([0 9],[0 9],'r-','LineWidth',3)
        break
    elseif sum(MatrixBoard<1,'all')==0
        break
    end
    %Call on computer function to plot pick, outputs the updated
    %matrixboard and the turn completed by the computer
    [MatrixBoard Compturn]=ComputerTicTacToe(MatrixBoard,t1,t2,t3,t4,t5,t6,t7,t8,t9,axis(1),fig(1),turn,C1,C2,C3,R1,R2,R3,D1,D2,Compturn);
    %Check if someone won or tied
    %Sum of matrixboard, columns, rows, and/or diagonal will equal 3 if
    %user wins or 15 if computer wins
    C1=sum(MatrixBoard(:,1));
    C2=sum(MatrixBoard(:,2));
    C3=sum(MatrixBoard(:,3));
    R1=sum(MatrixBoard(1,:));
    R2=sum(MatrixBoard(2,:));
    R3=sum(MatrixBoard(3,:));
    D1=sum(MatrixBoard([1 5 9]));
    D2=sum(MatrixBoard([3 5 7]));
    figure(fig(1))
    %Break the loop if any of the conditions have been met and someone has
    %won
    if C1==15||C1==3
        xline(1.5,'Color','r','LineWidth',3)
        break
    elseif C2==15||C2==3
        xline(4.5,'Color','r','LineWidth',3)
        break
    elseif C3==15||C3==3
        xline(7.5,'Color','r','LineWidth',3)
        break
    elseif R1==15||R1==3
        yline(7.5,'Color','r','LineWidth',3)
        break
    elseif R2==15||R2==3
        yline(4.5,'Color','r','LineWidth',3)
        break
    elseif R3==15||R3==3
        yline(1.5,'Color','r','LineWidth',3)
        break
    elseif D1==15||D1==3
        plot([0 9],[9 0],'r-','LineWidth',3)
        break
    elseif D2==15||D2==3
        plot([0 9],[0 9],'r-','LineWidth',3)
        break
    elseif sum(MatrixBoard<1,'all')==0
        break
    end
        end
    else
    %Computer lead
        for turn=1:9
    %Call on computer function to plot pick, outputs the updated
    %matrixboard and the turn completed by the computer
    [MatrixBoard Compturn]=ComputerTicTacToe(MatrixBoard,t1,t2,t3,t4,t5,t6,t7,t8,t9,axis(1),fig(1),turn,C1,C2,C3,R1,R2,R3,D1,D2,Compturn);
    %Check if someone won or tied
    %Sum of matrixboard, columns, rows, and/or diagonal will equal 3 if
    %user wins or 15 if computer wins
    C1=sum(MatrixBoard(:,1));
    C2=sum(MatrixBoard(:,2));
    C3=sum(MatrixBoard(:,3));
    R1=sum(MatrixBoard(1,:));
    R2=sum(MatrixBoard(2,:));
    R3=sum(MatrixBoard(3,:));
    D1=sum(MatrixBoard([1 5 9]));
    D2=sum(MatrixBoard([3 5 7]));
    figure(fig(1))
    %Break the loop if any of the conditions have been met and someone has
    %won
    if C1==15||C1==3
        xline(1.5,'Color','r','LineWidth',3)
        break
    elseif C2==15||C2==3
        xline(4.5,'Color','r','LineWidth',3)
        break
    elseif C3==15||C3==3
        xline(7.5,'Color','r','LineWidth',3)
        break
    elseif R1==15||R1==3
        yline(7.5,'Color','r','LineWidth',3)
        break
    elseif R2==15||R2==3
        yline(4.5,'Color','r','LineWidth',3)
        break
    elseif R3==15||R3==3
        yline(1.5,'Color','r','LineWidth',3)
        break
    elseif D1==15||D1==3
        plot([0 9],[9 0],'r-','LineWidth',3)
        break
    elseif D2==15||D2==3
        plot([0 9],[0 9],'r-','LineWidth',3)
        break
    elseif sum(MatrixBoard<1,'all')==0
        break
    end
    UserPick=input("Pick a space by typing in the space number and hitting enter\n",'s'); %Takes in string
    figure(fig)
    UserPick=str2double(UserPick); %This turns the string into a number or NaN, so if the user picks anything it won't crash
    %Don't let user screw up game
    %While loop goes until user picks something that exists
    while UserPick<1 || UserPick>9 || isnan(UserPick) %Checks if pick is in the range and is a numberwith isnan
    clc
    fprintf('Please pick a a space that exists\n')
    UserPick=input("Pick a space by typing in the space number and hitting enter\n",'s');
    UserPick=str2double(UserPick);
    figure(fig)
    end
    %While Loop goes until user picks a space that has not been taken i.e.
    %matrixboard shows a 0
    while MatrixBoard(UserPick)~=0 && ~isnan(UserPick)
        clc
        fprintf('Space is taken. Please pick another space.\n')
        UserPick=input("Pick a space by typing in the space number and hitting enter\n",'s');
        UserPick=str2double(UserPick);
        figure(fig)
    end
    figure(fig)
    %Call user function to output updated board with pick
    [MatrixBoard]=UserTicTacToe(MatrixBoard,t1,t2,t3,t4,t5,t6,t7,t8,t9,axis(1),fig(1),UserPick);
    %Check if someone won or tied by summing the columns, rows, and
    %diagonals. Should be 3 for the user and 15 for the computer
    C1=sum(MatrixBoard(:,1));
    C2=sum(MatrixBoard(:,2));
    C3=sum(MatrixBoard(:,3));
    R1=sum(MatrixBoard(1,:));
    R2=sum(MatrixBoard(2,:));
    R3=sum(MatrixBoard(3,:));
    D1=sum(MatrixBoard([1 5 9]));
    D2=sum(MatrixBoard([3 5 7]));
    figure(fig(1))
    %Break loop if someone won or tied given the conditions
    if C1==15||C1==3
        xline(1.5,'Color','r','LineWidth',3)
        break
    elseif C2==15||C2==3
        xline(4.5,'Color','r','LineWidth',3)
        break
    elseif C3==15||C3==3
        xline(7.5,'Color','r','LineWidth',3)
        break
    elseif R1==15||R1==3
        yline(7.5,'Color','r','LineWidth',3)
        break
    elseif R2==15||R2==3
        yline(4.5,'Color','r','LineWidth',3)
        break
    elseif R3==15||R3==3
        yline(1.5,'Color','r','LineWidth',3)
        break
    elseif D1==15||D1==3
        plot([0 9],[9 0],'r-','LineWidth',3)
        break
    elseif D2==15||D2==3
        plot([0 9],[0 9],'r-','LineWidth',3)
        break
    elseif sum(MatrixBoard<1,'all')==0
        break
    end
        end
    end
%Print response depending on who wins or if there is a tie
if C1==3||C2==3||C3==3||R1==3||R2==3||R3==3||D1==3||D2==3
    fprintf('Congrats, you won!\n')
elseif C1==15||C2==15||C3==15||R1==15||R2==15||R3==15||D1==15||D2==15
    fprintf('Hal 9000 wins... I mean I win. Better luck next time\n')
elseif sum(MatrixBoard<1,'all')==0
    fprintf('We tied. Try again if you want to be a real winner\n')
    text(axis(1),4.5,4.5,'C','Color','r','FontSize',200,'HorizontalAlignment','center')
end
figure(fig(1))
%Ask if they want to go again.
NewGame=input('Would you like to play again? Y or N.\n','s');
if strcmpi(NewGame,'Y')||strcmpi(NewGame,'yes')
    run("KINEHW2.m")
else
    fprintf('Thanks for playing.')
    close all
end
else
    clc
    fprintf('Oh Well, come back another time\n') %Losers who don't want to play
end
%% User
function [MatrixBoard]=UserTicTacToe(MatrixBoard,t1,t2,t3,t4,t5,t6,t7,t8,t9,zaxis,zfig,UserPick)
%Function takes in the existing board, labels, figure, and user's pick and outputs a
%updated board depending on the user's pick.
% Depending on what user picks delete existing text and replace with X
%Inputs:
%(1) Existing Matrix Board (MatrixBoard)
%(2-10) Existing text labels in order (t1-t9)
%(11) Axis (zaxis)
%(12) Figure (zfig)
%(13) Number chosen by the user (UserPick) 
%Outputs:
%(1) Updated Matrix Board

%Delete and replace text with 'X' dependng on what user picked
    if UserPick==1
        delete(t1)
        t1=text(zaxis(1),1.5,7.5,'X','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig);
    elseif UserPick==2
        delete(t2)
        t2=text(zaxis(1),1.5,4.5,'X','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif UserPick==3
        delete(t3)
        t3=text(zaxis(1),1.5,1.5,'X','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif UserPick==4
        delete(t4)
        t4=text(zaxis(1),4.5,7.5,'X','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif UserPick==5
        delete(t5)
        t5=text(zaxis(1),4.5,4.5,'X','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif UserPick==6
        delete(t6)
        t6=text(zaxis(1),4.5,1.5,'X','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif UserPick==7
        delete(t7)
        t7=text(zaxis(1),7.5,7.5,'X','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif UserPick==8
        delete(t8)
        t8=text(zaxis(1),7.5,4.5,'X','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    else
        delete(t9)
        t9=text(zaxis(1),7.5,1.5,'X','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    end
    MatrixBoard(UserPick)=1; %Update Board to reflect user's pick 1 was picked arbitrarily
end
%% Computer
function [MatrixBoard N]=ComputerTicTacToe(MatrixBoard,t1,t2,t3,t4,t5,t6,t7,t8,t9,zaxis,zfig,turn,C1,C2,C3,R1,R2,R3,D1,D2,N)
%Function takes in the existing board, labels, figure, turn, how many turns the computer has taken, and matrix
%sums for each column, row, and diagonal and outputs an updated board depending on the circumstances
%General order of computer picks are making a pick to win,
%making a pick to not lose, making a pick if the computer leads, making
%a pick if the user leads, and making a random pick to fill out the board.
%Inputs:
%(1) Existing Matrix Board (MatrixBoard)
%(2-10) Existing text labels in order (t1-t9)
%(11) Axis (zaxis)
%(12) Figure (zfig)
%(13) Current turn (turn)
%(14) Sum of values in leftmost column (C1)
%(15) Sum of values in center column (C2)
%(16) Sum of values in rightmost column (C3)
%(17) Sum of values in top row (R1)
%(18) Sum of values in middle row (R2)
%(19) Sum of values in bottom row (R3)
%(20) Sum of values in diagonal from top left to bottom right (D1)
%(21) Sum of values in diagonal from bottom left to top right (D2)
%(22) Current turn the computer is on (N)
%Outputs:
%(1) Updated Matrix Board
%(2) Turns completed by the computer


pause(0.5)%Slow Down Computer Pick

%N and Comppick are the same they both keep track if the computer has taken
%their turn yet.
%After each computer action N will go up 1 to match the turn. If it does not
%match, then the computer has not gone yet.
%Every if statement has been created through trial and error of playing
%tic-tac-toe

% Win if you can
if C1==10
    [r,c]=find(~MatrixBoard(:,1)); %Find the row and column of the variable that is 0
    MatrixBoard(r,1)=5; %Replace that variable to win
    N=N+1;
    %Replace row variable that is O to win
    if r==1
        delete(t1)
        t1=text(zaxis(1),1.5,7.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif r==2
        delete(t2)
        t2=text(zaxis(1),1.5,4.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif r==3
        delete(t3)
        t3=text(zaxis(1),1.5,1.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    end
elseif C2==10 && N~=turn
    [r,c]=find(~MatrixBoard(:,2)); %Find the row and column of the variable that is 0 and check if turn has already been completed
    MatrixBoard(r,2)=5; %Replace that variable to win
    N=N+1;
        if r==1
        delete(t4)
        t4=text(zaxis(1),4.5,7.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif r==2
        delete(t5)
        t5=text(zaxis(1),4.5,4.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif r==3
        delete(t6)
        t6=text(zaxis(1),4.5,1.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
        end
elseif C3==10 && N~=turn
    [r,c]=find(~MatrixBoard(:,3)); %Find the row and column of the variable that is 0 and check if turn has already been completed
    MatrixBoard(r,3)=5;%Replace that variable to win
    N=N+1;
        if r==1
        delete(t7)
        t7=text(zaxis(1),7.5,7.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif r==2
        delete(t8)
        t8=text(zaxis(1),7.5,4.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif r==3
        delete(t9)
        t9=text(zaxis(1),7.5,1.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
        end
elseif R1==10 && N~=turn 
    [r,c]=find(~MatrixBoard(1,:));%Find the row and column of the variable that is 0 and check if turn has already been completed
    MatrixBoard(1,c)=5;%Replace that variable to win
    N=N+1;
    if c==1
        delete(t1)
        t1=text(zaxis(1),1.5,7.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif c==2
        delete(t4)
        t4=text(zaxis(1),4.5,7.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif c==3
        delete(t7)
        t7=text(zaxis(1),7.5,7.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    end
elseif R2==10 && N~=turn
    [r,c]=find(~MatrixBoard(2,:)); %Find the row and column of the variable that is 0 and check if turn has already been completed
    MatrixBoard(2,c)=5;%Replace that variable to win
    N=N+1;
     if c==1
        delete(t2)
        t2=text(zaxis(1),1.5,4.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif c==2
        delete(t5)
        t5=text(zaxis(1),4.5,4.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif c==3
        delete(t8)
        t8=text(zaxis(1),7.5,4.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    end
elseif R3==10 && N~=turn
    [r,c]=find(~MatrixBoard(3,:));%Find the row and column of the variable that is 0 and check if turn has already been completed
    MatrixBoard(3,c)=5;%Replace that variable to win
    N=N+1;
     if c==1
        delete(t3)
        t3=text(zaxis(1),1.5,1.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif c==2
        delete(t6)
        t6=text(zaxis(1),4.5,1.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif c==3
        delete(t9)
        t9=text(zaxis(1),7.5,1.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    end
elseif D1==10 && N~=turn
    MatrixBoardD=ones([3 3]); %Create matrix of non zero numbers
    MatrixBoardD([1 5 9])=MatrixBoard([1 5 9]); %Replace diagonal
    [r,c]=find(~MatrixBoardD);%Find the row and column of the variable that is 0 and check if turn has already been completed
    MatrixBoard(r,c)=5; %Replace that variable to win
    N=N+1;
    if MatrixBoardD(1)==0
        delete(t1)
        t1=text(zaxis(1),1.5,7.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif MatrixBoardD(5)==0
        delete(t5)
        t5=text(zaxis(1),4.5,4.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif MatrixBoardD(9)==0
        delete(t9)
        t9=text(zaxis(1),7.5,1.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    end
elseif D2==10 && N~=turn
    MatrixBoardD=ones([3 3]);%Create matrix of non zero numbers
    MatrixBoardD([3 5 7])=MatrixBoard([3 5 7]);%Replace diagonal
    [r,c]=find(~MatrixBoardD); %Find the row and column of the variable that is 0 and check if turn has already been completed
    MatrixBoard(r,c)=5; %Replace that variable to win
    N=N+1;
    if MatrixBoardD(3)==0
        delete(t3)
        t3=text(zaxis(1),1.5,1.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif MatrixBoardD(5)==0
        delete(t5)
        t5=text(zaxis(1),4.5,4.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif MatrixBoardD(7)==0
        delete(t7)
        t7=text(zaxis(1),7.5,7.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    end
end
%% Defense
%Check if the user is about to win and stop them
if C1==2 && N~=turn
    [r,c]=find(~MatrixBoard(:,1)); %Find the row and column of the variable that is 0 and check if turn has already been completed
    MatrixBoard(r,1)=5; %Replace 0
    N=N+1;
    if r==1
        delete(t1)
        t1=text(zaxis(1),1.5,7.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif r==2
        delete(t2)
        t2=text(zaxis(1),1.5,4.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif r==3
        delete(t3)
        t3=text(zaxis(1),1.5,1.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    end
elseif C2==2 && N~=turn
    [r,c]=find(~MatrixBoard(:,2)); %Find the row and column of the variable that is 0 and check if turn has already been completed
    MatrixBoard(r,2)=5; %Replace 0
    N=N+1;
        if r==1
        delete(t4)
        t4=text(zaxis(1),4.5,7.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif r==2
        delete(t5)
        t5=text(zaxis(1),4.5,4.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif r==3
        delete(t6)
        t6=text(zaxis(1),4.5,1.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
        end
elseif C3==2 && N~=turn
    [r,c]=find(~MatrixBoard(:,3)); %Find the row and column of the variable that is 0 and check if turn has already been completed
    MatrixBoard(r,3)=5; %Replace 0
    N=N+1;
        if r==1
        delete(t7)
        t7=text(zaxis(1),7.5,7.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif r==2
        delete(t8)
        t8=text(zaxis(1),7.5,4.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif r==3
        delete(t9)
        t9=text(zaxis(1),7.5,1.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
        end
elseif R1==2 && N~=turn
    [r,c]=find(~MatrixBoard(1,:)); %Find the row and column of the variable that is 0 and check if turn has already been completed
    MatrixBoard(1,c)=5; %Replace 0
    N=N+1;
    if c==1
        delete(t1)
        t1=text(zaxis(1),1.5,7.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif c==2
        delete(t4)
        t4=text(zaxis(1),4.5,7.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif c==3
        delete(t7)
        t7=text(zaxis(1),7.5,7.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    end
elseif R2==2 && N~=turn
    [r,c]=find(~MatrixBoard(2,:)); %Find the row and column of the variable that is 0 and check if turn has already been completed
    MatrixBoard(2,c)=5; %Replace 0
    N=N+1;
        if c==1
        delete(t2)
        t2=text(zaxis(1),1.5,4.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif c==2
        delete(t5)
        t5=text(zaxis(1),4.5,4.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif c==3
        delete(t8)
        t8=text(zaxis(1),7.5,4.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
        end
elseif R3==2 && N~=turn
    [r,c]=find(~MatrixBoard(3,:)); %Find the row and column of the variable that is 0 and check if turn has already been completed
    MatrixBoard(3,c)=5; %Replace 0
    N=N+1;
     if c==1
        delete(t3)
        t3=text(zaxis(1),1.5,1.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif c==2
        delete(t6)
        t6=text(zaxis(1),4.5,1.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif c==3
        delete(t9)
        t9=text(zaxis(1),7.5,1.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    end
elseif D1==2 && N~=turn
    MatrixBoardD=ones([3 3]);%Make matrix of non zero numbers
    MatrixBoardD([1 5 9])=MatrixBoard([1 5 9]);%Replace diagonal
    [r,c]=find(~MatrixBoardD); %Find the row and column of the variable that is 0 and check if turn has already been completed
    MatrixBoard(r,c)=5; %Replace 0
    N=N+1;
    if MatrixBoardD(1)==0
        delete(t1)
        t1=text(zaxis(1),1.5,7.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif MatrixBoardD(5)==0
        delete(t5)
        t5=text(zaxis(1),4.5,4.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif MatrixBoardD(9)==0
        delete(t9)
        t9=text(zaxis(1),7.5,1.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    end
elseif D2==2 && N~=turn
    MatrixBoardD=ones([3 3]); %Matrix of non zero numbers
    MatrixBoardD([3 5 7])=MatrixBoard([3 5 7]);%Replace diagonal
    [r,c]=find(~MatrixBoardD); %Find the row and column of the variable that is 0 and check if turn has already been completed
    MatrixBoard(r,c)=5;%Replace 0
    N=N+1;
    if MatrixBoardD(3)==0
        delete(t3)
        t1=text(zaxis(3),1.5,1.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif MatrixBoardD(5)==0
        delete(t5)
        t5=text(zaxis(1),4.5,4.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif MatrixBoardD(9)==0
        delete(t9)
        t9=text(zaxis(1),7.5,7.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    end
end
% Computer Start
if sum(MatrixBoard,'all')==0 %If the computer starts, i.e. board is empty start here
    MatrixBoard(3)=5; %Always start in bottom left corner becaue why not
    N=N+1;
        delete(t3)
        t3=text(zaxis(1),1.5,1.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
end
%Turn 2 go for an empty adjacent corner check if computer led with bottom
%left and check which adjacent corner is open
if MatrixBoard(3)==5 && turn==2 && MatrixBoard(9)==0 && N~=turn %Turn 2 choice
    MatrixBoard(9)=5;
    N=N+1;
    delete(t9)
    t9=text(zaxis(1),7.5,1.5,'O','FontSize',25,'HorizontalAlignment','center');
    refresh(zfig)
elseif MatrixBoard(3)==5 && turn==2 && MatrixBoard(1)==0 && N~=turn %Turn 2 choice if 1st choice is taken
    MatrixBoard(1)=5;
    N=N+1;
        delete(t1)
        t1=text(zaxis(1),1.5,7.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
end
%Turn 3 go for middle with two adjacent corners chosen to set up diagonal
%wins if open. If not possible go for a third corner not yet chosen
if MatrixBoard(3)==5 && MatrixBoard(9)==5 && MatrixBoard(5)==0 && turn==3 && N~=turn
    MatrixBoard(5)=5;
    N=N+1;
    delete(t5)
    t5=text(zaxis(1),4.5,4.5,'O','FontSize',25,'HorizontalAlignment','center');
    refresh(zfig)
elseif MatrixBoard(3)==5 && MatrixBoard(1)==5 && MatrixBoard(5)==0 && turn==3 && N~=turn
    MatrixBoard(5)=5;
    N=N+1;
    delete(t5)
    t5=text(zaxis(1),4.5,4.5,'O','FontSize',25,'HorizontalAlignment','center');
    refresh(zfig)
elseif MatrixBoard(3)==5 && MatrixBoard(1)==5 && MatrixBoard(7)==0 && turn==3 && N~=turn
    MatrixBoard(7)=5;
    N=N+1;
    delete(t7)
    t7=text(zaxis(1),7.5,7.5,'O','FontSize',25,'HorizontalAlignment','center');
    refresh(zfig)
elseif MatrixBoard(3)==5 && MatrixBoard(9)==5 && MatrixBoard(7)==0 && turn==3 && N~=turn
    MatrixBoard(7)=5;
    N=N+1;
    delete(t7)
    t7=text(zaxis(1),7.5,7.5,'O','FontSize',25,'HorizontalAlignment','center');
    refresh(zfig)
end
%% User Lead
%Always lead middle if you go second and middle is not chosen. Otherwise
%follow as if the computer lead
if turn==1 && MatrixBoard(5)==0 && N~=turn
    MatrixBoard(5)=5;
    N=N+1;
    delete(t5)
    t5=text(zaxis(1),4.5,4.5,'O','FontSize',25,'HorizontalAlignment','center');
    refresh(zfig)
elseif turn==1 && MatrixBoard(5)==1 && N~=turn
    MatrixBoard(3)=5;
    N=N+1;
    delete(t3)
    t3=text(zaxis(1),1.5,1.5,'O','FontSize',25,'HorizontalAlignment','center');
    refresh(zfig)
end
%Stop the user from setting up trap where they get a win by having a corner
%with one above/below and one left/right. Do this anytime after the second
%turn.
if turn>=2 && MatrixBoard(2)==1 && MatrixBoard(4)==1 && MatrixBoard(1)==0 && N~=turn
    MatrixBoard(1)=5;
    N=N+1;
    delete(t1)
    t1=text(zaxis(1),1.5,7.5,'O','FontSize',25,'HorizontalAlignment','center');
    refresh(zfig)
elseif turn>=2 && MatrixBoard(4)==1 && MatrixBoard(8)==1 && MatrixBoard(7)==0 && N~=turn
    MatrixBoard(7)=5;
    N=N+1;
    delete(t7)
    t7=text(zaxis(1),7.5,7.5,'O','FontSize',25,'HorizontalAlignment','center');
    refresh(zfig)
elseif turn>=2 && MatrixBoard(6)==1 && MatrixBoard(2)==1 && MatrixBoard(3)==0 && N~=turn
    MatrixBoard(3)=5;
    N=N+1;
    delete(t3)
    t3=text(zaxis(1),1.5,1.5,'O','FontSize',25,'HorizontalAlignment','center');
    refresh(zfig)
elseif turn>=2 && MatrixBoard(6)==1 && MatrixBoard(8)==1 && MatrixBoard(9)==0 && N~=turn
    MatrixBoard(9)=5;
    N=N+1;
    delete(t9)
    t9=text(zaxis(1),7.5,1.5,'O','FontSize',25,'HorizontalAlignment','center');
    refresh(zfig)
end
%For turn 2 if the computer has the middle and a corner has been chosen by
%the user put it to the right or left (depending on what is open) to stop
%the user from winning by putting it in three corners
if turn==2 && MatrixBoard(5)==5 && MatrixBoard(2)==0 && (MatrixBoard(1)+MatrixBoard(3)+MatrixBoard(7)+MatrixBoard(9))>0 && MatrixBoard(3)+MatrixBoard(8)~=2 && N~=turn
    MatrixBoard(2)=5;
    N=N+1;
    delete(t2)
    t2=text(zaxis(1),1.5,4.5,'O','FontSize',25,'HorizontalAlignment','center');
    refresh(zfig)
elseif turn==2 && MatrixBoard(5)==5 && MatrixBoard(2)==0 && (MatrixBoard(1)+MatrixBoard(3)+MatrixBoard(7)+MatrixBoard(9))>0 && MatrixBoard(3)+MatrixBoard(8)==2 && N~=turn
    MatrixBoard(9)=5;
    N=N+1;
    delete(t9)
    t9=text(zaxis(1),7.5,1.5,'O','FontSize',25,'HorizontalAlignment','center');
    refresh(zfig)   
elseif turn==2 && MatrixBoard(5)==5 && MatrixBoard(8)==0 && N~=turn
    MatrixBoard(8)=5;
    N=N+1;
    delete(t8)
    t8=text(zaxis(1),7.5,4.5,'O','FontSize',25,'HorizontalAlignment','center');
    refresh(zfig)
elseif turn==2 && MatrixBoard(5)==5 && MatrixBoard(3)==0 && N~=turn
    MatrixBoard(3)=5;
    N=N+1;
    delete(t3)
    t3=text(zaxis(1),1.5,1.5,'O','FontSize',25,'HorizontalAlignment','center');
    refresh(zfig)
end
% End of Game Fill in Board. After turn 2 if none of the above conditions
% are met then it is ok to randomly assign variables as this will only
% result in a tie
if turn>2 && N~=turn && sum(MatrixBoard<1,'all')~=0 %DO this till the board is filled
CompPick = randi([1 9]); %Randomly pick computer space pick
N=N+1;
while MatrixBoard(CompPick) ~= 0 %Make sure computer pick is not already taken
    CompPick = randi([1 9]);
end
%Replace with computer pick
    if CompPick==1
        delete(t1)
        t1=text(zaxis(1),1.5,7.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif CompPick==2
        delete(t2)
        t2=text(zaxis(1),1.5,4.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif CompPick==3
        delete(t3)
        t3=text(zaxis(1),1.5,1.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif CompPick==4
        delete(t4)
        t4=text(zaxis(1),4.5,7.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif CompPick==5
        delete(t5)
        t5=text(zaxis(1),4.5,4.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif CompPick==6
        delete(t6)
        t6=text(zaxis(1),4.5,1.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif CompPick==7
        delete(t7)
        t7=text(zaxis(1),7.5,7.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    elseif CompPick==8
        delete(t8)
        t8=text(zaxis(1),7.5,4.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    else
        delete(t9)
        t9=text(zaxis(1),7.5,1.5,'O','FontSize',25,'HorizontalAlignment','center');
        refresh(zfig)
    end
%Computer pick is equal to 5 in matrix
MatrixBoard(CompPick) = 5;
refresh(zfig)
end
end
