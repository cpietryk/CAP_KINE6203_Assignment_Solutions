function guessThatNumber()  % *** WARNING: CONTAINS INTENTIONAL BUGS! ***
%---------------------------------------------------------------
%       USAGE: guessThatNumber() - Assignment 5
%
%        NAME: Christopher Pietryk
%
% DESCRIPTION: This program is supposed to allow the user to play
%              the Number Guessing Game, however, it contains bugs.
%              Your job is to find, correct, and mark the errors with
%              comments describing the bug, how you found it, 
%              and how you corrected it. Correct the bugs and submit this
%              corrected file on github. There are between 9 - 12 bugs,
%              depending on how you correct them. 
%
%      INPUTS: None
%
%     OUTPUTS: None
%
%---------------------------------------------------------------
%Note: The bug, how it was fixed, and how it was corrected is below the
%line of code fixed.
beginner = 1;               % beginner level #
moderate = 2;               % moderate level #
advanced = 3;               % advanced level #
beginnerHighest = 10;       % highest possible number for beginner
moderateHighest = 100;      % highest possible number for moderate
advancedHighest = 1000;    % highest possible number for advanced

% clear screen and display game introduction

clc()
fprintf(['Guess That Number Game (buggy)\n\n', ...
'This program plays the game of Guess That Number in which you have to guess\n', ...
'a secret number.  After each guess you will be told whether your \n', ...
'guess is too high, too low, or correct.\n\n'])

% Get level of play (1-3) from user

fprintf('Please select one of the three levels of play:\n')
fprintf('   1) Beginner (range is 1 to %d)\n', beginnerHighest)
fprintf('   2) Moderate (range is 1 to %d)\n', moderateHighest)
fprintf('   3) Advanced (range is 1 to %d)\n', advancedHighest)

level = input('Enter level (1-3): '); 

while level ~= beginner && level ~= moderate && level ~= advanced
% Bug Fix: 
% Bug: The bug was the while loop used or (||) symbols 
% causing the input level to never be valid because two levels
% were always not chosen. 
% How it was found:The function was run and a 1
% was typed in for the level, and it still stated that this was an invalid
% level selection even though it should be valid.
% Correction: I corrected this by replacing the or symbols with and (&&)
% symbols ensuring that if 1,2, and 3 were not typed in, it would show this
% input as invalid as intended.
fprintf('Sorry, that is not a valid level selection.\n')
level = input('Please re-enter a level of play (1-3): ');
end

% set highest secret number based on level selected

if level == beginner %Bug found: I found this by trying to run the code and getting a incorrect use of '=' error message.                      

highest = beginnerHighest;

elseif level == moderate

highest = moderateHighest;

else
highest = advancedHighest;
% Bug Fix: 
% Bug: The bug was that highest was being set to advancedhighest, a 
% variable that was not predefined because MATLAB is case sensitive. 
% How it was found:The function was run as normal with the 3 level being
% chosen but an error occurred stating that highest could not be assigned 
% to an unrecognized variable.
% Correction: I corrected this by capitalizing the h in advancedhighest to
% match the predefined advancedHighest variable in the function
end

% randomly select secret number between 1 and highest for level of play

secretNumber = randi(highest);
% Bug Fix: 
% Bug: The bug was in the following line floor(rand() + 1 * highest). The
% code attempts to make sure the minimum is 1 by adding 1 in the equation,
% but because of order of operations this just rounds down the sum of a
% random number between 0 and 1 and the highest possible number. This makes
% the secret number the highest every time.
% How it was found: I ran the function at the easiest level a couple of 
% times starting with the lowest or highest possible guess to test it out
% and when it was 10 three straight times I looked at how the secret number
% was chosen.
% Correction: I corrected this by replacing the entire line with the MATLAB
% randi function that gives a random integer between 1 and your typed in
% maximum value. This was a simpler and correct way of doing it.

% initialize number of guesses and User_guess

numOfTries = 0;
% Bug Fix: 
% Bug: The bug was that number of tries started at 1 and was added to 
% before checking whether the guess was correct or not, meaning the user 
% always started off with 2 guesses while only guessing once. 
% How it was found: I ran the function a couple of times on the easiest 
% difficulty to guess right on the first try and feel good about myself,
% but I did not get the prompt saying I got it on the first try when 
% I guessed it right on the first try meaning the prompt or number of tries 
% was wrong.
% Correction: I corrected this by having the number of tries start at 0.
userGuess = 0;

% repeatedly get user's guess until the user guesses correctly

while userGuess ~= secretNumber

% get a valid guess (an integer from 1-Highest) from the user

fprintf('\nEnter a guess (1-%d): ', highest);
userGuess = input('');
while userGuess < 1 || userGuess > highest
% Bug Fix: 
% Bug: The bug was that if the the user guess was equal to the highest
% it would show as an invalid guess and make the user redo the guess,
% however this is a valid guess.
% How it was found: I ran the function as stated before by typing in the
% highest number in the range on the easiest difficulty, but it stated that
% this was an invalid guess, so I looked at where that prompt came from.
% Correction: I corrected this by changing the >= to just a >.

fprintf('Sorry, that is not a valid guess.\nRe-enter a guess (1-%d): ', highest);

userGuess = input('');

end % of guess validation loop

% add 1 to the number of guesses the user has made

numOfTries = numOfTries + 1;

% report whether the user's guess was high, low, or correct

if userGuess < secretNumber
% Bug Fix: 
% Bug: The bug was that the if statement of, if the user guess is greater 
% than the secret number, was used twice in this conditional statement set. 
% The first If statement and first Elseif statement had the same 
% conditionals. This can't be the case and is incorrect if you want to
% print that the guess was too low.
% How it was found: I read through the function before running to see if
% MATLAB identified any immediate errors, and MATLAB recognized a fatal
% error of the first two statements being the same conditionals.
% Correction: I corrected this by changing the > symbol to a < symbol,
% correctly printing that the guess was too low (lower than the secret
% number).
fprintf('Sorry, %d is too low.\n', userGuess);
elseif userGuess > secretNumber 
fprintf('Sorry, %d is too high.\n', userGuess);
elseif numOfTries == 1
fprintf('\nLucky You!  You got it on your first try!\n\n');
else
fprintf('\nCongratulations!  You got %d in %d tries.\n\n', ...
[secretNumber numOfTries]);
% Bug Fix: 
% Bug: The bug was that the congrats message displayed the number and
% number of tries as the same in its message which will most likely not be
% the case.
% How it was found: I ran the function a couple of times once 
% everything else was corrected, and it kept displaying the number of tries
% and secret number as the same in the congrats message which was not the
% case.
% Correction: I corrected this by making the second input of the fprintf 
% function an array with the secret number and number of 
% tries variables.
end
% Bug Fix: 
% Bug: The bug was that between the two while loops and one if statement
% above there were only two ends originally. Each conditional needs and end
% statement.
% How it was found: I read through the function before running to see if
% any MATLAB identified any immediate errors, and MATLAB recognized a fatal
% error of the first while loop not having an end even though it was called
% out directly after this meaning one of these conditionals was missing an
% end.
% Correction: I corrected this by adding an end after the above if
% statement.
end  % of guessing while loop
fprintf('Game Over. Thanks for playing the Guess That Number game.\n\n');
% Bug: The Game Over message was inside the while loop printing every time
% a number was typed in.
% How it was found: I found this by running the function when all of the
% fatal errors were corrected and it displayed game over every time I typed
% in a guess and would continue to prompt me for more if I was incorrect.
% Correction: I corrected this by moving the fprintf function displaying
% game over down and outside of the while loop (after end statement).

% end of game