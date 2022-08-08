%driver program to test the dealCard2 function

%assinging the deck function with four decks
deck = [1:13,1:13,1:13,1:13,1:13,1:13,1:13,1:13,1:13,1:13,1:13,1:13];

%loop should loop 200 times a produce card value

for i = 1:150

%calling dealcard2 funciton
%returning the PC1(player card) and the updated deck(card removed)
%takes in the input of the deck and the sum of player hand(0) for testing
[PC1,deck]=DealCard2(deck,0);   
disp(PC1)
end

%displaying the remainder of the deck after the for loop has finished
%running
disp(deck)

%%Expected: 
% Cards will be all valued from 2 -11 (no 1's as the player hand is initialised to 0

% There should be 8 cards in the deck as a game with four decks contains 208
% cards

%%Result:
% Cards were valued correctly
% 8 cards remaning in the deck


