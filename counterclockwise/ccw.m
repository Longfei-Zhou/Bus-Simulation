clc
clear
rng(14)

% Initialize parameters
%1.1000000000000000000000000000000000000


% Time between stops
t_stops = [2 4 7 8 10 13 15 17 20]; % Use real data t = mins

% ith element represents the time
% distance between the ith and ith+1
% stop
num_stops = length(t_stops);



%% 1.20000000000000000000000000000000000000000000000
% figure out distribution later on

passenger_queue = cell(1,num_stops);
% Length = Numbers of passengers going to different stops

% Numbers dictate how many stops from starting point
% [BBDCCBCD] in screenshot

%% 1.300000000000000000000000000000000000000000000
% Initialize Bus position
% To be edited

bus_location = [0]; % Numbers are distance from first stop
num_bus = length(bus_location);


%% 1.400000000000000000000000000000000000000000000
% Initialize Sequence of passengers on busses

bus_passenger = {};
bus_size = 30;

bus_passenger = cell(1,num_bus);


% Each row represents a bus, bus has 10 seats
% Numbers in matrix will be changing in for 1.4

%bus_passenger(1,1:length(passenger_queue_a)) = [passenger_queue_a]
% Same as 1.2



%bus(1,:) == 0

%% 1.5

% Passenger to bus loop

data = cell(num_bus + num_stops + 1, 2);
data{1,1} = "Time";
for bus_graph = 1:num_bus
    data{1+bus_graph,1} = "Bus " + bus_graph;
end

for stop_graph = 1:num_stops
    data{1+bus_graph+stop_graph,1} = "Stop " + stop_graph;
end



% For graphing info, refer to version 12

% Loop
for t = 1:720
    
    
    %Update bus location
    bus_location(1,1) = bus_location(1,1) - 1;
    
    
    % bus_loop_true_false, loops if bus location == sum of t_stops
    bus_loop_true_false = bus_location(1,:) == t_stops(end)+1;
    k = find(bus_loop_true_false);
    % k is arbritrary constant
    bus_location(k) = 0;

    bus_loop_true_false = bus_location(1,:) == -1;
    k = find(bus_loop_true_false);
    bus_location(k) = t_stops(end);

    
    
    
    for stop_passenger_generation = 1:num_stops
        TruFals = randi(3);
        
        if TruFals == 1
            passenger_queue{stop_passenger_generation}(end+1) = rem(round(normrnd(5,3))+ stop_passenger_generation,10);
            
            while passenger_queue{stop_passenger_generation}(end) < 1 
                passenger_queue{stop_passenger_generation}(end) = 1;
            end
            
            while passenger_queue{stop_passenger_generation}(end) > num_stops
                passenger_queue{stop_passenger_geneartion}(end) = num_stops;
            end
            
        end
        
    end
    
%%%%%%%%%%%%%%%%%

    
    
    
    
    % when busses arrive to stops
    for bus = 1:num_bus
        
       %Checks one by one bus is at which stop
       for stop = 1:num_stops
          if bus_location(bus) == t_stops(stop)
              
              fprintf("bus %i arrived at stop %i at time %i \n", bus, stop, t);
              %^ Print string to see if code is working
              
              
              % Passengers leave bus
                for j = stop
                    % Finds passengers that get off at stop (index of passenger)
                    arrived_passengers = find(bus_passenger{bus} == j);
                    if isempty(arrived_passengers) == 0
                        bus_passenger{bus}(arrived_passengers) = []; 
                    end
                end
                
                empty_seats = bus_size - length(bus_passenger{bus});
                % Passengers go on bus
                if empty_seats > length(passenger_queue{stop})
                    bus_passenger{bus} = [bus_passenger{bus},passenger_queue{stop}];
                    passenger_queue{stop} = [];
                else
                    % Only people who are first in queue that can fill bus
                    % will get on
                    bus_passenger{bus} = [bus_passenger{bus},passenger_queue{stop}(1:empty_seats)];
                    passenger_queue{stop}(1:empty_seats) = [];
                    
                    
                end
          end
       end           
    end
    
    data{1,2}(end+1) = t;
    for bus_graph = 1:num_bus
        data{1+bus_graph,2}(end+1) = sum(length(find(bus_passenger{bus_graph})));;
    end

    for stop_graph = 1:num_stops
        data{1+bus_graph+stop_graph,2}(end+1) = sum(length(find(passenger_queue{stop_graph})));
    end    
    
   
    
    

end

%%

%% 1.6 
% Graphing
subplot(1,1,1)
    for graph = 2:1+num_bus
        hold on
        plot(data{1,2},data{graph,2});
        bus_data = trapz(data{1,2},data{graph,2});
        
    end
    hold off
    legend({'bus 1', 'bus 2'},'location','southeast')
    title('Bus passengers')

    

%%
for fig = 1:num_stops
    subplot(5,2,fig)

       plot(data{1,2},data{fig+2,2});
    

end




%% save
file = 'one_bus_ccw';
save('one_bus_ccw')

%% Notes
% 1 and -1 for direction
% 1 bus cw
% 1 bus ccw
% 2 bus both cw
% 2 bus both ccw
% 2 bus one cw one ccw
% 3 bus all ccw

% Separate graphs for stops
% Save data into .fig and .mat