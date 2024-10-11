% VERSION 2: The arcs are bi-directional
% Load and create the undirected graph
filePath = 'E:\Dropbox\Personale\PC\Library\Università\Computer Science\Computer Science Articles\2024-EPEW\tsp_data.csv';
opts = detectImportOptions(filePath, 'Delimiter', '\t');
opts.VariableNames = {'From', 'To', 'Distance'};
data = readtable(filePath, opts);
G = graph(data.From, data.To, data.Distance);  % Using 'graph' instead of 'digraph'

% Number of nodes
n = numnodes(G);

% Create the distance matrix for the undirected graph
distMatrix = inf(n);
for i = 1:height(G.Edges)
    idx1 = findnode(G, G.Edges.EndNodes{i,1});
    idx2 = findnode(G, G.Edges.EndNodes{i,2});
    distMatrix(idx1, idx2) = G.Edges.Weight(i);
    distMatrix(idx2, idx1) = G.Edges.Weight(i);  % Ensure the distance is symmetric
end

% Replace Inf with a large number to handle disconnected graph parts
distMatrix(isinf(distMatrix)) = 1e6;  % Assign a high cost to missing paths

% Find the shortest path from node 'a' to node '4'
startNode = 'C';
endNode = '6';
[shortestPath, pathLength] = shortestpath(G, startNode, endNode);

% Display the shortest path and path length
disp(['(arcs are bidirectional) Shortest path from ', startNode, ' to ', endNode, ':']);
disp(shortestPath);
disp(['Total path length: ', num2str(pathLength)]);

% Visualization of the graph
figure;
p = plot(G, 'Layout', 'force', 'EdgeLabel', G.Edges.Weight);
title('Undirected Graph with Shortest Path Highlighted');
xlabel('Node');
ylabel('Node');
axis equal;

% Highlight the shortest path in the graph
highlight(p, shortestPath, 'EdgeColor', 'r', 'LineWidth', 1.5);
highlight(p, shortestPath, 'NodeColor', 'g', 'MarkerSize', 6);
