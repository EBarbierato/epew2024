% VERSION 2: The arcs are bi-directional
% Load and create the undirected graph

clear;

% Define file path and options
filePath = 'tsp_data.csv';
opts = detectImportOptions(filePath, 'Delimiter', '\t');
opts.VariableNames = {'From', 'To', 'Distance'};
data = readtable(filePath, opts);

% Create an undirected graph
G = graph(data.From, data.To, data.Distance);

% Define nodes, including those to be excluded later
nodes = {'W','1','a','2','3','b','4','5','6','c','7','8','9','A','d','e','B','C','f','D','E','F'};

% Initialize a matrix to store the shortest paths
num_nodes = length(nodes);
shortest_paths_matrix = inf(num_nodes, num_nodes);


% Calculate the shortest path for each pair of nodes
for i = 1:num_nodes
    for j = 1:num_nodes
        if (nodes{j} >= 'a' && nodes{j} <= 'z') || (i==j)
            shortest_paths_matrix(i, j) = 0;
        else
            % Calculate the shortest path
            [shortestPath, pathLength] = shortestpath(G, nodes{i}, nodes{j});
            shortest_paths_matrix(i, j) = pathLength;
        end
    end
end

% Convert the matrix to a table for better visualization
shortest_paths_table = array2table(shortest_paths_matrix, 'VariableNames', nodes, 'RowNames', nodes);

% Remove columns and rows whose labels are lowercase letters1
is_lowercase = @(label) ischar(label) && all(label >= 'a') && all(label <= 'z');
lowercase_labels = cellfun(is_lowercase, nodes);

% Remove the rows and columns with lowercase labels
shortest_paths_table(:, lowercase_labels) = [];
%shortest_paths_table(lowercase_labels, :) = [];

% Display the table
disp('Shortest paths matrix:');
disp(shortest_paths_table);

% Save the table to a CSV file 
writetable(shortest_paths_table, 'shortest_paths_matrix.csv', 'WriteRowNames', true);

% Calculate also the time
shortest_times_table = array2table(shortest_paths_matrix/60, 'VariableNames', nodes, 'RowNames', nodes);
% Remove the rows and columns with lowercase labels
shortest_times_table(:, lowercase_labels) = [];
%shortest_times_table(lowercase_labels, :) = [];

% Display the table
disp('Shortest time matrix:');
disp(shortest_times_table);

% Save the table to a CSV file 
writetable(shortest_times_table, 'shortest_times_matrix.csv', 'WriteRowNames', true);