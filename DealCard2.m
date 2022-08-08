%this function deals a card and takes it out of the deck array, returning
%the playing card and updated deck, taking the parameters of the deck and
%the sum of hand of the player whos card is being drawn
function[card,UpdatedDeck]=DealCard2(deck,SumOfHand)

%initilizing the card to -1
card =-1;

%choosing a random index from the deck
drawnCardIndex = randi([1,length(deck)],1);

%drawn card is the random index selected of the deck
drawnCard = deck(drawnCardIndex);

%removing this card from the deck vector
UpdatedDeck = deck([1:(drawnCardIndex-1), (drawnCardIndex+1):end]);

% if the card is between 2 and 10 it is simply a number card and its value
% will be the number of the card
if drawnCard >1 && drawnCard <11;
    card = drawnCard;

    % if the card is 11 12 or 13, it is a Jack, Queen or King and all of these
    % cards will be valued at 10 in the game
else if drawnCard >10 && drawnCard <= 13;
        card = 10;

        % if the card is a 1 then it is an Ace. The Ace can be played as either a 1
        % or 11 in the game of blackjack depending on the other cards in the hand.
        % If the total of the hand is less then 11, the Ace is valued at 11. If the
        % total of the hand is greater or equal to 11, the Ace is valued at as a 1
else if drawnCard == 1
        if SumOfHand <= 11
            card = 11;
            if SumOfHand >11
                card=1;
            end
        end
end
end
end
end



