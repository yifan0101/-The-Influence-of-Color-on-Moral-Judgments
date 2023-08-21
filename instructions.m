function instructions(wPtr, MODE, fontSize)
    if MODE == 0
        put_txt(wPtr, double('同学，你好！欢迎参加本试验！\n\n 实验开始后，你将会看到一个“+”请注视“+”\n\n随后你将看到一个词语，请尽快判断词语类别。\n\n若为道德词语请按F键，若为不道德词语请按J键\n\n请既快又准确地判断\n\n没有疑问按空格键开始正式试验'), fontSize,[0 0 0]);
    elseif MODE == 1
        put_txt(wPtr, double('同学，你好！欢迎参加本试验！\n\n 实验开始后，你将会看到一个“+”请注视“+”\n\n随后你将看到一个词语，请尽快判断词语类别。\n\n若为道德词语请按F键，若为不道德词语请按J键\n\n请既快又准确地判断\n\n没有疑问按空格键开始练习\n\n正确率超过80%将进入正式试验'), fontSize,[0 0 0]);
    elseif MODE == 2
        put_txt(wPtr, double('请休息1分钟\n\n继续试验请按空格键'),fontSize,[0 0 0]);
    end
    wait4key(999999, {'Space'}, true, true);
    display_clear(wPtr, 100);
end
