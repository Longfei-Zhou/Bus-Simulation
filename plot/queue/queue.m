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

data = {cw_data,ccw_data,cw_cw_data,cw_ccw_data,ccw_ccw_data,cw_cw_cw_data,cw_ccw_cw_data,ccw_ccw_ccw_data};


%% bus stop plots
t = cw_cw_cw_data{1,2};
cw_stops = [];
ccw_stops = [];
cw_cw_stops = [];
cw_ccw_stops = [];
ccw_ccw_stops = [];
cw_cw_cw_stops = [];
cw_ccw_cw_stops = [];
ccw_ccw_ccw_stops = [];



stops = {cw_stops, ccw_stops, cw_cw_stops, cw_ccw_stops, ccw_ccw_stops, cw_cw_cw_stops, cw_ccw_cw_stops, ccw_ccw_ccw_stops,};
num_models = length(stops);

for i = 1:length(data)
    data{i} = flip(data{i});
end

%%
passengers = cell(num_models,2);
for model = 1:num_models
    

    for stop = 1:9
        stops{model} = [stops{model},data{model}{stop,2}'];

    end
    
    for row = 1:720

        passengers{model} = [passengers{model}, max(stops{model}(row,:))];

    end
    passengers{model} = cumsum(passengers{model});

    passengers{model,2} = "model" + num2str(model);

    plot(t,passengers{model})
    hold on

end
hold off

legend({'cw','ccw','cw cw','cw ccw', 'ccw ccw','cw cw cw','cw ccw cw', 'ccw ccw ccw'}, 'Location', 'northwest')
title(['Waiting line at stops       seed' num2str(seed)])
xlabel('time (s)')
ylabel('cumulative number of passengers waiting at a stop')


saveas(gcf, ['waitingLine' num2str(seed) '.png'])






