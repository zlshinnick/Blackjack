PlayerHand=[]
DealerHand =[]

%dealing the first round of cards (2 to player and 1 to dealer)
PlayerHand = [DealCard DealCard]
DealerHand = [DealCard]

%displaying the dealt cards of the first round
fprintf('Your hand is %d, %d\n', PlayerHand(1),PlayerHand(2))
fprintf('The total of your hand is %d\n',sum(PlayerHand))
fprintf('The dealer has a %d\n\n',DealerHand(1))

%dealing next card to user

while sum(PlayerHand)<21
    choice=input("Enter 1 to hit, or 2 to stand")
    if choice == 1
        %insert while of while player hand is under 21
        PlayerHand = [PlayerHand, DealSecondCard(sum(PlayerHand))]
        disp('Your hand is now')
        disp(PlayerHand)
        fprintf('The total of your hand is %d\n',sum(PlayerHand))
        if sum(PlayerHand)>21
            fprintf("%d, you have busted, the dealer wins",sum(PlayerHand))
        end
    end
end








