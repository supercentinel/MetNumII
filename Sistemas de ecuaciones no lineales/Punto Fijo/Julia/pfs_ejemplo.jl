include("punto_fijo_sucesivo.jl")

function g_1(X::Array{Float64})
    return -(((X[1] * X[1]) - X[2] - 2.0 - (4.0 * X[1]))/(4.0));
end

function g_2(X::Array{Float64})
    return return -(((2.0 * X[1] * X[2]) - 3.0 - (5.0 * X[2]))/(5.0));
end

function main()
    A = [1.75, 1.0]
    G = [g_1, g_2]

    p = punto_fijo_sucesivo(A, G, 0.00008, 100)
    display(p)
end

main()
