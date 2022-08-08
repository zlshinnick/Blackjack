play = 1;
cash=1000;
while play==1
    clc


    %initialzing player and dealer hands as vectors
    PlayerHand=[];
    DealerHand =[];

    %taking player bet
    if cash ==0
        %playing game over sound
        SoundEffects(4)

        fprintf("Your out of money, you LOSE!\n\nGAMEOVER!!\n")
        break
    end

    [newcash,bet]=TakeBet(cash);
    pause(2)
    disp("The cards will now be dealt.")
    pause(2)

    SoundEffects(1)
    %dealing the first round of cards (2 to player and 1 to dealer)
    PlayerHand = [DealCard DealCard];
    DealerHand = [DealCard];

    %displaying the dealt cards of the first round
    fprintf('\nYour hand is %d, %d\n', PlayerHand(1),PlayerHand(2));
    pause(1)
    fprintf('The total of your hand is %d\n\n',sum(PlayerHand));
    if sum(PlayerHand) == 21
        %playing win sound effect
        SoundEffects(2)
        disp("BLACKJACK! You Win!")
        cash = newcash+(bet*3);
        fprintf("\n you win %d!",bet*2)
    end
    pause(2)
    fprintf('The dealer has a %d\n\n',DealerHand(1));

    %dealing next card to user
    choice =1;
    while sum(PlayerHand)<21 && choice ~=2;
        pause(2)
        choice=input("Enter 1 to hit, or 2 to stand:");
        if choice == 1
            %insert while of while player hand is under 21
            PlayerHand = [PlayerHand, DealSecondCard(sum(PlayerHand))];
            disp('Your hand is now')
            disp(PlayerHand)
            pause(2)
            fprintf('The total of your hand is %d\n\n',sum(PlayerHand))
            if sum(PlayerHand)>21

                pause(2)
                %play lose sound
                SoundEffects(3)

                fprintf("\n%d, you have Busted, the DEALER WINS!\n",sum(PlayerHand))
                cash = newcash;
                fprintf("\nyou lose %d!",bet)
            end
            if sum(PlayerHand)==21
                %playing win sound effect

                pause(2)
                SoundEffects(2)
                disp("You have 21, you WIN")

                cash = newcash+(bet*2);
                pause(2)
                fprintf("\n you win %d!",bet)

            end
        end

    end


    if choice ~=1;
        fprintf("\nYou have chosen to stand, the dealer will now draw\n")
        pause(3)
        DealerHand=[DealerHand DealSecondCard(sum(DealerHand))];
        fprintf("\nthe dealer has drawn a %d\n",DealerHand(length(DealerHand)))
        pause(2)
        fprintf("the total of dealer hand is %d\n\n",sum(DealerHand))
        pause(2)
        choice=input("press 1 to continue");
    end
    while sum(DealerHand)<17 && sum(PlayerHand)<21
        fprintf ("\nthe dealer will draw another card\n")
        pause(2)
        DealerHand=[DealerHand DealSecondCard(sum(DealerHand))];
        fprintf("\nthe dealer has drawn a %d\n",DealerHand(length(DealerHand)))
        pause(2)
        fprintf('\nThe total of dealer hand is %d\n',sum(DealerHand))
        pause(2)
        choice=input("press 1 to continue:");

    end
    if sum(DealerHand)>21
        %playing win douns effect
        SoundEffects(2)

        disp("you WIN the dealer has bust")
        pause(2)
        fprintf("\n you win $%d!",bet)
        cash = newcash+(bet*2);

    end
    if sum(DealerHand) ==21

        %play lose sound
        SoundEffects(3)

        disp('The dealer has 21, you LOSE')
        pause(2)
        cash = newcash;
        fprintf("\n you lose $%d!",bet)
    end


    if sum(DealerHand)>sum(PlayerHand) && sum(DealerHand) <21

        %play lose sound
        SoundEffects(3)

        fprintf("Dealer has %d, Player has %d, DEALER WINS\n",sum(DealerHand), sum(PlayerHand));
        pause(2)
        cash = newcash;
        fprintf("\n you lose $%d!",bet)
    end

    if sum(DealerHand)==sum(PlayerHand)
        fprintf("Dealer has %d, Player has %d, STANDOFF",sum(DealerHand), sum(PlayerHand));

    end
    if sum(PlayerHand) > sum(DealerHand) && sum(PlayerHand)<21

        %playing win sound effect
        SoundEffects(2)

        fprintf("\nDealer has %d, Player has %d, PLAYER WINS\n",sum(DealerHand), sum(PlayerHand));
        pause(2)
        cash = newcash+(bet*2);
        fprintf("\n you win $%d!",bet)

    end
    pause(2)
    play=input("\n\nPress 1 to play again");
end
