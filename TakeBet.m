%%function used at the start of every hand to take the users bet

%takes in the input of the users current cash balance
%returns the users new cash balance after the bet & the bet size

function[balance,bet]=TakeBet(cash);
%dipslays to the user the amount of money the have to bet with
fprintf("You have $%d dollars to bet with.\n",cash)

%asking the user for input how much they want to bet
bet=input("\nHow much would you like to bet?\n ");

%while loop to display error message if the users bet is greater then the
%amount of money they have, then asks them to place another bet
while bet> cash
    disp("Insufficent funds")
    disp("Please try again")
    bet=input("\nHow much would you like to bet?\n ");
end

%updating users cash balance after the bet
balance = cash-bet;

%displaying updated cash balance
fprintf("You have $%d remaining.\n\n",balance)
