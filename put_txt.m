function put_txt(wPtr, txt, fontSize,color)
%new
     KbName('UnifyKeyNames');
    Screen('TextSize',wPtr,fontSize);
    DrawFormattedText(wPtr, txt, 'center', 'center',color);
    % Screen('TextColor',wPtr,color);
    Screen('Flip',wPtr);
end