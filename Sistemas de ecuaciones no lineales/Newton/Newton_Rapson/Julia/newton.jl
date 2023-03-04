using Printf

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
            @printf("|%d", k)
            #Imprime X^k formateada a TeX(dice TeX pero más bien es para markdown y KaTeX)
            @printf("|%c\\begin%cbmatrix%c%.10LF \\\\ %.10LF \\\\ %.10LF\\end%cbmatrix%c%c", 36, 123, 125, A_k[1], A_k[2], A_k[3], 123, 125, 36)
            #Imprime J(X^k)
            @printf("|%c\\begin%cbmatrix%c%.10LF & %.10LF & %.10LF \\\\ %.10LF & %.10LF & %.10LF \\\\ %.10LF & %.10LF & %.10LF \\end%cbmatrix%c%c", 36, 123, 125, J_xk_[1,1], J_xk_[1,2], J_xk_[1,3], J_xk_[2,1], J_xk_[2,2], J_xk_[2,3], J_xk_[3,1], J_xk_[3,2], J_xk_[3,3] , 123, 125, 36)
            #Imprime F(X^)
            @printf("|%c\\begin%cbmatrix%c%.10LF \\\\ %.10LF \\\\ %.10LF\\end%cbmatrix%c%c", 36, 123, 125, F_xk_[1], F_xk_[2], F_xk_[3], 123, 125, 36)
            @printf("|%.10LF|\n", e_r)
        else
            print("k = ")
            println(k)
            print("X^k = ")
            println(A_k)
            print("F(X^k) = ")
            println(F_xk_)
            print("J(X^k) = ")
            println(J_xk_)
            print("Error  = ")
            println(e_r)
        end

        if e_r <= tolerancia
            break
        end
        if k >= iteraciones
            break
        end

        k += 1

        A_k = A_k - (inv(J_xk_) * F_xk_)

        e_r = Error_a(A_k, A_km1)/Norma(A_k)

    end

    return A_k
end
