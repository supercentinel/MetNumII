#using LinearAlgebra
#En la libería estándar existe en LinearAlgebra la función norma que hace lo mismo. Meh.
function norma(A::Array{Float64})
    ∑ = 0.0

    for i in 1:length(A)
        ∑ += (A[i] ^ 2)
    end

    return √∑

end
#Usando despazamientos simultaneos
function newton_mod(X::Array{Float64}, F::Array{Function}, δF::Array{Function}, tolerancia::Float64, iteraciones::Int64)

    X_km1 = copy(X)
    X_k = copy(X)
    F_X_k_ = zeros(Float64, length(F), 1)
    δF_X_k_ = zeros(Float64, length(F), 1)
    e_a = 1.0
    k = 0

    print("X = ")
    println(X_km1)

    while true

        X_km1 = copy(X_k)

        for i ∈ 1:length(F)
            F_X_k_[i] = F[i](X_km1)
        end

        print("F(X) = ")
        println(F_X_k_)

        for i ∈ 1:length(δF)
            δF_X_k_[i] = δF[i](X_km1)
        end

        print("δF(X) = ")
        println(δF_X_k_)

        e_a = norma(F_X_k_)

        println(e_a)

        if  e_a <= tolerancia
            break
        end
        if k >= iteraciones
            break
        end

        for i ∈ 1:length(X_k)
            X_k[i] = X_km1[i] - ((F_X_k_[i])/(δF_X_k_[i]))
        end

        print("K = ")
        println(k)
        print("X^k = ")
        println(X_k)

        k += 1
    end

    return X_k

end
