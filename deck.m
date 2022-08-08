
%deck of cards, players hand, dealers hand
deckOfCards = [1,2,3,4,5,6,7,8,9,10,11,12,13];
playerHand =[];
dealerHand =[];
%deal first card for player
card = randsample(deckOfCards,1);
for i = 1:2;
    if card >1 && card <11;
        PlayerCard = card;
        fprintf("the value of players first card is %d",PlayerCard);

    else if card >10 && card <= 13;
            PlayerCard = 10;
            fprintf("the value of players first card is %d",PlayerCard);

    else
        if total > 11
            PlayerCard = PlayerCard +1;
        else
            PlayerCard = PlayerCard +11;
        end
    end
    end
end

%check for winner