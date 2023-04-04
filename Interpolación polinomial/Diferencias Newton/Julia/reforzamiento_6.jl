include("diferencias_prog.jl");
include("diferencias_reg.jl");

function main()
    p_0 = Punto(0.125, 0.79168)
    p_1 = Punto(0.250, 0.77334)
    p_2 = Punto(0.375, 0.74371)
    p_3 = Punto(0.5, 0.70413)
    p_4 = Punto(0.625, 0.65632)
    p_5 = Punto(0.75, 0.60228)

    puntos = [p_0, p_1, p_2, p_3, p_4, p_5]
    err_r = zeros(Float64, length(puntos)-1, 3)
    err_p = zeros(Float64, length(puntos)-1, 3)

    est_r = 0.65
    est_p = 0.18

    for i ∈ axes(err_r, 1)[begin:end]
        err_r[i, 1] = i
        err_r[i, 2] = diferencias_newton_reg(puntos, est_r, i)
        if i > 1
            err_r[i-1, 3] = err_r[i, 2] - err_r[i-1, 2]
        end
    end

    println()

    display(err_r)

    println()

    println()
    println("estimación de ", est_r, " ≈ ", err_r[3, 2])

    println()

    for i ∈ axes(err_p, 1)[begin:end]
        err_p[i, 1] = i
        err_p[i, 2] = diferencias_newton_prog(puntos, est_p, i)
        if i > 1
            err_p[i-1, 3] = err_p[i, 2] - err_p[i-1, 2]
        end
    end

    println()

    display(err_p)

    println()

    println()
    println("estimación de ", est_p, " ≈ ", err_p[3, 2])
end

main()
