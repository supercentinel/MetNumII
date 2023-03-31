include("diferencias_reg.jl")

function main()

    p_0 = Punto(50, 24.94)
    p_1 = Punto(60, 30.11)
    p_2 = Punto(70, 36.05)
    p_3 = Punto(80, 42.84)
    p_4 = Punto(90, 50.57)
    p_5 = Punto(100, 59.30)

    puntos = [p_0, p_1, p_2, p_3, p_4, p_5]
    est = 96.0

    P_2 = diferencias_newton_reg(puntos, est, 2)
    println()
    println(P_2)
    
    P_3 = diferencias_newton_reg(puntos, est, 3)
    println()
    println(P_3)
end

main()