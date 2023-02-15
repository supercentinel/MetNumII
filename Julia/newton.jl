function newton(A:Array{Float64}, tolerancia::Float64, iteraciones::int64)

    while true

        j_xk = zeros(Float64, 3, 3)
        f_xk = zeros(Float64, 3, 1)


        if e_r >= tolerancia
            break
        end
        if k <= iteraciones
            break
        end

    end
end

