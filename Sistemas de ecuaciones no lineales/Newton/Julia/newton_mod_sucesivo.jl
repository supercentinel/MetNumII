#using LinearAlgebra
using Printf

function f1(x::Float64, y::Float64, z::Float64)
    return (x ^ 2) + y + (2 * (z ^ 2)) - 10.0
end

function f2(x::Float64, y::Float64, z::Float64)
    return (5 * x) - (6 * y) + z
end

function f3(x::Float64, y::Float64, z::Float64)
    return z - (x ^ 2) - (y ^ 2)
end
#con respecto a z
function f1d(x::Float64, y::Float64, z::Float64)
    return 4.0 * z
end
#con respecto a x
function f2d(x::Float64, y::Float64, z::Float64)
    return 5.0
end
#con respecto a z
function f3d(x::Float64, y::Float64, z::Float64)
    return 1.0
end

#En la libería estándar existe en LinearAlgebra la función norma que hace lo mismo. Meh.
function norma(A::Array{Float64})
    ∑ = 0.0

    for i in 1:length(A)
        ∑ += (A[i] ^ 2)
    end

    return √∑

end

#Usando despazamientos sucesivos
function newton_mod_suc(X::Array{Float64}, tolerancia::Float64, iteraciones::Int64)

    X_k = X
    F_X_k_ = [0.0, 0.0, 0.0]
    δF_X_k_ = [0.0, 0.0, 0.0]
    e_a = 0.0
    k = 0

    println(X_k)

    while true

        F_X_k_[1] = f1(X_k[1], X_k[2], X_k[3])
        δF_X_k_[1] = f1d(X_k[1], X_k[2], X_k[3])

        X_k[1] = X_k[1] - ((F_X_k_[1])/(δF_X_k_[1]))


        F_X_k_[2] = f2(X_k[1], X_k[2], X_k[3])
        δF_X_k_[2] = f2d(X_k[1], X_k[2], X_k[3])

        X_k[2] = X_k[2] - ((F_X_k_[2])/(δF_X_k_[2]))

        F_X_k_[3] = f3(X_k[1], X_k[2], X_k[3])
        δF_X_k_[3] = f3d(X_k[1], X_k[2], X_k[3])

        X_k[3] = X_k[3] - ((F_X_k_[3])/(δF_X_k_[3]))

        e_a = norma(F_X_k_)

        print("F(X^k) = ")
        println(F_X_k_)
        print("δF(X^k) = ")
        println(δF_X_k_)
        print("Error = ")
        println(e_a)
        print("k = ")
        println(k)
        print("X^k = ")
        println(X_k)


        if  e_a <= tolerancia
            break
        end
        if k >= iteraciones
            break
        end

        k += 1
    end

    return X_k

end
#=
function main()
    A = [0.5, 0.5]
    println(A)
    R = newton_mod(A, 0.00005, 10)
    println(R)
end

main()
=#
