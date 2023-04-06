include("diferencias_divididas.jl")

function main()
    p_1 = Punto(1.0, 475.0)
    p_2 = Punto(2.0, 532.0)
    p_3 = Punto(3.0, 495.0)
    p_4 = Punto(4.0, 437.0)
    p_5 = Punto(5.0, 522.0)
    #p_6 = Punto(6.0, 121.0)
    #p_7 = Punto(7.0, 108.0)
    p_7 = Punto(8.0, 829.0)
    p_8 = Punto(9.0, 573.0)
    p_9 = Punto(10.0, 648.0)


    puntos = [p_1, p_2, p_3, p_4, p_5, p_7, p_8, p_9]

    r = diferecias_divididas(puntos, 7.0, 7, true)
    println(r)
end

main()
