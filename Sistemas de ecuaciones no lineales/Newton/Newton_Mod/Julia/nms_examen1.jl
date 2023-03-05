include("newton_mod_sucesivo.jl")

function f1(X::Array{Float64})
    return (X[1] ^ 2) - (4.0 * X[1]) + (X[2] ^ 2) + X[3]
end

function f2(X::Array{Float64})
    return (X[1] ^ 2) - X[1] - (6.0 * X[2]) + 1.0
end

function f3(X::Array{Float64})
    return (X[1] ^ 2) - (2.0 * X[1]) + (X[2] ^ 2) - (3 * (X[3] ^ 2)) + 3.0
end

function f1x(X::Array{Float64})
    return 2.0 * (X[1] - 2.0)
end

function f1y(X::Array{Float64})
    return 2.0 * X[2]
end

function f1z(X::Array{Float64})
    return 1.0
end

function f2x(X::Array{Float64})
    return (2.0 * X[1]) - 1.0
end

function f2y(X::Array{Float64})
    return -6.0
end

function f2z(X::Array{Float64})
    return 0.0
end

function f3x(X::Array{Float64})
    return 2.0 * (X[1] - 1.0)
end

function f3y(X::Array{Float64})
    return 2.0 * X[2]
end

function f3z(X::Array{Float64})
    return -6.0 * X[3]
end

function main()

end

main()
