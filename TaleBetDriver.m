%%driver to test the functionallity of the teake bet function

%%Case 1 
%setting the cash ammount
cash = 100

%bet will = 30

%calling funciton
[newcash,bet]=TakeBet(cash);

%%expected results
%the program should display messages and ask for the users bet and then
%accuratley return the correct updated cash balance

fprintf("it is expected with cash off 100 and bet of 30, there should be 70 remaining\n")
fprintf("the reuslt shows the cash of %d and a bet size of %d, there is %d remaning",cash,bet,newcash)


%%Case 2 - Testing the insufficent funds funcitonallity, and testing a new
%%amount of cash to start with

cash = 10
%bet will be 20

[newcash,bet]=TakeBet(cash);

%%expected reults
% the program should display the user has insufficent funds for this bet
% and needs to place anoter bet

%%Results
% the program accuratley displays the user has insufficent funds for this
% bet and asks for another bet

