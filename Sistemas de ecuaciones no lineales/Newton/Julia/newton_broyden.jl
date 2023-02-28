using Printf

function f1(x::Float64, y::Float64)
    return (x ^ 2) - (10.0 * x) + (y ^ 2) + 8.0
end

function f2(x::Float64, y::Float64)
    return (x * (y ^ 2)) + x - (10.0 * y) + 8.0
end

function f1x(x::Float64, y::Float64)
    return (2 * x) - 10.0
end

function f1y(x::Float64, y::Float64)
    return 2.0 * y
end

function f2x(x::Float64, y::Float64)
    return (y ^ 2) + 1
end

function f2y(x::Float64, y::Float64)
    return (2 * x * y) - 10.0
end

function Error_a(A_k::Array{Float64}, A_km1::Array{Float64})
    return √(((A_k[1] - A_km1[1]) ^ 2)+((A_k[2] - A_km1[2]) ^ 2))
end

function Norma(A::Array{Float64})
    return √(((A[1]) ^ 2)+((A[2]) ^ 2))
end

function newton_broyden(A::Array{Float64}, tolerancia::Float64, iteraciones::Int64)
    A_k = copy(A)
    A_km1 = copy(A)
    J = [f1x f1y; f2x f2y]
    F = [f1 f2]
    J_xk_ = zeros(Float64, 2 , 2)
    F_xkm1_ = zeros(Float64, 2, 1)
    F_xk_ = zeros(Float64, 2, 1)
    J_inv = zeros(Float64, 2, 2)
    ΔX = zeros(Float64, 2, 1)
    ΔF_X_ = zeros(Float64, 2, 1);
    She_Morr = zeros(Float64, 2, 2)
    She_Morr_km1 = zeros(Float64, 2, 2)
    e_r = 1.0
    k = 0
    #inicio de la primra iteración usando la matriz Jacobiana inversa
    for row in 1:2
        F_xkm1_[row] = F[row](A_k[1], A_k[2])
    end

    for row in 1:2
        for column in 1:2
            J_xk_[row,column] = J[row,column](A_k[1], A_k[2])
         end
    end

    J_inv = inv(J_xk_)

    A_k = A_k - (J_inv * F_xkm1_)

    for row in 1:2
        F_xk_[row] = F[row](A_k[1], A_k[2])
    end

    ΔX= A_k - A_km1
    ΔF_X_ = F_xk_ - F_xkm1_

    denom = transpose(ΔX) * J_inv * ΔF_X_

    She_Morr = (ΔX - (J_inv * ΔF_X_)) * (transpose(ΔX) * J_inv)
    She_Morr = She_Morr * 1/denom[1]
    She_Morr = J_inv - She_Morr

    #fin de la primera iteración. Ahora podemos continuar sin la matriz Jacobiana

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

    k += 1

    while true
        A_km1 = copy(A_k)
        F_xkm1_ = copy(F_xk_)
        She_Morr_km1 = copy(She_Morr)

        A_k = A_km1 - (She_Morr_km1 * F_xkm1_)

        for row in 1:2
            F_xk_[row] = F[row](A_k[1], A_k[2])
        end

        ΔX = A_k - A_km1
        ΔF_X_ = F_xk_ - F_xkm1_

        denom = transpose(ΔX) * She_Morr_km1 * ΔF_X_

        She_Morr = (ΔX - (She_Morr_km1 * ΔF_X_)) * (transpose(ΔX) * She_Morr_km1)

        She_Morr = She_Morr * 1/denom[1]

        She_Morr = She_Morr_km1 - She_Morr

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
    A = [2.0, 3.0]
    R = newton_broyden(A, 0.005, 10)
    print("Resultado = ")
    println(R)
end

main()
