function [gotKey, rt, key, key_num] = wait4key(DURATION, KEYS_ALLOWED, TERMINATE_UPON_RESP, ALLOW_QUIT)
%% KEYS_ALLOWED should be a cell, like {'a','b', 'Space'}
%% if TERMINATE_UPON_RESP = True, terminate the wait function
%% Author: Qiandong Wang 2021.5.6 at Beijing Normal University
    KbName('UnifyKeyNames');
    if ALLOW_QUIT == true
        KEYS_ALLOWED{length(KEYS_ALLOWED)+1}= 'ESCAPE';
    end
    KEYS_ALLOWED2=KbName(KEYS_ALLOWED);
    timeOut = false; 
    gotKey1 = false;
    gotKey2 = false; 
    startTime = GetSecs;
    while not (timeOut || gotKey1)
        current_time = GetSecs;
        if current_time >= (DURATION + startTime)
            timeOut = true;   % check for time out
        end
        [keyIsDown, Secs, keyCode] = KbCheck;%check key press
            [LIA,LOCB]=ismember(find(keyCode), KEYS_ALLOWED2);
        if keyIsDown
            if (ALLOW_QUIT == true) && find(keyCode)== KEYS_ALLOWED2(end)
                Screen('CloseAll'); 
            elseif (TERMINATE_UPON_RESP == true) && (LIA)
                gotKey1 = true;
                gotKey2 = true;
                rt=GetSecs-startTime;
                key=KEYS_ALLOWED{LOCB};
                key_num = find(keyCode);
            elseif (TERMINATE_UPON_RESP == false) && (LIA)
                %gotKey1 = false;
                gotKey2 = true;
                rt=GetSecs-startTime;
                key=KEYS_ALLOWED{LOCB};
                key_num = find(keyCode);
            end
        end
      if gotKey2
          gotKey=true; rt=rt; key=key; key_num = key_num;
      else
          gotKey=false; rt=NaN; key=NaN; key_num = NaN;
      end
           
    end    
end
