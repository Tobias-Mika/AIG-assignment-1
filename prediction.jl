
function predict(X, θ, fit_intercept=true)
    m = size(X)[1]

    if fit_intercept
        constant = ones(m)
        X = hcat(constant, X)
    else
        X
    end

    predictions = X * θ

    return predictions
end


# Make predictions for both training and testing datasets
train_preds = predict(X_train_scaled, θ)
test_preds = predict(X_test_scaled, θ)



function rmse_score(y_true, y_pred)

    errors = y_pred - y_true
    errors² = errors .^ 2
    mse = mean(errors²)
    rmse = sqrt(mse)

    return rmse

end


println("RMSE for Training Set: ", rmse_score(y_train, train_preds))
println("RMSE for Testing Set: ", rmse_score(y_test, test_preds))
