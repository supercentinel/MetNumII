include("newton_broyden.jl")

function f1(X::Array{Float64})
    return (X[1] ^ 2) + (10.0 * X[1]) + (X[2] ^ 2) - (4.0 * X[2]) + 10
end

function f2(X::Array{Float64})
    return (X[1] * (X[2] ^ 2)) + X[1] + (8.0 * X[2]) + 4.0
end

function f1x(X::Array{Float64})
    return (2.0 * X[1]) + 10.0
end

function f1y(X::Array{Float64})
    return (2.0 * X[2]) - 4.0
end

function f2x(X::Array{Float64})
    return (X[2] ^ 2) + 1.0
end

function f2y(X::Array{Float64})
    return (2.0 * X[1] * X[2]) + 8.0
end

function main()
    A = [-2.0, 5.0]
    #A_2 = [-1.25, -0.35]
    F = [f1, f2]
    J = [f1x f1y; f2x f2y]

    R = newton_broyden(A, F, J, 0.0000000000001, 10, false)
    display(R)
    #R_2 = newton_broyden(A_2, F, J, 0.0001, 10, false)
    #display(R_2)
end

main()
