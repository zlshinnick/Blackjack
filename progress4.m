play = 1;
cash=100;
while play==1
    clc


    %initialzing player and dealer hands as vectors
    PlayerHand=[];
    DealerHand =[];

    %taking player bet
    if cash ==0
        fprintf("Your out of money, you LOSE!\n\nGAMEOVER!!\n")
        break
    end

    [newcash,bet]=TakeBet(cash);
    disp("----------------------------------------")


    %dealing the first round of cards (2 to player and 1 to dealer)
    PlayerHand = [DealCard DealCard];
    DealerHand = [DealCard];

    %displaying the dealt cards of the first round
    fprintf('\nYour hand is %d, %d\n', PlayerHand(1),PlayerHand(2));
    fprintf('The total of your hand is %d\n\n',sum(PlayerHand));
    if sum(PlayerHand) == 21
        disp("BLACKJACK! You Win!")
    end
    fprintf('The dealer has a %d\n\n',DealerHand(1));

    %dealing next card to user
    choice =1;
    while sum(PlayerHand)<21 && choice ~=2;
        choice=input("Enter 1 to hit, or 2 to stand:");
        if choice == 1
            %insert while of while player hand is under 21
            PlayerHand = [PlayerHand, DealSecondCard(sum(PlayerHand))];
            disp('Your hand is now')
            disp(PlayerHand)
            fprintf('The total of your hand is %d\n',sum(PlayerHand))
            if sum(PlayerHand)>21
                fprintf("%d, you have Busted, the DEALER WINS!",sum(PlayerHand))
                cash = newcash;
                fprintf("\n you lose %d!",bet)
            end
            if sum(PlayerHand)==21
                disp("You have 21, you WIN")
                cash = newcash+(bet*2);
                fprintf("\n you win %d!",bet)

            end
        end

    end


    if choice ~=1;
        fprintf("You have chosen to stand, the dealer will now draw\n")
        DealerHand=[DealerHand DealSecondCard(sum(DealerHand))];
        fprintf("the dealer has drawn a %d\n",DealerHand(length(DealerHand)))
        fprintf("the total of dealer hand is %d\n\n",sum(DealerHand))
        choice=input("press 1 to continue");
    end
    while sum(DealerHand)<17 && sum(PlayerHand)<21
        fprintf ("the dealer will draw another card\n")
        DealerHand=[DealerHand DealSecondCard(sum(DealerHand))];
        fprintf("the dealer has drawn a %d\n",DealerHand(length(DealerHand)))
        fprintf('The total of dealer hand is %d\n',sum(DealerHand))
        choice=input("press 1 to continue:");

    end
    if sum(DealerHand)>21
        disp("you WIN the dealer has bust")
        fprintf("\n you win $%d!",bet)
        cash = newcash+(bet*2);

    end
    if sum(DealerHand) ==21
        disp('The dealer has 21, you LOSE')
        cash = newcash;
        fprintf("\n you lose $%d!",bet)
    end


    if sum(DealerHand)>sum(PlayerHand) && sum(DealerHand) <21
        fprintf("Dealer has %d, Player has %d, DEALER WINS\n",sum(DealerHand), sum(PlayerHand));
        cash = newcash;
        fprintf("\n you lose $%d!",bet)
    end

    if sum(DealerHand)==sum(PlayerHand)
        fprintf("Dealer has %d, Player has %d, STANDOFF",sum(DealerHand), sum(PlayerHand));

    end
    if sum(PlayerHand) > sum(DealerHand) && sum(PlayerHand)<21

        fprintf("Dealer has %d, Player has %d, PLAYER WINS\n",sum(DealerHand), sum(PlayerHand));
        cash = newcash+(bet*2);
        fprintf("\n you win $%d!",bet)

    end
    play=input("\n\nPress 1 to play again");
end
