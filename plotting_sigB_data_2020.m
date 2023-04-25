function plotting_sigB_data_2020(varargin)

date_in='2022-03-23';
in_path_main='\\slcu.cam.ac.uk\data\Microscopy\TeamJL\Chris\movies\SigB\sigB_MPA';
D=dir([in_path_main,'\20*']);

what_plot=nan;
%checking input
if ~isempty(varargin)
    for i = 1:2:length(varargin)
        theparam = lower(varargin{i});
        switch(strtok(theparam))
            case 'what'
                what_plot=varargin{i+1};
        end
    end
end
if isnan(what_plot);
    what_plot='MY';
end


for i=1:length(D);
    in_path=[in_path_main,'\',D(i).name,'\subAuto\'];
     p = initschnitz('Bacillus-01',date_in,'bacillus','rootDir',in_path,'imageDir',in_path);
     p.dataDir=[p.rootDir,'Data\'];
     if exist(p.dataDir)
         plotting_MM_data_2021_11_01_v3(p,what_plot);
         saveas(gcf,['2020_data\',D(i).name,'-',what_plot,'.png']);
     end
end