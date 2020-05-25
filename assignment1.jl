
# Import Packages
using Pkg  # Package to install new packages

# Install packages
Pkg.add("DataFrames")
Pkg.add("Plots")
Pkg.add("Lathe")
Pkg.add("GLM")
Pkg.add("StatsPlots")
Pkg.add("MLBase")

# Load the installed packages
using DataFrames
using Plots
using Lathe
using GLM
using Statistics
using StatsPlots
using MLBase

# Read the file using CSV.File and convert it to DataFrame
df = CSV.read("C:\\Users\\tmika\\Desktop\\bank-additional-full_V3.csv",encoding=:utf8)

first(df,5)

names(df)

describe(df)

println(size(df))

-------------not necessary--------------------

# Fix column names by replaceing ' ', '-', '/' with '_'
colnames = Symbol[]
for i in string.(names(df))
    push!(colnames,Symbol(replace(replace(replace(strip(i)," " => "_"),"-" => "_"), "/" => "_")))
end

rename!(df, colnames);

-----------------------------------

# Train test split
using Lathe.preprocess: TrainTestSplit
train, test = TrainTestSplit(df,.75)


-----------------------------------
