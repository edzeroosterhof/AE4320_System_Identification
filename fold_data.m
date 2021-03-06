function [X_cv, Y_cv] = fold_data(X, Y, folds)
% FOLD_DATA Splits/folds dataset for cross-validation. It is assumed that
%   data is already shuffled!
%
% Inputs:
% - X: state vector, shape (N, N_states)
% - Y: output vector, shape (N, N_out)
% - folds: number of folds for cross-validation
%
% Outputs:
% - X_cv: folded state vector, shape (N/folds, N_states, folds)
% - Y_cv: folded output vector, shape (N/folds, N_out, folds)
%
% . - 07.06.2018

[N, N_states] = size(X);
N_out = size(Y, 2);

% Possibly some data needs to be deleted to have equal folds
remainder = mod(N, folds);

X = X(1:end - remainder, :);
Y = Y(1:end - remainder, :);

% Reshape data
X_cv = permute(reshape(X', [N_states N / folds folds]), [2 1 3]);
Y_cv = permute(reshape(Y', [N_out N / folds folds]), [2 1 3]);

end