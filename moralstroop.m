% Experiment Title: The Influence of Color on Moral Judgments( Inspired by the Stroop Task )
% Experiment Date: March 14, 2022
% Experiment Author: Yifan Meng

%% Preliminary
clear;clc
rng('default')
rng shuffle
%rand('twister',sum(100*clock));  %rand的帮助文档中给出了一个示例方案rand('twister',sum(100*clock))，可以使每次运行得到的伪随机序列都不一样
Base_dir=pwd;
Data_dir=[Base_dir '/Data'];
[ID age Cond]=getSubjInfo; %% get subj info
datafile=init_data_file(Data_dir, ID);  %% initialize the data files
%% para for cal visual angel
pw=1920;  %screen size
ph=1080;
viewDist=60;
ScrWidth=48;
ScrHeight=27;
%now calculate how many pixels correspond to 1 deg visual angle
widthDeg = round(2*180*atan(ScrWidth/(2*viewDist))/pi); % visual angle deg of the ScrWidth
deg2pix  = round(pw/widthDeg);
fontSize = 1.5*deg2pix; 
%% design
Design=readtable('Design1.csv');
%Design=Design3;
Design=table2cell(Design);
rowNum=size(Design,1);
Design=Design(randperm(size(Design,1))',:);
Design_prac=Design(randperm(size(Design,1),5)',:);
%% initiate an on screen window
Screen('Preference', 'SkipSyncTests', 1);
Screen('Preference', 'TextEncodingLocale', 'UTF8') ;
[wpnt,winRect]=Screen('OpenWindow',0); 
Screen('TextFont', wpnt, 'simhei'); 
%ifi=Screen('GetFlipInterval',wpnt);%get Screen flip interval
HideCursor;
white=100;%background grayscale level can be changed to match the stimuli images
display_clear(wpnt, white)
%% prac
right_num=0;
while right_num <4
right_num=0;
instructions(wpnt, 1, fontSize)
for Trial=1:5%size(Design,1)
    pars=Design_prac(Trial,:);
     WaitSecs(0.5);
     drawSti(wpnt, 'fix', pars, fontSize);
    wait4key(0.5, [], false, true);
    display_clear(wpnt, white);
	drawSti(wpnt, 'cue', pars, fontSize);
    [gotKey, rt, key, key_num] = wait4key(2, {'f', 'j'}, true, true);
    right=(Design_prac{Trial,3}==2 &&key_num==74)||(Design_prac{Trial,3}==1&&key_num==70);
    right_num=right+right_num;
     Screen('FillRect', wpnt,white);
    Screen('Flip',wpnt);
    WaitSecs(0.5);
end
end
%% experiment
instructions(wpnt, 0, fontSize)
for Trial=1:200
    pars=Design(Trial,:);
    WaitSecs(0.5);
    display_clear(wpnt, white);
     drawSti(wpnt, 'fix', pars, fontSize);
    wait4key(0.5, [], false, true);
     %WaitSecs(0.5);
    display_clear(wpnt, white);
	drawSti(wpnt, 'cue', pars, fontSize);
    [gotKey, rt, key, key_num] = wait4key(2, {'f', 'j'}, true, true);
    Design(Trial,6:9)={gotKey, rt, key_num, key};
    truean=(Design{Trial,3}==2 &&key_num==74)||(Design{Trial,3}==1&&key_num==70);%判断按键是否正确
     Design(Trial,10)={truean};
     Screen('FillRect', wpnt,white);
    Screen('Flip',wpnt);
     WaitSecs(0.5);
     if Trial==100
         instructions(wpnt,2,fontSize)
     end
end
%% end exp
put_txt(wpnt, double('谢谢参加'), fontSize,[192 192 192]);
wait4key(5, {'Space'}, true, false);
save([Data_dir '/' ID],'Design');
fclose(datafile);%close the data file
Screen('CloseAll'); 
