include("newton_mod_sucesivo.jl")

function f1(X::Array{Float64})
    return (X[1] ^ 2) + X[2] + (2 * (X[3] ^ 2)) - 10.0
end

function f2(X::Array{Float64})
    return (5 * X[1]) - (6 * X[2]) + X[3]
end

function f3(X::Array{Float64})
    return X[3] - (X[1] ^ 2) - (X[2] ^ 2)
end
#con respecto a z
function f1d(X::Array{Float64})
    return 4.0 * X[3]
end
#con respecto a x
function f2d(X::Array{Float64})
    return 5.0
end
#con respecto a y
function f3d(X::Array{Float64})
    return -2.0 * X[2]
end

function main()
    A = [0.5, 0.5, 0.5]
    F =  [f1, f2, f3]
    δF = [f1d, f2d, f3d]

    println(A)
    R = newton_mod_suc(A ,F, δF, 0.00005, 10)
    println(R)
end

main()
