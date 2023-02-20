#using LinearAlgebra
using Printf

function f1(x::Float64, y::Float64)
    return (x ^ 2.0) - (10.0 * x) + (y ^ 2.0) + 6.0
end

function f2(x::Float64, y::Float64)
    return (x * (y ^ 2)) + x - (10.0 * y) + 4.0
end

function f1y(x::Float64, y::Float64)
    return (2.0 * y)
end


function f2x(x::Float64, y::Float64)
    return (y * y) + 1.0
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
    F_X_k_ = [0.0, 0.0]
    δF_X_k_ = [0.0, 0.0]
    e_a = 0.0
    k = 0

    println(X_k)

    while true

        F_X_k_[1] = f2(X_k[1], X_k[2])
        δF_X_k_[1] = f2x(X_k[1], X_k[2])

        X_k[1] = X_k[1] - ((F_X_k_[1])/(δF_X_k_[1]))


        F_X_k_[2] = f1(X_k[1], X_k[2])
        δF_X_k_[2] = f1y(X_k[1], X_k[2])

        X_k[2] = X_k[2] - ((F_X_k_[2])/(δF_X_k_[2]))

        e_a = norma(F_X_k_)

        println(F_X_k_)
        println(δF_X_k_)
        println(e_a)
        println(k)
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
