#using LinearAlgebra
#En la libería estándar existe en LinearAlgebra la función norma que hace lo mismo. Meh.
function norma(A::Array{Float64})
    ∑ = 0.0

    for i in 1:length(A)
        ∑ += (A[i] ^ 2)
    end

    return √∑
end
#Usando despazamientos sucesivos
function newton_mod_suc(X::Array{Float64}, F::Array{Function}, δF::Array{Function}, tolerancia::Float64, iteraciones::Int64)

    X_k = copy(X)
    F_X_k_ = zeros(Float64, length(F), 1)
    δF_X_k_ = zeros(Float64, length(F), 1)
    e_a = 0.0
    k = 0

    println(X_k)

    while true

        for i ∈ 1:length(F)
            F_X_k_[i] = F[i](X_k)
            δF_X_k_[i] = δF[i](X_k)

            X_k[i] = X_k[i] - ((F_X_k_[i])/(δF_X_k_[i]))
        end
        #=
        F_X_k_[1] = f1(X_k[1], X_k[2], X_k[3])
        δF_X_k_[1] = f1d(X_k[1], X_k[2], X_k[3])

        X_k[1] = X_k[1] - ((F_X_k_[1])/(δF_X_k_[1]))


        F_X_k_[2] = f2(X_k[1], X_k[2], X_k[3])
        δF_X_k_[2] = f2d(X_k[1], X_k[2], X_k[3])

        X_k[2] = X_k[2] - ((F_X_k_[2])/(δF_X_k_[2]))

        F_X_k_[3] = f3(X_k[1], X_k[2], X_k[3])
        δF_X_k_[3] = f3d(X_k[1], X_k[2], X_k[3])

        X_k[3] = X_k[3] - ((F_X_k_[3])/(δF_X_k_[3]))
        =#

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
