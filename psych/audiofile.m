1;

function [wptr, wrect] = inicializa_display()
    showStatusScreen = false;

    whichScreen=max(Screen('Screens'));
    PsychImaging('PrepareConfiguration');
    PsychImaging('AddTask', 'FinalFormatting', 'DisplayColorCorrection', 'ClampOnly');
    PsychImaging('AddTask', 'General', 'EnableBits++Bits++Output');
    [wptr,wrect] = PsychImaging('OpenWindow', whichScreen);

    if showStatusScreen
        BitsPlusPlus('SwitchToStatusScreen');
        % Wait for the switch to complete
        pause(1);
    endif
endfunction



function toca_faixa(wptr, faixa)
   debug = true;
  
   preSelectTime = 10; % unidade: 100uS (10 = 1 ms)
   triggerDuration = 10; % unidade 100uS (10 = 1 ms).

   BitsPlusPlus('DIOCommand', wptr, 1, 511, [ones(1,preSelectTime)*faixa ones(1,triggerDuration)*(256+faixa) zeros(1,248-(triggerDuration+preSelectTime))], 0, 0, 2);
   disp(['Tocando faixa: ',num2str(faixa)] )
   Screen('Flip', wptr);

   if debug
      DrawFormattedText(wptr,['Foi enviado trigger ',num2str(faixa)],'center','center');
      Screen('Flip', wptr);
      WaitSecs(2);
   endif

endfunction

w = inicializa_display()
toca_faixa(w, 1);
KbWait();
sca;

