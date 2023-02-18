using Printf

function f1(x::Float64, y::Float64, z::Float64)
    return (x ^ 2) + (2 * (z ^ 2)) + y - 10.0
end

function f2(x::Float64, y::Float64, z::Float64)
    return (5 * x) - (6 * y) + z
end

function f3(x::Float64, y::Float64, z::Float64)
    return z - (x ^ 2) - (y ^ 2)
end

function f1x(x::Float64, y::Float64, z::Float64)
    return (2.0 * x)
end

function f1y(x::Float64, y::Float64, z::Float64)
    return 1.0
end

function f1z(x::Float64, y::Float64, z::Float64)
    return (4 * z)
end

function f2x(x::Float64, y::Float64, z::Float64)
    return 5.0
end

function f2y(x::Float64, y::Float64, z::Float64)
    return -6.0
end

function f2z(x::Float64, y::Float64, z::Float64)
    return 1.0
end

function f3x(x::Float64, y::Float64, z::Float64)
    return -(2 * x)
end

function f3y(x::Float64, y::Float64, z::Float64)
    return -(2 * y)
end

function f3z(x::Float64, y::Float64, z::Float64)
    return 1.0
end

function Error_a(A_k::Array{Float64}, A_km1::Array{Float64})
    return √(((A_k[1] - A_km1[1]) ^ 2)+((A_k[2] - A_km1[2]) ^ 2)+((A_k[3] - A_km1[3]) ^ 2))
end

function Norma(A::Array{Float64})
    return √(((A[1]) ^ 2)+((A[2]) ^ 2)+((A[3]) ^ 2))
end


function newton(A::Array{Float64}, tolerancia::Float64, iteraciones::Int64, TeX::Bool)

    A_k = A
    A_km1 = A
    J = [f1x f1y f1z; f2x f2y f2z; f3x f3y f3z]
    F = [f1 f2 f3]
    J_xk_ = zeros(Float64, 3 , 3)
    F_xk_ = zeros(Float64, 3, 1)
    e_r = 1.0
    k = 0

    while true

        A_km1 = A_k
        
        for row in 1:3
            for column in 1:3  
                J_xk_[row,column] = J[row,column](A_k[1], A_k[2], A_k[3])
            end
        end
        
        for row in 1:3
            F_xk_[row] = F[row](A_k[1], A_k[2], A_k[3])
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

function main()
    A_1 = [1.0, 1.0, 2.0]
    A_2 = [-1.25, -0.75, 2.0]

    R_1 = newton(A_1, 0.0005, 10, true)
    println(R_1)
    println("")
    R_2 = newton(A_2, 0.0005, 10, true)
    println(R_2)
end

main()
