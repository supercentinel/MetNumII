include("newton.jl")

function f1(X::Array{Float64})
    return (X[1] ^ 2) + (2 * (X[3] ^ 2)) + X[2] - 10.0
end

function f2(X::Array{Float64})
    return (5 * X[1]) - (6 * X[2]) + X[3]
end

function f3(X::Array{Float64})
    return X[3] - (X[1] ^ 2) - (X[2] ^ 2)
end

function f1x(X::Array{Float64})
    return (2.0 * X[1])
end

function f1y(X::Array{Float64})
    return 1.0
end

function f1z(X::Array{Float64})
    return (4 * X[3])
end

function f2x(X::Array{Float64})
    return 5.0
end

function f2y(X::Array{Float64})
    return -6.0
end

function f2z(X::Array{Float64})
    return 1.0
end

function f3x(X::Array{Float64})
    return -(2 * X[1])
end

function f3y(X::Array{Float64})
    return -(2 * X[2])
end

function f3z(X::Array{Float64})
    return 1.0
end

function main()
    J = [f1x f1y f1z; f2x f2y f2z; f3x f3y f3z]
    F = [f1 f2 f3]

    A_1 = [1.0, 1.0, 2.0]
    A_2 = [-1.25, -0.75, 2.0]

    R_1 = newton(A_1, F, J, 0.0005, 10, false)
    println(R_1)
    println("")
    R_2 = newton(A_2, F, J, 0.0005, 10, false)
    println(R_2)
end

main()
