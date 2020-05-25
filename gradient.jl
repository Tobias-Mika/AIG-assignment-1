lin_reg_grad_descent(X, y, α, fit_intercept=true, n_iter=100)

function lin_reg_grad_descent(X, y, α, fit_intercept=true, n_iter=100)
# Initialize some useful values
m = length(y) # number of training examples

if fit_intercept
    # Add a constant of 1s if fit_intercept is specified
    constant = ones(m, 1)
    X = hcat(constant, X)
else
    X # Assume user added constants
end

# Use the number of features to initialise the theta θ vector
n = size(X)[2]
θ = zeros(n)

# Initialise the cost vector based on the number of iterations
𝐉 = zeros(n_iter)

for iter in range(1, stop=n_iter)
    pred = X * θ

    # Calcaluate the cost for each iter
    𝐉[iter] = mean_squared_cost(X, y, θ)

    # Update the theta θ at each iter
    θ = θ - ((α/m) * X') * (pred - y);
end
return (θ, 𝐉)
end
