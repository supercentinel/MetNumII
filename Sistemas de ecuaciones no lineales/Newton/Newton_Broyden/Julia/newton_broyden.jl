using Printf

function Norma(A::Array{Float64})
    ∑= 0.0

    for i in 1:length(A)
        ∑ += (A[i] ^ 2)
    end

    return √∑
end

function newton_broyden(A::Array{Float64}, F::Array{Function},J::Array{Function}, tolerancia::Float64, iteraciones::Int64, TeX::Bool)
    A_k = copy(A)
    A_km1 = copy(A)
    J_xk_ = zeros(Float64, length(F) , length(F))
    F_xkm1_ = zeros(Float64, length(F), 1)
    F_xk_ = copy(F_xkm1_)
    J_inv = copy(J_xk_)
    ΔX = copy(A)
    ΔF_X_ = copy(F_xk_)
    She_Morr = copy(J_xk_)
    She_Morr_km1 = copy(She_Morr)
    e_r = 1.0
    k = 1

    #inicio de la primra iteración usando la matriz Jacobiana inversa
    for row in 1:length(F)
        F_xkm1_[row] = F[row](A_k)
    end

    for row in 1:size(J, 1)
        for column in 1:size(J, 1)
            J_xk_[row,column] = J[row,column](A_k)
         end
    end

    J_inv = inv(J_xk_)

    A_k = A_k - (J_inv * F_xkm1_)

    for row in 1:length(F)
        F_xk_[row] = F[row](A_k)
    end

    ΔX= A_k - A_km1
    ΔF_X_ = F_xk_ - F_xkm1_

    denom = transpose(ΔX) * J_inv * ΔF_X_

    She_Morr = (ΔX - (J_inv * ΔF_X_)) * (transpose(ΔX) * J_inv)
    She_Morr = She_Morr * 1/denom[1]
    She_Morr = J_inv + She_Morr

    e_r = Norma(F_xk_)

    #fin de la primera iteración. Ahora podemos continuar sin la matriz Jacobiana
    if TeX == true
        #$\global\def\vvector#1#2#3{\begin{bmatrix}#1 \\ #2 \\ #3 \end{bmatrix}}$
        #"$\global\def\33matrix#1#2#3#4#5#6#7#8#9{\begin{bmatrix}#1 && #2 && #3 \\ #4 && #5 && #6 \\ #7 && #8 && #9 \end{bmatrix}}$
        @printf("|%d|%c\\33matrix{%-10.6LF}{%-10.6LF}{%-10.6LF}{%-10.6LF}{%-10.6LF}{%-10.6LF}{%-10.6LF}{%-10.6LF}{%-10.6LF}%c|", k, 36, She_Morr[1,1], She_Morr[1,2], She_Morr[1,3], She_Morr[2,1], She_Morr[2,2], She_Morr[2,3], She_Morr[3,1], She_Morr[3,2], She_Morr[3,3], 36)
        @printf("%c\\vvector{%-10.6LF}{%-10.6LF}{%-10.6LF}%c|", 36, A_km1[1], A_km1[2], A_km1[3], 36)
        @printf("%c\\vvector{%-10.6LF}{%-10.6LF}{%-10.6LF}%c|", 36, F_xkm1_[1], F_xkm1_[2], F_xkm1_[3], 36)
        @printf("%c\\vvector{%-10.6LF}{%-10.6LF}{%-10.6LF}%c|", 36, A_k[1], A_k[2], A_k[3], 36)
        @printf("%c\\vvector{%-10.6LF}{%-10.6LF}{%-10.6LF}%c|", 36, F_xk_[1], F_xk_[2], F_xk_[3], 36)
        @printf("%-24.6LF|\n", e_r)
    else
        print("k = ")
        println(k)
        print("X^k-1 = ")
        println(A_km1)
        print("F(X^k-1) = ")
        println(F_xkm1_)
        print("X^k = ")
        println(A_k)
        print("F(X^k) = ")
        println(F_xk_)
        print("ΔX = ")
        println(ΔX)
        print("ΔF(X) = ")
        println(ΔF_X_)
        print("Sherman-Morrison = ")
        println(She_Morr)
        print("Denom = ")
        println(denom)
        print("Error = ")
        println(e_r)
    end

    k += 1

    while true
        A_km1 = copy(A_k)
        F_xkm1_ = copy(F_xk_)
        She_Morr_km1 = copy(She_Morr)

        A_k = A_km1 - (She_Morr_km1 * F_xkm1_)

        for row in 1:length(F)
            F_xk_[row] = F[row](A_k)
        end

        ΔX = A_k - A_km1
        ΔF_X_ = F_xk_ - F_xkm1_

        denom = transpose(ΔX) * She_Morr_km1 * ΔF_X_

        She_Morr = (ΔX - (She_Morr_km1 * ΔF_X_)) * (transpose(ΔX) * She_Morr_km1)

        She_Morr = She_Morr * 1/denom[1]

        She_Morr = She_Morr_km1 + She_Morr

        e_r = Norma(F_xk_)

        if TeX == true
            @printf("|%d|%c\\33matrix{%-10.6LF}{%-10.6LF}{%-10.6LF}{%-10.6LF}{%-10.6LF}{%-10.6LF}{%-10.6LF}{%-10.6LF}{%-10.6LF}%c|", k, 36, She_Morr[1,1], She_Morr[1,2], She_Morr[1,3], She_Morr[2,1], She_Morr[2,2], She_Morr[2,3], She_Morr[3,1], She_Morr[3,2], She_Morr[3,3], 36)
            @printf("%c\\vvector{%-10.6LF}{%-10.6LF}{%-10.6LF}%c|", 36, A_km1[1], A_km1[2], A_km1[3], 36)
            @printf("%c\\vvector{%-10.6LF}{%-10.6LF}{%-10.6LF}%c|", 36, F_xkm1_[1], F_xkm1_[2], F_xkm1_[3], 36)
            @printf("%c\\vvector{%-10.6LF}{%-10.6LF}{%-10.6LF}%c|", 36, A_k[1], A_k[2], A_k[3], 36)
            @printf("%c\\vvector{%-10.6LF}{%-10.6LF}{%-10.6LF}%c|", 36, F_xk_[1], F_xk_[2], F_xk_[3], 36)
            @printf("%-24.6LF|\n", e_r)
        else
            print("k = ")
            println(k)
            print("X^k-1 = ")
            println(A_km1)
            print("X^k = ")
            println(A_k)
            print("F(X^k-1) = ")
            println(F_xkm1_)
            print("F(X^k) = ")
            println(F_xk_)
            print("ΔX = ")
            println(ΔX)
            print("ΔF(X) = ")
            println(ΔF_X_)
            print("Sherman-Morrison = ")
            println(She_Morr)
            print("Denom = ")
            println(denom)
            print("Error = ")
            println(e_r)
        end

        if e_r <= tolerancia
            break
        end
        if k >= iteraciones
            break
        end

        k += 1

    end

    return A_k
end
