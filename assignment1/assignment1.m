%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment 1: Matlab Scavenger Hunt and HelloWorld
%
% Submitted by:Christopher Pietryk
%
% Due: September 10, 2025
%
% Instructions: 

% There are two parts to this assignment. Part 1 deals with using the
% Matlab documentation to answer some questions or perform some tasks. Part
% 2 involves you writing your very first Matlab program!!

% Please write all of your responses in the following .mfile.
% If there are comments after the question (as in question 2) please 
% write your answer inside those comments. If there are not comments
% please write your answer with correct matlab syntax. 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%% Part 1  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1. Set the url of the matlab documentation to a variable called helpURL

helpURL="https://www.mathworks.com/help/matlab/index.html"; %Assigned URL

% 2. What does the command 'clear all' do?
%
% Answer: The clear all command clears all variables, scripts, and
% functions from the workspace releasing them from the system memory
%


% 3. Find a matlab function to take the average of the following
% numbers [1 7 21 32 67 32453]? Store your answer in a variable called
% averageAnswer.

averageAnswer=mean([1 7 21 32 67 32453]); %Calculates mean of input data

% 4. What command would you type to see a list of all installed toolboxes?

ver%<- command goes here
matlab.addons.toolbox.installedToolboxes
%&


% 5. Write some commands that would return a list of all of the available 
% functions in the image processing toolbox? 
help images %Folder is named images
what images
doc images



% 6. On the line below figure, write a command to draw a graph of 
% x and y. 

x = linspace(-2*pi,2*pi);
y = sin(x);

figure
plot(x,y)        %<- command goes here %Plots x on the x axis and y on the
%y axis

        

% 7. Find a function that performs a statistical test you've seen used
% in a journal article (there are many possible answers to this). What does
% this function do and how would you use it?

%
% Answer: The command I have used the most is the polyfit
% command. Polyfit outputs the coefficients for a set nth degree
% polynomial that best fits the data. In the past I used polyfit and paired
% it with polyval to perform a linear regression for data to get a mostly
% accurate polynomial estimation and find points that might be considered
% outliers (i.e.. outside 95% confidence interval). A more proper
% statistical test can be found in the statistics and machine learning
% toolbox. The anova1 command takes in a data set and does a one way
% analysis of the varaince in the data set, outputting sum of squares, mean
% square and more variance related information. This lets you know the
% impact difference of groups/aspects of an independent variable on the
% output. For example if I wanted to see if different types of training for
% a pitcher had more impact on their pitching velocity, I could perform an
% anova1 test to see if any of the training methods had a more drastic
% impact.
%

% 8. What are the 2 major types of loops that MATLAB supports? What is the
% difference between them?

%
% Answer: There are for loops and while loops. The difference is a for loop
% is repeated a specific number of times while a While loop repeats while a
% condition is true
% 


% 9. What does NaN stand for? Give an example of when you would get NaN as
% an answer. 

%
% Answer: It stands for not a number. You would get NaN as an answer when
% the result is an undefined number like infinity (i.e. divide any number
% by 0)
%


% 10. The following code snippet executes but contains an error (we don't
% get a useful answer). See if you can use the documentation to fix the 
% error to get the sum of the numbers in A. Do not change or remove 
% any of the values in A.

A = [1 2 3 2 1 NaN 1 2 3 NaN];
S = sum(A,"omitnan") %Omitnan tells the sum to skip over any values that are nan


% 11. I used to love playing the game minesweeper. Is there a way that I
% could play a similar game on Matlab? Write the command that would launch
% the game if so. 
xpbombs %Could not find in documentation had to look up in general.



% 12. Create a variable myAge and assign it the value of your age. Then 
% create a new variable called ageLessTwo and subtract two from the value of the
% myAge variable. Create a third variable called agePlusOne and add one to 
% the value of the myAge variable.
myAge=23
ageLessTwo=myAge-2 %Subtract 2 from og variable
agePlusOne=myAge+1 %Add one to og variable


% 13. Use the built-in function namelengthmax to find out the maximum number of
% characters that you can have in an identifier name under your version of
% MATLAB. Assign the value to a variable called maxNameLength.
maxNameLength=namelengthmax



% 14. You need to convert some weight values from metric to standard units. 
% Create two appropriately named variables to store the original weight in 
% pounds and the original weight in ounces respectively. Use who and whos 
% to see the variables. Clear one of your variables and then use who and whos again.

originalWeightkg = 100;
% Add your code on the next line
WeightLB=originalWeightkg*2.20462 %Multiplies by 2.2 to get to lbs
WeightOz=originalWeightkg*35.274 %Multiplies by 35.2 to get oz
who
whos
clear WeightLB %Cleared lbs from memory
who
whos


% 15. Assign a number with a decimal place to an appropriately named variable. Convert the
% variable to the type int32 and store the result in a new variable (hint: this is known
% as casting in computer programming). Use whos to check your result. 
DecimalNum=5.5
I32DecimalNum=cast(DecimalNum,"int32") %Converted number to int32
whos



% 16. Create a variable called weightInLBs to store a weight in pounds. Convert this to 
% kilograms using an appropriate calculation or function and assign the result to a variable weightInKgs.
weightInLBs=100
weightInKgs=weightInLBs/2.20462 %Divded by 2.2 to get to kgs



% 18. Create a variable fTemp to store a temperature in degrees Fahrenheit (F). 
% Convert this to degrees Celsius (C) using an appropriate 
% calculation and store the result in a variable cTemp.
fTemp=55
cTemp=(fTemp-32)/1.8 %subtract by 32 and divide by 1.8 to get to Celsius



% 19. Using the colon operator, create the following row vectors:
% 2 3 4 5 6 7 
% 1.1000 1.3000 1.5000 1.7000 
% 8 6 4 2
% Store your results with variable names vecA, vecB and vecC respectively.
vecA=2:1:7 %2 to 7 increasing by 1
vecB=1.1:0.2:1.7 %1.1 to 1.7 increasing by 0.2
vecC=8:-2:2 %8 to 2 decreasing by 2



% 20. Give a MATLAB expression that would create a vector 
% (assigned to a variable called vec) of 50 elements that range, equally spaced, 
% from 0 to 2pi. 
vec=linspace(0,2*pi,50) %array of 50 elements from 0 to 2pi



% 21. Using the colon operator and the transpose operator, 
% create a column vector that has the values -1 to 1 in steps of 0.5.
% Assign your answer to a variable called colVec.
colVec=(-1:0.5:1)' %-1 to 1 by 0.5 transposed



% 22. Create a variable called rows that is a random integer in the inclusive range 
% from 1 to 5. Create a variable called cols that is a random integer in the 
% inclusive range from 1 to 5. Create a matrix called resultMat of all zeros with the 
% dimensions given by the values of rows and cols. The resultMat should
% change each time you execute your code. 
rows=randi([1 5]) %random integer rows
cols=randi([1 5]) %random integer columns
resultMat=zeros([rows cols]) %Matrix creation of zeros



% 23. Create a vector of five random integers, each in the inclusive range 
% from -10 to 10 assigned to a variable named originalVec. Perform each of 
% the following on the original vector and store your results in appropriately 
% named variables. (you should have a seperate line of code for each)
originalVec=randi([-10 10],1,5) %Creates 5 column vector from -10 to 10
% - subtract 3 from each element
VecMinusThree=originalVec-3 %SUbtracts 3 from every number in the vector

% - count how many are positive
PositiveVecAmount=sum(originalVec>0) %Original Vec>0 makes changes the
% vector to 1's and 0's where 1's are where the statement is true. The sum
% counts the number of 1's

% - get the absolute value of each element
VecAbs=abs(originalVec) %absolute value of every element


% - find the maximum.
VecMax=max(originalVec) %Max between all of the elements


% 24. Write some code that will calculate the area of a trapezoid. Create
% variables for base1, base2, and height and assign them values. Store the
% result of your calculation in a variable called trapArea. Comment your
% code so that another user can understand what your code does. 


base1=1 %This is the bottom length of a trapzoid in inches
base2=2 %This is the top length of a trapezoid in inches
height=3 %This is the height of the trapezoid in inches
trapArea=(height/2)*(base1+base2) %THis calculates the area in in^2 of a 
% trapezoid given its height, top length, and bottom length 


% 25. If you were to start your own lab/business, a key metric that you 
% might use is ROI when applying for a business loan or making organizational 
% decisions. The classic equation for ROI is:

% ROI = (Total Revenues – Total Costs) / Total Costs x 100

% Write some code that prompts the user to input total revenues and total 
% costs and then calculates the ROI and stores the value in a variable called
% ROI.
TotRev=input("What is your total revenue  ")
TotCos=input("What is your total costs  ")
ROI=((TotRev-TotCos)/(TotCos))*100 %Outputs percent roi given input cost and revenue





%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%  Part 2: Hello World %%%%%%%%%%%%%%%%%%%%%%%%%%

% Write some code that will print the string 'Hello World' to the screen. 
% There are several ways that you could do this. For an extra challenge, 
% make your program able to take text input from the user and output 
% whatever they input. (For ease of running and executing your solution for 
% part 2, make sure you click the Run Section button vs the Run button) 

%%% Enter the code for your program below this line
clear all
clc
%Method 1
Message=input("What do you want to say  "  ,  "s");
display(Message)
%or fprintf(Message)
%Method 2
fprintf('Hello World\n')




%%%%% When you have completed everything, type the following two commands
%%%%% (without comments) into your command window. 

%%% load handel
%%% sound(y, Fs)