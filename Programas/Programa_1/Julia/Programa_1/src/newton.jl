function Error_a(A_k::Array{Float64}, A_km1::Array{Float64})
    ∑ = 0.0

    if length(A_k) != length(A_km1)
        return 0.0
    end

    for i in 1:length(A_k)
        ∑ += (A_k[i] - A_km1[i]) ^ 2
    end

    return √∑
end

function Norma(A::Array{Float64})
    ∑ = 0.0

    for i in 1:length(A)
        ∑ += A[i] ^ 2
    end

    return √∑
end

function newton(A::Array{Float64}, F::Array{Function}, J::Array{Function}, tolerancia::Float64, iteraciones::Int64, TeX::Bool)

    A_k = copy(A)
    A_km1 = copy(A)

    J_xk_ = zeros(Float64, size(J,1), size(J,2))
    F_xk_ = zeros(Float64, length(F), 1)
    e_r = 1.0
    k = 0
    converge::Bool = false

    while true

        A_km1 = A_k

        for row in 1:size(J,1)
            for column in 1:size(J,1)
                J_xk_[row,column] = J[row,column](A_k)
            end
        end

        for row in 1:length(F)
            F_xk_[row] = F[row](A_k)
        end

        if TeX == true
            println("")
        else
            print("k = ")
            println(k)
            print("X^k = ")
            display(A_k)
            print("F(X^k) = ")
            display(F_xk_)
            print("J(X^k) = ")
            display(J_xk_)
            print("Error  = ")
            println(e_r)
        end

        if e_r <= tolerancia
            converge = true
            break
        end
        if k >= iteraciones
            break
        end

        k += 1

        A_k = A_k - (inv(J_xk_) * F_xk_)

        e_r = Error_a(A_k, A_km1)/Norma(A_k)

    end

    if converge == true
        println()
        println("Converge!")
        println("Raíz en:")
        display(A_k)
        print("Con una error de: ")
        print(e_r)
        print(" y un total de ")
        print(k)
        println(" iteraciones")
    else
        println("El método no converge con los datos introducidos")
    end

    return A_k
end
