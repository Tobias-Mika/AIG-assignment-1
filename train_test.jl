# Split into design matrix and target vector
X = df[:, 1:21]
design_matrix = convert(Matrix, X)

y = df[:, 10]  # Target vector

# Split into training and test
train_size = 0.80
data_size = size(design_matrix)[1]

train_index = trunc(Int, train_size * data_size)

# Split using the desired train size
X_train = design_matrix[1:train_index, :]
X_test = design_matrix[train_index+1:end, :]

y_train = y[1:train_index]
y_test = y[train_index+1:end]
