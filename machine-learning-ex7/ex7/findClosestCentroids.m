function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

point_count = size(X,1);
centroid_count = K;

for i = 1:point_count
  point = X(i,:);

  % how far is this point from each centroid, and which is closest.

  % assume the first centroid is the closest
  nearest_centroid_id = 1;
  nearest_centroid_distance = norm(centroids(1,:) - point, 2);

  % run through all centroids and see if they're closer
  for t = 1:centroid_count
    centroid = centroids(t,:);
    centroid_id = t;
    this_centroid_distance = norm(centroid - point, 2);
    if this_centroid_distance < nearest_centroid_distance
        nearest_centroid_id = t;
        nearest_centroid_distance = this_centroid_distance;
    endif
  endfor

  idx(i,1) = nearest_centroid_id;
endfor

% =============================================================

end

