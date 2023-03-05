include("punto_fijo_sucesivo.jl")

function g_1(X::Array{Float64})
    return (3 * (X[1] ^ 2)) - (X[2] ^ 2) + X[1] - 1
end

function g_2(X::Array{Float64})
    return (√((X[1] ^ 3) + 5))/(√(X[1]) * √3)
end

function main()
    A = [1.5, 2.0]
    G = [g_1, g_2]

    R = punto_fijo_sucesivo(A, G, 0.0005, 20)
    display(R)
end

main()
