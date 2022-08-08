
%deck of cards, players hand, dealers hand
deckOfCards = [1,2,3,4,5,6,7,8,9,10,11,12,13];
playerHand =[];
dealerHand =[];
%deal first card for player
card1 = randsample(deckOfCards,1);

for i = 1:2;
    if card1 >1 && card1 <11;
        PlayerCard1 = card1;
      

    else if card1 >10 && card1 <= 13;
            PlayerCard1 = 10;
         

    else
        if playerHand > 11
            PlayerCard1 = PlayerCard1 +1;
        else
            PlayerCard1 = PlayerCard1 +11;
        end
    end
    end
end
playerHand=[PlayerCard1];

%deal second card to player

card2 = randsample(deckOfCards,1);
for i = 1:2;
    if card2 >1 && card2 <11;
        PlayerCard2 = card2;
      

    else if card2 >10 && card2 <= 13;
            PlayerCard2 = 10;
         

    else
        if total > 11
            PlayerCard2 = PlayerCard2 +1;
        else
            PlayerCard2 = PlayerCard2 +11;
        end
    end
    end
end
playerHand=[playerHand PlayerCard2]
