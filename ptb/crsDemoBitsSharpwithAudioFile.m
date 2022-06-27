% crsDemoBitsSharpwithAudioFile.m
%
% Selects and triggers the first 3 tracks, one after another with 3
% seconds intervals.
% The AudioFile must be set to use DIN0 in the Playlist.xml file:
% UseDigitalInputD0="TRUE"
%
% History:
% 2015/07 JT created

showStatusScreen = false;
tracksToPlay = 1:3;   % tracks to play 
timeBetweenTracks = 5; % time in seconds between onset of tracks

preSelectTime = 10; % in units of 100uS (i.e. 10 = 1 millisecond)
triggerDuration = 10; % in units of 100uS (i.e. 10 = 1 millisecond).

% setup PTB in Bits++ mode with a midlevel grey back ground
whichScreen=max(Screen('Screens'));
PsychImaging('PrepareConfiguration');
PsychImaging('AddTask', 'FinalFormatting', 'DisplayColorCorrection', 'ClampOnly');
PsychImaging('AddTask', 'General', 'EnableBits++Bits++Output');
[wptr,wrect] = PsychImaging('OpenWindow', whichScreen);

% Switch to status screen mode so the change in the digital
% output can be seen on the screen
if showStatusScreen
    BitsPlusPlus('SwitchToStatusScreen');
    % Wait for the switch to complete
    pause(3);
end


for i=tracksToPlay,
    % Send Tlock to select and trigger the track.
    BitsPlusPlus('DIOCommand', wptr, 1, 511, [ones(1,preSelectTime)*i ones(1,triggerDuration)*(256+i) zeros(1,248-(triggerDuration+preSelectTime))], 0, 0, 2);
    disp(['Selecting track: ',num2str(i)] )
    Screen('Flip', wptr);

    % the actual trigger occurs one frame after it has been displayed so
    % show this text one frame after the trigger
    DrawFormattedText(wptr,['Track ',num2str(i),' playing now'],'center','center');
    Screen('Flip', wptr);
    
    % wait some time for the track to play
    WaitSecs(timeBetweenTracks);
end

% close TPB
sca;
