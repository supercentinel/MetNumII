include("diferencias_divididas.jl")

function main()

    pp_0 = Punto(1.0, 1.3)
    pp_1 = Punto(6.0, 1.0)
    pp_2 = Punto(11.0, 0.5)
    pp_3 = Punto(16.0, 0.5)
    pp_4 = Punto(21.0, 1.5)

    primaria = [pp_0, pp_1, pp_2, pp_3, pp_4]

    ps_0 = Punto(1.0, 7.9)
    ps_1 = Punto(6.0, 6.6)
    ps_2 = Punto(11.0, 4.6)
    ps_3 = Punto(16.0, 2.4)
    ps_4 = Punto(21.0, 2.4)

    secundaria = [ps_0, ps_1, ps_2, ps_3, ps_4]

    pms_0 = Punto(1.0, 17)
    pms_1 = Punto(6.0, 17.1)
    pms_2 = Punto(11.0, 15.2)
    pms_3 = Punto(16.0, 14.2)
    pms_4 = Punto(21.0, 10.3)

    m_superior = [pms_0, pms_1, pms_2, pms_3, pms_4]

    ps_0 = Punto(1.0, 6.1)
    ps_1 = Punto(6.0, 6.8)
    ps_2 = Punto(11.0, 7.2)
    ps_3 = Punto(16.0, 9.6)
    ps_4 = Punto(21.0, 9.4)

    superior = [ps_0, ps_1, ps_2, ps_3, ps_4]

    #aprox_primaria = diferecias_divididas(primaria, 4.0, 4)
    #aprox_secundaria = diferecias_divididas(secundaria, 9.0, 1)
    #aprox_msuperior = diferecias_divididas(m_superior, 13.0, 1)
    aprox_superior = diferecias_divididas(superior, 19.0, 1)

    #println(aprox_primaria)
    #println(aprox_secundaria)
    #println(aprox_msuperior)
    println(aprox_superior)

end


main()
