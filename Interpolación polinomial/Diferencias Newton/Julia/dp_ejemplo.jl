include("diferencias_prog.jl")

function main()

    p_0 = Punto(50, 24.94)
    p_1 = Punto(60, 20.11)
    p_2 = Punto(70, 36.05)
    p_3 = Punto(80, 23.84)
    p_4 = Punto(90, 50.57)
    p_5 = Punto(100, 59.30)

    puntos = [p_0, p_1, p_2, p_3, p_4, p_5]
    est = 57.0

    r = diferencias_newton(puntos, est, 2)
    println()
    println(r)
end

main()