classdef displaypp < handle

properties
    window_pointer
    debug
endproperties

methods

    function obj = displaypp()
        status_screen = false;
        obj.debug = true;

        PsychImaging('PrepareConfiguration');
        PsychImaging('AddTask', 'FinalFormatting', 'DisplayColorCorrection', 'ClampOnly');
        PsychImaging('AddTask', 'General', 'EnableBits++Bits++Output');
        obj.window_pointer = PsychImaging('OpenWindow', 0);

        if status_screen
            BitsPlusPlus('SwitchToStatusScreen');
            pause(1);
        endif
    endfunction
    
    function trigger_pulse(obj, trigger_val)

        preselect_time = 10; % unidade: 100uS (10 = 1 ms)
        trigger_duration = 10; % unidade 100uS (10 = 1 ms).

        BitsPlusPlus('DIOCommand', obj.window_pointer, 1, 511, [ones(1,preselect_time) * trigger_val ones(1,trigger_duration)*(256 + trigger_val) zeros(1,248-(trigger_duration+preselect_time))], 0, 0, 2);
        disp(['Mandando trigger: ',num2str(trigger_val)] )
        Screen('Flip', obj.window_pointer);

        if obj.debug
            disp('DEBUG!')
            DrawFormattedText(obj.window_pointer,...
                    ['Foi enviado trigger ',num2str(trigger_val)],...
                    'center','center');
            Screen('Flip', obj.window_pointer);
            WaitSecs(2);
        endif

    endfunction
    
endmethods
endclassdef
