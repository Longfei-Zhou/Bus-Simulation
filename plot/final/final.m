clc
clear

seed = 14;
num_bus = 'final';

%n=1
cw_data = load(['/Users/jamesliu/Desktop/Research/BusSimulation/data/clockwise/seed' num2str(seed) '/cw_' num2str(seed) '.mat']);
ccw_data = load(['/Users/jamesliu/Desktop/Research/BusSimulation/data/counterclockwise/seed' num2str(seed) '/ccw_' num2str(seed) '.mat']);
cw_data = cw_data.data(:,:);
ccw_data = ccw_data.data(:,:);

%n=2
cw_cw_data = load(['/Users/jamesliu/Desktop/Research/BusSimulation/data/clockwise_clockwise/seed' num2str(seed) '/cw_cw_' num2str(seed) '.mat']);
cw_ccw_data = load(['/Users/jamesliu/Desktop/Research/BusSimulation/data/clockwise_counterclockwise/seed' num2str(seed) '/cw_ccw_' num2str(seed) '.mat']);
ccw_ccw_data = load(['/Users/jamesliu/Desktop/Research/BusSimulation/data/counterclockwise_counterclockwise/seed' num2str(seed) '/ccw_ccw_' num2str(seed) '.mat']);
cw_cw_data = cw_cw_data.data(:,:);
cw_ccw_data = cw_ccw_data.data(:,:);
ccw_ccw_data = ccw_ccw_data.data(:,:);

%n=3
cw_cw_cw_data = load(['/Users/jamesliu/Desktop/Research/BusSimulation/data/clockwise_clockwise_clockwise/seed' num2str(seed) '/cw_cw_cw_' num2str(seed) '.mat']);
cw_ccw_cw_data = load(['/Users/jamesliu/Desktop/Research/BusSimulation/data/clockwise_counterclockwise_clockwise/seed' num2str(seed) '/cw_ccw_cw_' num2str(seed) '.mat']);
ccw_ccw_ccw_data = load(['/Users/jamesliu/Desktop/Research/BusSimulation/data/counterclockwise_counterclockwise_counterclockwise/seed' num2str(seed) '/ccw_ccw_ccw_' num2str(seed) '.mat']);
cw_cw_cw_data = cw_cw_cw_data.data(:,:);
cw_ccw_cw_data = cw_ccw_cw_data.data(:,:);
ccw_ccw_ccw_data = ccw_ccw_ccw_data.data(:,:);


%% bus plots
t = cw_cw_cw_data{1,2};

cw_bus = cumsum(cw_data{2,2});
ccw_bus = cumsum(ccw_data{2,2});

cw_cw_bus1 = cumsum(cw_cw_data{2,2});
cw_cw_bus2 = cumsum(cw_cw_data{3,2});
cw_ccw_bus1 = cumsum(cw_ccw_data{2,2});
cw_ccw_bus2 = cumsum(cw_ccw_data{3,2});
ccw_ccw_bus1 = cumsum(ccw_ccw_data{2,2});
ccw_ccw_bus2 = cumsum(ccw_ccw_data{3,2});
cw_cw_cw_bus = cumsum(cw_cw_cw_data{2,2});
cw_ccw_cw_bus = cumsum(cw_ccw_cw_data{2,2});
ccw_ccw_ccw_bus = cumsum(ccw_ccw_ccw_data{2,2});


cw_cw_cw_bus1 = cumsum(cw_cw_cw_data{2,2});
cw_cw_cw_bus2 = cumsum(cw_cw_cw_data{3,2});
cw_cw_cw_bus3 = cumsum(cw_cw_cw_data{4,2});

cw_ccw_cw_bus1 = cumsum(cw_ccw_cw_data{2,2});
cw_ccw_cw_bus2 = cumsum(cw_ccw_cw_data{3,2});
cw_ccw_cw_bus3 = cumsum(cw_ccw_cw_data{4,2});

ccw_ccw_ccw_bus1 = cumsum(ccw_ccw_ccw_data{2,2});
ccw_ccw_ccw_bus2 = cumsum(ccw_ccw_ccw_data{3,2});
ccw_ccw_ccw_bus3 = cumsum(ccw_ccw_ccw_data{4,2});

n1bus = {cw_bus, ccw_bus};
n2bus = {cw_cw_bus1 cw_cw_bus2;
       cw_ccw_bus1 cw_ccw_bus2;
       ccw_ccw_bus1 ccw_ccw_bus2};
[L2,W2] = size(n2bus);

n3bus = {cw_cw_cw_bus1 cw_cw_cw_bus2 cw_cw_cw_bus3;  
       cw_ccw_cw_bus1 cw_ccw_cw_bus2 cw_ccw_cw_bus3;  
       ccw_ccw_ccw_bus1 ccw_ccw_ccw_bus2 ccw_ccw_ccw_bus3};
[L3,W3] = size(n3bus);


for i = 1:length(n1bus)
    
    onebus = (n1bus{i}.^2)./(n1bus{i});
    plot(t,onebus)
    hold on

end

for j = 1:L2

    twobus = (n2bus{j}.^2+n2bus{j+L2}.^2)./(n2bus{j}+n2bus{j+L2});
    plot(t,twobus)
    hold on

end

for k = 1:L3

    threebus = (n3bus{k}.^2+n3bus{k+L3}.^2+n3bus{k+2*L3}.^2)./(n3bus{k}+n3bus{k+L3}+n3bus{k+2*L3});
    plot(t,threebus)
    hold on


end


legend({'cw','ccw','cw cw','cw ccw', 'ccw ccw','cw cw cw','cw ccw cw', 'ccw ccw ccw'}, 'Location', 'southeast')
title(['final       seed' num2str(seed)])
xlabel('time (s)')
ylabel('cumulative number of passengers')



saveas(gcf, ['final_seed' num2str(seed) '.png'])


