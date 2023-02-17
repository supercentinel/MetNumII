using Printf

function f1(x::Float64, y::Float64, z::Float64)
    return (x ^ 2) + (2 * (z ^ 2)) + y - 10
end

function f2(x::Float64, y::Float64, z::Float64)
    return (5 * x) - (6 * y) + z
end

function f3(x::Float64, y::Float64, z::Float64)
    return z - (x ^ 2) - (y ^ 2)
end

function f1x(x::Float64, y::Float64, z::Float64)
    return (2 * x)
end

function f1y(x::Float64, y::Float64, z::Float64)
    return 1
end

function f1z(x::Float64, y::Float64, z::Float64)
    return (4 * z)
end

function f2x(x::Float64, y::Float64, z::Float64)
    return 5
end

function f2y(x::Float64, y::Float64, z::Float64)
    return -6
end

function f2z(x::Float64, y::Float64, z::Float64)
    return 1
end

function f3x(x::Float64, y::Float64, z::Float64)
    return -(2 * x)
end

function f3y(x::Float64, y::Float64, z::Float64)
    return -(2 * y)
end

function f3z(x::Float64, y::Float64, z::Float64)
    return 1
end

function newton(A::Array{Float64}, tolerancia::Float64, iteraciones::Int64)

    J = [f1x f1y f1z; f2x f2y f2z; f3x f3y f3z]
    F = [f1 f2 f3]
    J_xk_ = zeros(Float64, 3 , 3)
    F_xk_ = zeros(Float64, 3, 1)
    e_r = 1.0
    k = 0

    println(J_xk_)

    while true

        #j_xk = zeros(Float64, 3, 3)
        #f_xk = zeros(Float64, 3, 1)


        if e_r <= tolerancia
            break
        end
        if k >= iteraciones
            break
        end

        k += 1

    end
end

function main()
    A = [1.0, 1.0, 1.0]
    newton(A, 0.0005, 10)
end

main()
