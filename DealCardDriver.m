%%driver file to test the functionallity of the DealCard Function

%assigning player hand with two cards from the deal card function
playerHand =[DealCard(1), DealCard(1)]

%assinging the dealerhand to a card from the deal card funciton
DealerHand = [DealCard(1)]

%psee if the player wants to hit or stand
choice=input("Enter 1 to hit, or 2 to stand")
if choice == 1
    %insert while of while player hand is under 21
    playerHand = [playerHand, DealCard(1)]
end

%dealing another card to dealer hand
DealerHand=[DealerHand,DealCard(1)]

%result: funciton ran as expected