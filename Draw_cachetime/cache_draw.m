%%
%  SMaCk cache time draw dynamically
%  
%  authors: 
%  Seonghun Son <seonghun@iastate.edu>
%  Daniel Moghimi <danielmm@googl.com>
%  Berk Gulmezoglu <bgulmez@iastate.edu>
%  
%  Description:
%  SMaCk Cache time anaylsis draw result dynamically plus Mastik toolkit baseline 
% 
%%
clc;
clear all;

% Example filename, update this accordingly
%filename = 'cache_time_mastik_cascadelake.csv';  
%filename = 'cache_time_mastik_broadwell.csv';  
%filename = 'cache_time_mastik_AMDRyzen.csv';  
%%
%NEW version
filename1 = 'New/cache_time_smack_cascadelake_all.csv';  
filename2 = 'New/cache_time_mastik_cascadelake_all.csv';  


tokens = regexp(filename1, 'cache_time_(\w+)_(\w+)_all.csv', 'tokens');

if isempty(tokens)
    error('Filename format incorrect. Expected format: cache_time_microarchitecture_title.csv');
else
    microarchitecture = tokens{1}{1};  % Third part (e.g., mastik, etc.)
    title_str = tokens{1}{2};  % Fourth part (e.g., broadwell, amdryzen, etc.)
end
%%
data1 = csvread(filename1);
data2 = csvread(filename2);

% Remove the 8th segment (from 3,500,000 to 4,000,000) in data1 -> This
% removes execute attack

data1_modified = [data1(1:3500000); data1(4000001:end)];

data = [data1_modified; data2]; 
%%

if strcmp(microarchitecture, 'mastik')
    num_attack = 1; % Only one timing 
else
    % cases for different microarchitectures
    switch title_str
        case {'cascadelake', 'tigerlake', 'AMDRyzen'}
            num_attack = 9;
        case {'cometlake', 'icelake', 'westmereep', 'sandybridge'}
            num_attack = 8;
        case {'broadwell', 'ivybridge'}
            num_attack = 7;
        otherwise
            error('Unknown microarchitecture or title');
    end
end

%%

if size(data, 2) == 1
    %data = reshape(data, [], num_attack * 4);  % Assuming 4 cache levels
    data = reshape(data, [], num_attack * 5);  % 5 cache levels
end


if strcmp(microarchitecture, 'mastik')
    titles = {title_str};  
    labels = {'Histogram'};
    max_xaxis = 400;  % Adjust as needed 
    num_attack = 1;
    
    if size(data, 1) > size(data, 2)
        % Data is in the correct orientation
    else
        data = data';
    end
else
    if num_attack == 9
        titles = {'Load', 'Flush', 'Flush OPT', 'Store', 'Lock+Inc', 'Prefetch', 'Prefetch NTA', 'Cache Line Writeback', 'Mastik'};
        max_xaxis = 500;
    elseif num_attack == 8
        titles = {'Load', 'Flush', 'Flush OPT', 'Store', 'Lock+Inc', 'Prefetch', 'Prefetch NTA', 'Execute'};
        if strcmp(title_str, 'icelake')
            max_xaxis = 300;
        else
            max_xaxis = 500;
        end
    elseif num_attack == 7
        titles = {'Load', 'Flush', 'Store', 'Lock+Inc', 'Prefetch', 'Prefetch NTA', 'Execute'};
        max_xaxis = 700;
    end
    labels = repmat({'Histogram'}, num_attack, 1);
end

b = 20; % Number of bins 

%clrs = ['k', 'g', 'b', 'r']; 
clrs = ['y', 'g', 'k', 'b', 'r'];

% Now, plot the data
f = figure;
%f.Position = [100 100 500 1200];
%f.Position = [100 100 1200 500];

if num_attack == 1
    f.Position = [100 100 1200 300];
    % For the 'mastik' case, plot the single timing function
    hx = subplot(1,1,1);
    col_start = 1;
    %col_end = col_start + 3;  % Assuming 4 cache preparations (L1, L1i, LLC, DRAM)
    col_end = col_start + 4;  % Assuming 5 cache preparations (L1, L1i, LLC, DRAM)
    
    for i = col_start:col_end
        r = data(:,i);
        m = median(r);
        x = r(r < (m + 50) & (r > m - 50)); 
        
        num_x = numel(x);
        fprintf('Number of data points in x: %d\n', num_x);
        
        if num_x < 10
            warning('Not enough data points in x to fit a distribution. Skipping this dataset.');
            continue; 
        end
        
        h = histfit(x, b, 'normal'); 
        %set(h(1), 'facecolor', clrs(mod(i-1,4)+1), 'FaceAlpha', 0.5);
        %set(h(2), 'color', clrs(mod(i-1,4)+1));
        set(h(1), 'facecolor', clrs(mod(i-1,5)+1), 'FaceAlpha', 0.5);
        set(h(2), 'color', clrs(mod(i-1,5)+1));
        
        hold on;
    end
    xlim([0, max_xaxis]);
    ylabel('Frequency');
    %title('L1i Mastik', 'FontSize', 16); 
    
    xlabel('CPU Cycles');
    %lgd = legend('L2', '', 'L1i', '', 'LLC', '', 'DRAM', '');
    lgd = legend('L1d', '','L1i', '', 'L2', '', 'LLC', '', 'DRAM', '');
    
    %lgd.Position = [0.85, 0.22, 0.02, 0.05];
    lgd.Position = [0.86, 0.35, 0.02, 0.05];
    
    
    set(findall(gcf, '-property', 'FontSize'), 'FontSize', 15);
    lgd.FontSize = 10;
    
    exportgraphics(f, sprintf('New/cache_time_%s_%s_all.png', microarchitecture, title_str), 'Resolution', 800);
else
    f.Position = [100 100 500 1200];
    for attack_idx = 1:num_attack
        hx = subplot(num_attack, 1, attack_idx);
        %col_start = 1 + 4 * (attack_idx - 1);
        %col_end = col_start + 3;

        col_start = 1 + 5 * (attack_idx - 1);
        col_end = col_start + 4;

        for i = col_start:col_end
            r = data(:,i);
            m = median(r);
            x = r(r < (m + 50) & (r > m - 50));
            
            num_x = numel(x);
            fprintf('Number of data points in x: %d\n', num_x);
            
            %if num_x < 10
            %    warning('Not enough data points in x to fit a distribution. Skipping this dataset.');
            %    continue; % Skip this iteration
            %end
            
            h = histfit(x, b, 'normal');
            %set(h(1), 'facecolor', clrs(mod(i-1,4)+1), 'FaceAlpha', 0.5);
            %set(h(2), 'color', clrs(mod(i-1,4)+1));
            set(h(1), 'facecolor', clrs(mod(i-1,5)+1), 'FaceAlpha', 0.5);
            set(h(2), 'color', clrs(mod(i-1,5)+1));
            
            hold on;
        end
        
        % If this is the last subplot, add a horizontal line
        %if attack_idx == num_attack
        %    yline(max(ylim) * 0.95, '--', 'Color', 'k', 'LineWidth', 1.5, 'Label', 'Separator');  % Adjust position as needed
        %end
        xlim([0, max_xaxis]);
        ylabel(labels{attack_idx});
        title(titles{attack_idx});
        
    end

    
    %annotation(f, 'line', [0.1 0.8], [0.187 0.187], 'LineStyle', '-', 'Color', 'r', 'LineWidth', 1.5);
    
    xlabel('CPU Cycles');
    %lgd = legend('L2', '', 'L1i', '', 'LLC', '', 'DRAM', '');
    lgd = legend('L1d', '', 'L1i', '', 'L2', '','LLC', '', 'DRAM', '');
    
    lgd.Position = [0.85, 0.155, 0.02, 0.05];
    set(findall(gcf, '-property', 'FontSize'), 'FontSize', 10);
    lgd.FontSize = 8;
    
    exportgraphics(f, sprintf('New/cache_time_%s_mastik_%s_all.png', microarchitecture, title_str), 'Resolution', 800);
end
