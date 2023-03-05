include("newton_mod.jl")

function f1(X::Array{Float64})
    return (X[1] ^ 2) + X[2] + (2 * (X[3] ^ 2)) - 10.0
end

function f2(X::Array{Float64})
    return (5 * X[1]) - (6 * X[2]) + X[3]
end

function f3(X::Array{Float64})
    return X[3] - (X[1] ^ 2) - (X[2] ^ 2)
end
#con respecto a x
function f1d(X::Array{Float64})
    return 2 * X[1]
end
#con respecto a y
function f2d(X::Array{Float64})
    return -6.0
end
#con respecto a z
function f3d(X::Array{Float64})
    return 1.0
end

function main()
    A = [1.0, 1.0, 2.0]
    F = [f1, f2, f3]
    δF = [f1d, f2d, f3d]

    R = newton_mod(A, F, δF, 0.0005, 10)
    display(R)

    A_2 = [-1.75, -0.75, 2.0]
    R_2 = newton_mod(A_2, F, δF, 0.0005, 10)
    display(R_2)
end

main()
