include("punto_fijo.jl")

function g_1(X::Array{Float64})
    return ((X[1] ^ 2)- (X[2] ^ 2) - X[1] - 3 + (3 * X[1]))/(3)
end

function g_2(X::Array{Float64})
    return -(X[1] + (2 * X[2]) + 1 - (3 * X[2]))/(3)
end

function main()
    A = [0.0, 0.0]
    G = [g_1, g_2]
    p = punto_fijo(A, G, 0.0005, 100)
    display(p)
end

main()
