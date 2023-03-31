include("diferencias_prog.jl")

function main()

    p_0 = Punto(1.0, 0.765198)
    p_1 = Punto(1.3, 0.620086)
    p_2 = Punto(1.6, 0.455402)
    p_3 = Punto(1.9, 0.281819)
    p_4 = Punto(2.2, 0.110362)

    puntos = [p_0, p_1, p_2, p_3, p_4]
    est = 1.1

    r = diferencias_newton(puntos, est, 4)
    println()
    println(r)
end

main()