
%this function deals 
function[card] = DealCard
deckOfCards = [1,2,3,4,5,6,7,8,9,10,11,12,13];

card =[];
for i =1
    drawnCard = randsample(deckOfCards,1);
    if drawnCard >1 && drawnCard <11;
        card = drawnCard;
      

    else if drawnCard >10 && drawnCard <= 13;
            card = 10;
         

    else
        card = 11;
        
    end
    end
end
