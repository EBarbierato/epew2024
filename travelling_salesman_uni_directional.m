function binNames = extractTour(sol, bins)
    % Convert the solution matrix to a binary format
    tspVars = round(sol);

    % Initialize variables
    numBins = size(tspVars, 1);
    tourIndices = zeros(1, numBins);  % This will store the indices of the bins

    % Start the tour at the first bin
    currentBin = 1;
    tourIndices(1) = currentBin;

    % Follow the tour based on the solution matrix
    for i = 2:numBins
        % Find the next bin in the tour
        nextBin = find(tspVars(currentBin, :), 1);
        if isempty(nextBin)
            error('No valid next bin found. Check the solution for errors.');
        end
        tourIndices(i) = nextBin;
        % Prevent revisiting the current bin
        tspVars(currentBin, :) = 0;  % Prevent leaving from here again
        tspVars(:, nextBin) = 0;  % Prevent entering here again
        currentBin = nextBin;  % Move to the next bin
    end

    % Convert numeric indices back to bin names
    binNames = bins(tourIndices);
end

% Specify the file path
file_path = 'E:\Dropbox\Personale\PC\Library\Università\Computer Science\Computer Science Articles\2024-EPEW\tsp_data.csv';

% Read the data
data = readtable(file_path, 'Delimiter', '\t', 'ReadVariableNames', false);
data.Properties.VariableNames = {'From', 'To', 'Distance'};

% Extract unique bins
bins = unique([data.From; data.To]);

% Number of bins
numBins = numel(bins);

% Create a distance matrix
distMatrix = 1e6 * ones(numBins); % Initialize with a large number (instead of infinity)

% Fill the distance matrix with the given distances
for i = 1:height(data)
    fromIndex = find(strcmp(bins, data.From{i}));
    toIndex = find(strcmp(bins, data.To{i}));
    distMatrix(fromIndex, toIndex) = data.Distance(i);
end

% TSP optimization variables and constraints setup
% When optimvar is used with the tspVars parameter, it is typically in the context of 
% creating optimization variables for solving a Traveling Salesman Problem (TSP) 
% using the MATLAB Optimization Toolbox. 
% The tspVars parameter is part of the optimproblem function used to specify TSP-specific variables.
tspVars = optimvar('tspVars', numBins, numBins, 'Type', 'integer', 'LowerBound', 0, 'UpperBound', 1);

% Each bin is visited exactly once
cons1 = sum(tspVars, 2) == 1;
cons2 = sum(tspVars, 1).' == 1;

% To avoid subtours (i.e., cycles that don't include all bins)
u = optimvar('u', numBins, 'LowerBound', 1, 'UpperBound', numBins, 'Type', 'integer');
subtourcons = optimconstr(numBins, numBins);
for i = 2:numBins
    for j = 2:numBins
        if i ~= j
            subtourcons(i, j) = u(i) - u(j) + numBins * tspVars(i, j) <= numBins - 1;
        end
    end
end

% Objective function: Minimize the total travel distance
obj = sum(sum(distMatrix .* tspVars, 'all'));

% Problem definition
tspProblem = optimproblem('Objective', obj);
tspProblem.Constraints.cons1 = cons1;
tspProblem.Constraints.cons2 = cons2;
tspProblem.Constraints.subtour = subtourcons;

% Solve the problem
opts = optimoptions('intlinprog', 'Display', 'final');
[sol, fval, exitflag, output] = solve(tspProblem, 'Options', opts);

% Display the solution
disp(['Minimum distance: ' num2str(fval)]);
% Assuming the solution is obtained and valid
binNames = extractTour(sol.tspVars, bins);

% Display the optimal tour
disp(['Optimal tour: ' strjoin(binNames, ' -> ')]);

