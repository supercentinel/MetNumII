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

function newton(A::Array{Float64}, tolerancia::Float64, iteraciones::Int64, TeX::Bool)
    A_k = A
    A_km1 = A
    J = [f1x f1y; f2x f2y]
    F = [f1 f2]
    J_xk_ = zeros(Float64, 2 , 2)
    F_xkm1_ = zeros(Float64, 2, 1)
    F_xk_ = zeros(Float64, 2, 1)
    J_inv = zeros(Float64, 2, 2)
    ΔX = zeros(Float64, 2, 1)
    ΔF_X_ = zeros(Float64, 2, 1);
    e_r = 1.0
    k = 0

    while true

        A_km1 = A_k

        for row in 1:2
            F_xkm1_[row] = F_xk_[row]
        end

        for row in 1:2
            for column in 1:2
                J_xk_[row,column] = J[row,column](A_k[1], A_k[2])
            end
        end

        for row in 1:2
            F_xk_[row] = F[row](A_k[1], A_k[2])
        end

        J_inv = inv(J_xk_)

        A_k = A_k - (inv(J_xk_) * F_xk_)
        ΔX = A_k - A_km1
        ΔF_X_ = F_xk_ - F_xkm1_

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
            print("ΔX = ")
            println(ΔX)
            print("J(X^k) = ")
            println(J_xk_)
            print("J^-1 = ")
            println(J_inv)
            print("F(X^k) = ")
            println(F_xk_)
            print("ΔF_X_ = ")
            println(ΔF_X_);
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

        e_r = Error_a(A_k, A_km1)/Norma(A_k)

    end

    return A_k
end

function main()
    A = [2.0, 3.0]
    R = newton(A, 0.005, 10, false)
    println(R)
end

main()
