
%%this function has a list of sounds implemented which will be able to be
%used in the black jack game to easily call sound effects
function[] = SoundEffects(n)

%if the shuffling sound effect is desired to be called
% parameter of n will be assigned to 1
if n == 1
    %reading in the file                    
    [a,fs] = audioread('shuffling.mp3');
    %playing the sound
    sound(a,fs)
    
end


%winning sound effect 
%parameter of n is assigned to 2
if n==2
    [a,fs] = audioread('WinSound.mp3');
    sound(a,fs)
end

%losing sound effect
% parameter of n is assigned to 3
if n==3
    [a,fs]=audioread('lose.mp3');
    sound(a,fs)
end

%gameover sound effect
%parameter of n is assigned to 4
if n==4
    [a,fs]=audioread('gameover.mp3');
    sound(a,fs)
end

%oooooh sound effect (used for standoff in blackjack game
%n is assigned to 5
if n==5
    [a,fs]=audioread('oooooh.mp3');
    sound(a,fs)
end

%openening sound to the game
% n is assigned to 6
if n==6
    [a,fs]=audioread('OpeningSound.mp3');
        sound(a,fs)
end

%bet sound (to be played when a bet is placed 
%n is assigned to 7
if n==7
    [a,fs]=audioread('betSound2.mp3');
    sound(a,fs)
end
