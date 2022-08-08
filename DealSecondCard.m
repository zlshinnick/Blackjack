function[card]=DealSecondCard(SumOfHand)

deckOfCards = [1,2,3,4,5,6,7,8,9,10,11,12,13];

card = -1;
for i =1
    drawnCard = randsample(deckOfCards,1);
    if drawnCard >1 && drawnCard <11;
        card = drawnCard;


    else if drawnCard >10 && drawnCard <= 13;
            card = 10;

    else if drawnCard == 1
            if SumOfHand < 11
                card = 11;
                if SumOfHand >11
                    card=1;
                end
            end
    end
    end
    end
end
end

