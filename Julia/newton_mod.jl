#using LinearAlgebra
using Printf

function f1(x::Float64, y::Float64)
    return (x ^ 2) - (10 * x) + (y ^ 2) + 6
end

function f2(x::Float64, y::Float64)
    return (x * (y ^ 2)) + (x) - (10 * y) + 4
end

function f1x(x::Float64, y::Float64)
    return (2 * x) - 10
end

function f2y(x::Float64, y::Float64)
    return (2 * x * y) - 10
end

#En la libería estándar existe en LinearAlgebra la función norma que hace lo mismo. Meh.
function norma(A::Array{Float64})
    ∑ = 0.0

    for i in 1:length(A) 
        ∑ += (A[i] ^ 2)
    end
    
    return √∑

end

function newton_mod(X::Array{Float64}, tolerancia::Float64, iteraciones::Int64)
    
    X_km1 = X
    X_k = X
    F_X_k_ = X
    δF_X_k_ = X
    e_a = 1.0
    k = 0

    while true
    
        X_km1 = X_k
        
        F_X_k_[1] = f1(X_km1[1], X_km1[2])
        F_X_k_[2] = f2(X_km1[1], X_km1[2])

        println(F_X_k_)

        δF_X_k_[1] = f1x(X_km1[1], X_km1[2])
        δF_X_k_[2] = f2y(X_km1[1], X_km1[2])

        println(δF_X_k_)

        e_a = norma(F_X_k_)

        if  e_a <= tolerancia
            break
        end
        if k >= iteraciones
            break
        end

        X_k[1] = X_km1[1] - ((F_X_k_[1])/(δF_X_k_[1]))
        X_k[2] = X_km1[2] - ((F_X_k_[2])/(δF_X_k_[2]))

        println(X_k)

        k += 1
    end

    return X_k

end

function main()
    A = [0.5, 0.5]
    R = newton_mod(A, 0.0005, 1)
    println(R)
end

main()