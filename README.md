# eeg-audiofile
Receitas para usar o hardware de EEG e estimulação auditiva do Laboratório de Cognição Humana - UFABC-SBC

## Como controlar o AudioFile

- A maneira recomendada (não envolve mudanças em cabos etc) de gerar estímulos via AudioFile é controlando-o 
pelo monitor (Display++). 
- A maneira recomendada de se controlar o monitor é via _psychtoolbox_
- Para um exemplo de como fazer isso, veja o script [audiofile.m](./psych/audiofile.m)

## IMPORTANTE
- Para que o _psychtoolbox_ controle o Display++ corretamente, é necessário estar usando apenas o Display++ como monitor (desligar espelhamento ou monitores múltiplos).
- Um atalho útil para fazer isso é <kbd>Super</kbd> + <kbd>p</kbd> 
- No arquivo com a Playlist do Audiofile (que pode acessado montando-o como um disco externo), é necessário usar a opção `<Entry UseDigitalInputD0="TRUE"/>` para que ele seja controlado via Display++ corretamente.
- O `octave` precisa ser executado como _root_.

