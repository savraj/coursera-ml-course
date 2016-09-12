function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta



hy = sigmoid(X * theta);

J = (1/m) * sum(-y .* log(hy) - (1-y) .* log(1-hy)) + (lambda / (2*m)) * sum([0;theta(2:end)].^2);

grad_sum = 0;
for t=1:m
    grad_sum = grad_sum + (hy(t)-y(t)) * X(t,:)';
endfor

grad = (1/m) * grad_sum + (lambda / m) * [0;theta(2:end)];

% gradient = 0;
%
% for i=1:m
%     gradient = gradient + (hypot(i) - y(i))*X';
% endfor
%
% gradient = gradient + (lambda/m) * [0;theta(2:end)];
%
% grad = gradient';

% =============================================================

end
