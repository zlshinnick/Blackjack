%this is a blackjack/21 game

%initialising the variable play to 1, so the loop of the game runs
play = 1;

%the user will recive this amount of cash
%the amount of cash can be changed if desired by replacing the number the
%variable cash is assigned to
cash=1000;

%clearing the command window
clc

%playing the welcoming sound effects through the SoundEffects function
SoundEffects(6)
%displaying the welcome message to the user
fprintf("Welcome\n")

%pausing the output in the command window for 1 second
pause(1)
fprintf("\nto\n")

%pausing the output in the command window for 1 second
pause(1)
fprintf("\nthe\n")

%pausing the output in the command window for 1 second
pause(1)
fprintf("\nBLACK JACK TABLE!!!\n")


%pausing the script for 6 seconds to let the sound play out
pause(3)

%asking the user for input to see if they would like to read the rules of
%the game

RulesYN=input("\nIf you would like to hear the rules for the game type 1, if not press enter:");

pause(1)
%if the player wants to read the rules by presseing 1, the welcome
%function will run which displays the rules in the command window
if RulesYN== 1;
    Welcome
end

%clearing the command window after the rules have been displayed before the
%game begins
clc

%asking the user for input about how many decks of cards they want to be in
%the game
AmtOfDecks=input("How many decks of cards would you like to play with between 1 to 4\n");

%if the player selects 1 deck
if AmtOfDecks ==1
    deck = [1:13,1:13,1:13,1:13]; %1 to Ace deck of cards four times for the four different suits

    %displaying the amount of cards in the deck
    fprintf("\nThere are 52 cards in this game with 1 deck")

    %pausing for 3 seconds before the game begins
    pause(3)

end

%if the player selecets 2 decks
if AmtOfDecks ==2

    %initialising the vector of deck to the size of 2 full decks
    deck = [1:13,1:13,1:13,1:13,1:13,1:13,1:13,1:13];
    %displaying to the user the amount of cards in the game
    fprintf("\nThere are 104 cards in this game with 2 decks");

    %pausing for 3 seconds
    pause(3)
end

%if the player selects 3 decks
if AmtOfDecks==3

    %initialsing the vector of deck to the size of 3 full decks
    deck = [1:13,1:13,1:13,1:13,1:13,1:13,1:13,1:13,1:13,1:13,1:13,1:13];

    %displaying the amount of cards in the game
    fprintf("\nThere are 156 cards in this game with 3 decks");

    %pausing for 3 seconds
    pause(3)
end

%if the player selects four decks
if AmtOfDecks ==4

    %initialsing the variable of vector to the size of 4 full decks
    deck = [1:13,1:13,1:13,1:13,1:13,1:13,1:13,1:13,1:13,1:13,1:13,1:13,1:13,1:13,1:13,1:13];

    %displaying the amount of cards in the game to the user
    fprintf("\nThere are 208 cards in this game with 4 decks");

    %pausing for 3 seconds
    pause(3)
end

%while play == 1 this while loop will play
%this allows the user to quit the game at the end of a hand if they wish
while play==1

    %clearing the command window
    clc
    %initialzing player and dealer hands as vectors
    PlayerHand=[];
    DealerHand =[];

    %if the player has roun out of money this if statement will end the game
    if cash ==0
        %playing game over sound
        SoundEffects(4)
        %displaying the lose message to the user
        fprintf("Your out of money, you LOSE!\n\nGAMEOVER!!\n")

        %command to break the while loop and finish the game
        break
    end

    %take bet function, returning the new cash amount of the user and the
    %bet size
    [newcash,bet]=TakeBet(cash);

    %calling sound effects funciton to play the bet sound
    SoundEffects(7)

    pause(2)

    %displaying message to the user showing that the cards will now be
    %dealt
    disp("The cards will now be dealt.")

    %calling the SoundEffects funciton to play the shuffling sound
    SoundEffects(1)

    pause(2)


    %taking 2 cards out of the the deck for the player and 1 card out of
    %the deck for the dealer, using the DealCard2 function
    [PC1,deck]=DealCard2(deck,0);
    [PC2,deck]=DealCard2(deck,0);
    [DC1,deck]=DealCard2(deck,0);

    %making the playerHand vector store the 2 cards drawn from the deck
    PlayerHand = [PC1 PC2];

    %assinging the dealer card to the dealerhand vector
    DealerHand = [DC1];

    %displaying hand of the user
    fprintf('\nYour hand is %d, %d\n', PlayerHand(1),PlayerHand(2));

    pause(1)

    %displaying the total of the users hand in the command window
    fprintf('The total of your hand is %d\n\n',sum(PlayerHand));

    %if statement for if the player gets blackjack(21) from the initial
    %deal
    if sum(PlayerHand) == 21

        %playing win sound effect
        SoundEffects(2)

        %displaying winning message to the useer
        disp("BLACKJACK! You Win!")

        %updating the users cash to the cash after the bet + 3 time the bet
        %place
        cash = newcash+(bet*3);

        %displaying the amount won by the user
        fprintf("\n you win %d!",bet*2)
    end

    pause(2)

    %if statement for the if the players hand does not equal 21
    if sum(PlayerHand)~=21

        %displaying the dealers first card
        fprintf('The dealer has a %d\n\n',DealerHand(1));
    end

    %while loop to ask the user if they want to hit or stand next
    %assinging choice =1 so the loop will run for the first time
    choice =1;
    while sum(PlayerHand)<21 && choice ~=2;

        pause(2)

        %seeking input from the user asking if they would like to hit or
        %stand
        choice=input("Enter 1 to hit, or 2 to stand:");

        %if the user chooses to hit
        if choice == 1

            %drawing another card from the deck
            [DrawnCard,deck]=DealCard2(deck,sum(PlayerHand));

            %updating the user hand to include the new drawb card from the
            %deck
            PlayerHand = [PlayerHand, DrawnCard];

            pause(1)

            %displaying to the user the cardt they have drawn
            fprintf("\nYou have drawn a %d\n",PlayerHand(length(PlayerHand)))

            pause(2)

            %displaying the users hand with the new drawn card
            fprintf('\nYour hand is now\n')
            disp(PlayerHand)

            pause(2)

            %displaying the new total of the users hand
            fprintf('\nThe total of your hand is %d\n\n',sum(PlayerHand))

            %if the players hand is greater then 21 this if statement will
            %run
            if sum(PlayerHand)>21

                pause(2)

                %play lose sound
                SoundEffects(3)

                %displaying the lose statement for the user busting (going
                %over 21)
                fprintf("\n%d, you have Busted, the DEALER WINS!\n",sum(PlayerHand))

                %assinging the cash variable to the new cash which does not
                %include the bet of the hand
                cash = newcash;

                %displaying to the user how much they lost on the hand
                fprintf("\nyou lose %d!",bet)
            end

            %if the player hand is 21
            if sum(PlayerHand)==21
                %playing win sound effect
                pause(2)
                SoundEffects(2)

                %displaying winning message
                disp("You have 21, you WIN")

                %assining the cash variable with the winnings
                cash = newcash+(bet*2);

                pause(2)

                %displaying to the use rhow much they won
                fprintf("\n you win %d!",bet)

            end
        end

    end

    %if the user has chosen to stand
    if choice ~=1;

        %displaying message of the user standing
        fprintf("\nYou have chosen to stand, the dealer will now draw\n")
        pause(3)

        %drawing a new card for the dealer from the deck
        [DrawnCard,deck]=DealCard2(deck,sum(DealerHand));

        %assinging the new card to the vector of the DealersHand
        DealerHand=[DealerHand DrawnCard];

        %displaying to the user the card the dealer has drawn
        fprintf("\nthe dealer has drawn a %d\n",DealerHand(length(DealerHand)))
        pause(2)

        %displaying the total of the dealers hand
        fprintf("\nthe total of dealer hand is %d\n\n",sum(DealerHand))
        pause(2)

        %asking the user to press 1 to continue
        choice=input("\npress 1 to continue:");
    end

    %while loop for while the sum of the players hand is less then 17, and
    %the players hand is less then 21
    while sum(DealerHand)<17 && sum(PlayerHand)<21

        %displaying the the dealer will draw another card as they have not
        %reached atleast 17 yet
        fprintf ("\nthe dealer will draw another card\n")
        pause(2)

        %drawing another card from the deck for the dealer
        [DrawnCard,deck]=DealCard2(deck,sum(DealerHand));

        %updating the dealers hand with the new drawn card being assigned
        %to the dealer hand vectir
        DealerHand=[DealerHand DrawnCard];

        %displaying to the user the card the dealer has drawn
        fprintf("\nthe dealer has drawn a %d\n",DealerHand(length(DealerHand)))
        pause(2)

        %displaying the total of the dealers hand
        fprintf('\nThe total of dealer hand is %d\n',sum(DealerHand))
        pause(2)

        %asking the user to press 1 to continue
        choice=input("press 1 to continue:");

    end

    %if statemnt for if the dealer busts(goes over 21)
    if sum(DealerHand)>21
        %playing win douns effect
        SoundEffects(2)

        %displaying to the user they win because the dealer has bust
        fprintf("\nYou WIN the dealer has bust\n")
        pause(2)

        %displaying how much the user wins
        fprintf("\nYou win $%d!",bet)

        %updating the cash amount by adding the winnings to the users cash
        %balance
        cash = newcash+(bet*2);

    end

    %if statement for if the dealers hand is 21
    if sum(DealerHand) ==21

        %play lose sound
        SoundEffects(3)

        %displaying lose message to the user
        fprintf('The dealer has 21, you LOSE\n')
        pause(2)

        %updating the cash to not icnlude the bet amount
        cash = newcash;

        %displaying how much the player has lost
        fprintf("\n you lose $%d!",bet)
    end

    %if statement for if the dealers hand is closer to 21 then the users
    if sum(DealerHand)>sum(PlayerHand) && sum(DealerHand) <21

        %play lose sound
        SoundEffects(3)

        %displaying what the dealer has and what the user has
        %displaying that the dealer wins
        fprintf("Dealer has %d, Player has %d, DEALER WINS\n",sum(DealerHand), sum(PlayerHand));
        pause(2)

        %updating the players cash balance
        cash = newcash;

        %displaying how much the player has lost
        fprintf("\n you lose $%d!",bet)
    end

    %if statement for when the total of the dealers hand is the same as the
    %users
    if sum(DealerHand)==sum(PlayerHand)

        %playing standoff sound effect
        SoundEffects(5)

        %displaying that the hand is a standoff and no one wins
        fprintf("Dealer has %d, Player has %d, STANDOFF",sum(DealerHand), sum(PlayerHand));

    end

    %if statement for if the users hand is closer to 21 then the dealers
    if sum(PlayerHand) > sum(DealerHand) && sum(PlayerHand)<21

        %playing win sound effect
        SoundEffects(2)

        %displaying the total of the dealers hand and the users hand
        fprintf("\n\nDealer has %d, Player has %d, PLAYER WINS\n",sum(DealerHand), sum(PlayerHand));
        pause(2)

        %upsating the cash by adding the win amount to the cash variable
        cash = newcash+(bet*2);

        %displaying how much the user has won
        fprintf("\n you win $%d!",bet)

    end
    pause(2)

    %asking the user to play another hand
    %this will run the while funciton again of the gameplay
    play=input("\n\nPress 1 to play another hand:");
end
