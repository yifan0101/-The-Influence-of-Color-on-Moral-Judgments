function datafile=init_data_file(folder, subjInfo)
    if ~exist(folder,'dir')
        mkdir(folder)
    end
    filename=[subjInfo '_' date ];
    datafile=fopen([folder '/' filename '.txt'],'a+');
    fprintf(datafile,'Trial direction cond gotkey RT response\n');
end
