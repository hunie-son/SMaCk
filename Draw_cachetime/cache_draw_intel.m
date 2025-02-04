%%
%  SMaCk cache time draw dynamically
%  
%  authors: 
%  Seonghun Son <seonghun@iastate.edu>
%  Daniel Moghimi <danielmm@googl.com>
%  Berk Gulmezoglu <bgulmez@iastate.edu>
%  
%  Description:
%  Cache time anaylsis draw result dynamically
% 
%%
clc;
clear all;

% Mircoachitecutre name :
% cascadelake, tigerlake, cometlake, icelake, westmereep, sandybridge,
% broadwell, ivybrigde.

filename = 'cache_time_cascadelake.csv';  
data = csvread(filename);

% microarchitecture name from filename
tokens = regexp(filename, 'cache_time_(\w+).csv', 'tokens');
microarchitecture = tokens{1}{1};

% dynamically setting the num_attack (Table 2)
switch microarchitecture
    case {'cascadelake', 'tigerlake'}
        num_attack = 9;
    case {'cometlake', 'icelake', 'westmereep', 'sandybridge'}
        num_attack = 8;
    case {'broadwell', 'ivybrigde'}
        num_attack = 7;
    otherwise
        error('Unknown microarchitecture');
end

point = 4 * num_attack;
if length(data(1, :)) == 1
    data = reshape(data, 100000, point);
else
    data = data';
end

f = figure;
%f.Position = [100 100 500 1200];
f.Position = [100 100 1200 500];

b = 20;
clrs = ['k', 'g', 'b', 'r'];

% Define titles dynamically
if num_attack == 9
    titles = {'Load', 'Flush', 'Flush OPT', 'Store', 'Lock', 'Prefetch', 'Prefetch NTA', 'Execute', 'Cache Line Writeback'};
    max_xaxis = 500;
elseif num_attack == 8
    titles = {'Load', 'Flush', 'Flush OPT', 'Store', 'Lock', 'Prefetch', 'Prefetch NTA', 'Execute'};
    if strcmp(microarchitecture,'icelake')
        max_xaxis = 300;
    else
        max_xaxis = 500;
    end
    
elseif num_attack == 7
    titles = {'Load', 'Flush', 'Store', 'Lock', 'Prefetch', 'Prefetch NTA', 'Execute'};
    max_xaxis = 700;
end

%%
%FOR THE PROPOSAL PURPROSE 

% Find the index of "Store"
store_idx = find(strcmp(titles, 'Store'));

% Plot only the "Store" part
hx = subplot(1,1,1); % Only one subplot
col_start = 1 + 4 * (store_idx - 1);
col_end = col_start + 3;

for i = col_start:col_end
    r = data(:,i);
    m = median(r);
    x = r(r < (m + 50) & (r > m - 50));
    h = histfit(x, b, 'normal');
    set(h(1), 'facecolor', clrs(mod(i-1,4)+1), 'FaceAlpha', 0.5);
    set(h(2), 'color', clrs(mod(i-1,4)+1));
    hold on;
end

xlim([0, max_xaxis]);
ylabel('Histogram');
title('Store');

xlabel('CPU Cycles');
lgd = legend('L1D', '', 'L1I', '', 'LLC', '', 'DRAM', '');
lgd.Position = [0.85, 0.22, 0.02, 0.05];

set(findall(gcf, '-property', 'FontSize'), 'FontSize', 15);
lgd.FontSize = 10;

% Save figure
%exportgraphics(f, sprintf('Proposal/Figures/cacheops_intel_%s_store.png', microarchitecture), 'Resolution', 300);
%%
labels = repmat({'Histogram'}, num_attack, 1);


% Create dynamically
for attack_idx = 1:num_attack
    hx = subplot(num_attack,1,attack_idx);
    col_start = 1 + 4 * (attack_idx - 1);
    col_end = col_start + 3;

    for i = col_start:col_end
        r = data(:,i);
        m = median(r);
        x = r(r < (m + 50) & (r > m - 50));
        h = histfit(x, b, 'normal');
        set(h(1), 'facecolor', clrs(mod(i-1,4)+1), 'FaceAlpha', 0.5);
        set(h(2), 'color', clrs(mod(i-1,4)+1));
        hold on;
    end
    xlim([0, max_xaxis]);
    ylabel(labels{attack_idx});
    title(titles{attack_idx});
end

xlabel('CPU Cycles');
lgd = legend('L1D', '', 'L1I', '', 'LLC', '', 'DRAM', '');
lgd.Position = [0.85, 0.14, 0.02, 0.05];
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 10);
lgd.FontSize = 8;

% Save figure
%exportgraphics(f, sprintf('Results/Figures/cacheops_intel_%s.png', microarchitecture), 'Resolution', 300);