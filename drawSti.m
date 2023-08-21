function drawSti(wPtr, cond, pars, fontSize)
if strcmp(cond, 'fix')
    put_txt(wPtr, '+', fontSize,[0 0 0])
elseif strcmp(cond, 'cue')
       if pars{1,2}==1
           color=[255 0 0];
       elseif pars{1,2}==2
           color=[0 255 0];
       elseif pars{1,2}==3
           color=[0 0 255];
       elseif pars{1,2}==4
           color=[0 0 0];
       else pars{1,2}==5
           color=[255 255 255];
       end
    put_txt(wPtr,pars{1,5}, fontSize,color)
end
end
