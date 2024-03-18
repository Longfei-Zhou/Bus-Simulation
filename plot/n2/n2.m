clc
clear

seed = 14;
num_bus = 2;

cw_cw_data = load(['/Users/jamesliu/Desktop/Research/BusSimulation/data/clockwise_clockwise/seed' num2str(seed) '/cw_cw_' num2str(seed) '.mat']);
cw_ccw_data = load(['/Users/jamesliu/Desktop/Research/BusSimulation/data/clockwise_counterclockwise/seed' num2str(seed) '/cw_ccw_' num2str(seed) '.mat']);
ccw_ccw_data = load(['/Users/jamesliu/Desktop/Research/BusSimulation/data/counterclockwise_counterclockwise/seed' num2str(seed) '/ccw_ccw_' num2str(seed) '.mat']);
cw_cw_data = cw_cw_data.data(:,:);
cw_ccw_data = cw_ccw_data.data(:,:);
ccw_ccw_data = ccw_ccw_data.data(:,:);

%% bus plots
t = cw_cw_data{1,2};
cw_cw_bus1 = cumsum(cw_cw_data{2,2});
cw_cw_bus2 = cumsum(cw_cw_data{3,2});
cw_ccw_bus1 = cumsum(cw_ccw_data{2,2});
cw_ccw_bus2 = cumsum(cw_ccw_data{3,2});
ccw_ccw_bus1 = cumsum(ccw_ccw_data{2,2});
ccw_ccw_bus2 = cumsum(ccw_ccw_data{3,2});

bus = {cw_cw_bus1 cw_cw_bus2;
       cw_ccw_bus1 cw_ccw_bus2;
       ccw_ccw_bus1 ccw_ccw_bus2};
[L,W] = size(bus);

for j = 1:3

    twobus = (bus{j}.^2+bus{j+L}.^2)./(bus{j}+bus{j+L});
    plot(t,twobus)
    hold on


end

hold off


legend({'cw cw','cw ccw', 'ccw ccw'}, 'Location', 'southeast')
title(['n = ' num2str(num_bus) '    seed' num2str(seed)])
xlabel('time (s)')
ylabel('cumulative number of passengers')

saveas(gcf, ['n' num2str(num_bus) '_seed' num2str(seed) '.png'])