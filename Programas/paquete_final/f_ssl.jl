#primer sistema de ecuaciones y sus derivadas
function f1a(X::Array{Float64})
    return (X[1] ^ 2) + (X[1] * X[2]) - 10
end

function f2a(X::Array{Float64})
    return X[2] + (3 * X[1] * (X[2] ^ 2)) - 50
end

function f1ax(X::Array{Float64})
    return (2 * X[1]) + X[2]
end

function f1ay(X::Array{Float64})
    return X[1]
end

function f2ax(X::Array{Float64})
    return (X[2] ^ 2)
end

function f2ay(X::Array{Float64})
    return (6 * X[1] * X[2]) + 1
end

#segundo sistema de ecuaciones y sus derivadas
function f1b(X::Array{Float64})
    return (X[1] ^ 2) + (X[2] ^ 2) - 9
end

function f2b(X::Array{Float64})
    return -exp(X[1]) - (2 * X[2]) - 3
end

function f1bx(X::Array{Float64})
    return 2 * X[1]
end

function f1by(X::Array{Float64})
    return 2 * X[2]
end

function f2bx(X::Array{Float64})
    return -exp(X[1])
end

function f2by(X::Array{Float64})
    return (-2 * X[2])
end
#tercer sistema de ecuaciones y sus derivadas(la tercera ecuacion es la misma que la del cuarto sistema de ecuaciones)
function f1c(X::Array{Float64} )
    return (2 * ( X[1] ^ 2)) - (4 * X[1]) + (X[2] ^ 2) + (3 * (X[3] ^ 2)) + (6 * X[3]) + 2
end

function f2c(X::Array{Float64} )
    return (X[1] ^ 2) + (X[2] ^ 2) - (2 * X[2]) + (2 * (X[3]^ 2)) - 5
end

function f1cx(X::Array{Float64} )
    return (4 * X[1]) - 4
end

function f1cy(X::Array{Float64} )
    return 2 * X[2]
end

function f1cz(X::Array{Float64} )
    return (6 * X[3]) + 6
end
function f2cx(X::Array{Float64} )
    return 2 * X[1]
end

function f2cy(X::Array{Float64} )
    return (2 * X[2]) - 2
end

function f2cz(X::Array{Float64} )
    return 4 * X[3]
end

#cuarto sistema de ecuaciones y sus derivadas
function f1d(X::Array{Float64} )
    return (X[1] ^ 2) - (4 * X[1]) + (X[2] ^ 2)
end

function f2d(X::Array{Float64} )
    return (X[1] ^ 2) - X[1] - (12 * X[2]) + 1
end

function f3cd(X::Array{Float64} )
    return  (3 * (X[1] ^ 2)) - (12 * X[1]) + (X[2] ^ 2) - (3 * (X[3] ^ 2)) + 8
end

function f1dx(X::Array{Float64} )
    return (2 * X[1]) - 4
end

function f1dy(X::Array{Float64} )
    return 2 * X[2]
end

function f1dz(X::Array{Float64} )
    return 0
end

function f2dx(X::Array{Float64} )
    return (2 * X[1]) - 1
end

function f2dy(X::Array{Float64} )
    return -12
end

function f2dz(X::Array{Float64} )
    return 0
end

function f3cdx(X::Array{Float64} )
    return (6 * X[1]) - 12
end

function f3cdy(X::Array{Float64} )
    return (2 * X[2])
end

function f3cdz(X::Array{Float64} )
    return 6 * X[3]
end

J_1 = [f1ax f1ay; f2ax f2ay]
F_1 = [f1a f2a]

J_2 = [f1bx f1by; f2bx f2by]
F_2 = [f1b f2b]

J_3 = [f1cx f1cy f1cz; f2cx f2cy f2cz; f3cdx f3cdy f3cdz]
F_3 = [f1c f2c f3cd]

J_4 = [f1dx f1dy f1dz; f2dx f2dy f2dz; f3cdx f3cdy f3cdz]
F_4 = [f1d f2d f3cd]
