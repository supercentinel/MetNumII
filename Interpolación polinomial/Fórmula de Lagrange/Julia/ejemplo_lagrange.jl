include("lagrange.jl")

function main()
    p_0 = Punto(1.73, 8.1)
    p_1 = Punto(1.82, 8.3)
    p_2 = Punto(2.61, 7.8)
    p_3 = Punto(5.22, 2.4)
    p_4 = Punto(8.26, -1.7)

    puntos = [p_0, p_1, p_2, p_3, p_4]

    est = 1.75

    r = lagrange(puntos, est, 2, true)
    println("f(", est, ") ≈ ", r)
end

main()
