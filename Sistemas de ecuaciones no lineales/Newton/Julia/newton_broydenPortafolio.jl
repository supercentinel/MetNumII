using Printf

function f1(X::Array{Float64})
    return (X[1] ^ 2) - X[1] + (2 * (X[2] ^ 2)) + (X[2] * X[3]) - 10
end

function f2(X::Array{Float64})
    return (5 * X[1]) - (6 * X[2]) + X[3]
end

function f3(X::Array{Float64})
    return X[3] - (X[1] ^ 2) - (X[2] ^ 2)
end

function f1x(X::Array{Float64})
    return (2.0 * X[1]) -1
end

function f1y(X::Array{Float64})
    return (4.0 * X[2]) + X[3]
end

function f1z(X::Array{Float64})
    return X[2]
end

function f2x(X::Array{Float64})
    return 5.0
end

function f2y(X::Array{Float64})
    return -6.0
end

function f2z(X::Array{Float64})
    return 1.0
end

function f3x(X::Array{Float64})
    return -2.0 * X[1]
end

function f3y(X::Array{Float64})
    return -2.0 * X[2]
end

function f3z(X::Array{Float64})
    return 1.0
end

function Norma(A::Array{Float64})
    ∑= 0.0

    for i in 1:length(A)
        ∑ += (A[i] ^ 2)
    end

    return √∑
end

function newton_broyden(A::Array{Float64}, F::Array{Function},J::Array{Function}, tolerancia::Float64, iteraciones::Int64)
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

function main()
    J = [f1x f1y f1z; f2x f2y f2z; f3x f3y f3z]
    F = [f1 f2 f3]
    A = [1.15, 1.5, 3.5]

    R = newton_broyden(A, F, J, 0.00005, 20)
    print("Resultado = ")
    println(R)
end

main()
