whichScreen=max(Screen('Screens'));
PsychImaging('PrepareConfiguration');
PsychImaging('AddTask', 'FinalFormatting', 'DisplayColorCorrection', 'ClampOnly');
PsychImaging('AddTask', 'General', 'EnableBits++Bits++Output');
[wptr,wrect] = PsychImaging('OpenWindow', whichScreen, [128 128 128], [0 0 1000 1000]);
