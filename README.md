We introduce the simulation experiments we conducted for different bus operation strategies. To ensure comparability among different bus operation strategies and fairness in comparing different bus operation strategies, we set the same passenger arrival rate, number of bus stops, locations of bus stops, bus travel speed, and maximum passenger capacity for buses for all the different bus operation strategies. 
The specific numerical settings of these experimental parameters are shown in Table \ref{tab-parameters}. All these parameter values are generated according to a survey of real-world transportation data.
\begin{table}[!htb]
	\centering
	\caption{Parameters of all eight scenarios held constant.}
	\label{tab-parameters}
	\begin{tabular}{l|c} \hline
		Parameters & Values \\ \hline
		Number of bus stops & 10 \\ 
		Location of bus stops & [1.2, 2.4, 3.6, 4.2, 4.8, 6.0, 7.8, 9.0, 10.2, 12.0] km \\
		Average speed of Bus & 10 m/s (i.e., 22.4 mph) \\ 
		Bus capacity & 30  passengers \\
		Passengers' arrival interval time & $U(a=1, b=3)$ minutes \\ 
		Passengers' destination bus stop & $N(\mu=5, \sigma^2=3)$ \\ \hline
	\end{tabular}
\end{table} \par
In the scenario we consider, there are a total of 10 bus stops. The bus route is a closed loop that connects these 10 stops in sequence. This means that the bus starts from the first station and travels in order through different stations until it reaches the last station. Then it returns from the last station back to the first station. 
To simplify the simulation calculations, we use the travel time of the bus to define the distance between different bus stops. We set the average travel time between the first and last stops to be 20 minutes, passing through eight stations in between. \par
Since the bus route is a closed loop, the time distance between the first and last stations can be interpreted as the time to complete the loop. After some research, we set the average travel speed of the bus at 10 m/s (approximately 22.4 mph), which is a reasonable speed for buses in busy cities or campuses. The maximum passenger capacity of the bus is set at 30, which is also a reasonable assumption.
We use a uniform distribution $U(a=1, b=3)$ to describe the average interval time of passengers arriving at the bus stop. This is a relatively independent variable, depending on the busyness of the city's public transport system. \par
We use a normal distribution probability function $N(\mu=5, \sigma^2=3)$ to define the number of bus stops between passengers' destination stations and their starting stations. This is based on the following considerations. Generally, most passengers prefer to take the bus to places that are least accessible by walking, i.e., stations that are farthest from the starting station. Usually, fewer passengers choose to take the bus to very close destinations (e.g., a destination at one bus stop away) because waiting for a bus also takes time. For very close destinations, the time it takes to walk there is likely to be less than the time spent both waiting for and riding the bus. Therefore, we use a normal distribution probability function to describe the probability of the number of stations between passengers' destination stations and the starting stations.
\subsection{Simulations}
The designed simulation examine eight different scenarios with different directions and numbers of buses. Each scenario runs on five different seeds to ensure identical passenger and destination generation. 
All simulation models created have the aforementioned parameters with a set seed to ensure the same distribution for passenger generation and their destinations. \par
We modeled and simulated a total of eight different bus operation strategies. These eight strategies differ in terms of the number of buses and the direction of bus operation, with specific differences as shown in Table \ref{tab-strategies}. The "CW" represents the clockwise direction of bus operation, and the "CCW" represents the counterclockwise direction of bus operation.
Additionally, to ensure the credibility of simulation results, we ran five independent simulations for each strategy using five different random seeds. Then, we averaged the results of the five simulations to represent the performance of each strategy.
\begin{table}
	\centering
	\caption{Parameters of all tested bus operation strategies.}
	\label{tab-strategies}
	\begin{tabular}{c|c|l} \hline
		Operation strategies & Number of buses & Bus operation directions \\ \hline			
		\# 1 & 1 & CW \\ 
		\# 2 & 1 & CCW \\ 
		\# 3 & 2 & CW, CW \\
		\# 4 & 2 & CW, CCW \\ 
		\# 5 & 2 & CCW, CCW \\ 
		\# 6 & 3 & CW, CW, CW \\ 
		\# 7 & 3 & CW, CCW, CW \\ 
		\# 8 & 3 & CCW, CCW, CCW \\ \hline
	\end{tabular}
\end{table} \par
From Table \ref{tab-strategies} we can see that there are two strategies with one bus, three strategies with two buses, and three strategies with three buses.
All these eight strategies are different from each other so that we can indicate how number of buses and bus operating directions impact the spreading of infectious disease among passengers in public transportation systems. \par
These eight strategies cover all possible scenarios for up to three bus situations. For example, in the strategies with two buses, we considered three situations, namely, both buses are clockwise, both buses are counterclockwise, and one bus is clockwise and the other bus is counterclockwise. Since the strategy of one bus clockwise and one bus counterclockwise is the same as the strategy of one bus counterclockwise and one bus clockwise, we only considered one of them. The same principle applies to the strategies with three buses. That is to say, for all strategies that are functionally the same as each other, we only consider one of them to reduce unnecessary simulation costs.
\subsection{Results}
We compare the 8 bus operation strategies from different aspects including the number of passengers on each single bus, $C$ values for all buses, and $C$ values for all bus stops.
