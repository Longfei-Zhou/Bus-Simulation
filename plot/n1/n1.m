clc
clear

seed = 10;
num_bus = 1;

cw_data = load(['/Users/jamesliu/Desktop/Research/BusSimulation/data/clockwise/seed' num2str(seed) '/cw_' num2str(seed) '.mat']);
ccw_data = load(['/Users/jamesliu/Desktop/Research/BusSimulation/data/counterclockwise/seed' num2str(seed) '/ccw_' num2str(seed) '.mat']);
cw_data = cw_data.data(:,:);
ccw_data = ccw_data.data(:,:);

%% bus plots
t = cw_data{1,2};
cw_bus = cumsum(cw_data{2,2});
ccw_bus = cumsum(ccw_data{2,2});

bus = {cw_bus, ccw_bus};


for i = 1:length(bus)
    
    onebus = (bus{i}.^2)./(bus{i});
    plot(t,onebus)
    hold on

end

hold off


legend({'cw','ccw'}, 'Location', 'southeast')
title(['n = ' num2str(num_bus) '    seed' num2str(seed)])
xlabel('time (s)')
ylabel('cumulative number of passengers')

saveas(gcf, ['n' num2str(num_bus) '_seed' num2str(seed) '.png'])


