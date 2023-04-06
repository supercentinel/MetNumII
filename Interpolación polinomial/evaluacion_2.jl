include("./Fórmula de Lagrange/Julia/lagrange.jl");
include("./Diferencias Divididas/Julia/diferencias_divididas.jl");
include("./Diferencias Newton/Julia/diferencias_reg.jl")
include("./Diferencias Newton/Julia/diferencias_prog.jl")

function main()

    #primera parte de la evaluacion
    p_0 = Punto(426.69, 2468)
    p_1 = Punto(483.30, 2482)
    p_2 = Punto(497.81, 2483)
    p_3 = Punto(568.92, 2498)
    p_4 = Punto(995.61, 2584)

    puntos = [p_0, p_1, p_2, p_3, p_4]

    errs_df = zeros(Float64, length(puntos)-1, 3)
    errs_l = zeros(Float64, length(puntos)-1, 3)

    for i ∈ axes(errs_df, 1)[begin:end]
        errs_l[i, 1] = i
        errs_l[i, 2] = lagrange(puntos, 450.0, i, false)
        errs_df[i, 1] = i
        errs_df[i, 2] = diferecias_divididas(puntos, 490.0, i, false)
        if i > 1
            errs_l[i-1, 3] = errs_l[i, 2] - errs_l[i-1, 2]
            errs_df[i-1, 3] = errs_df[i, 2] - errs_df[i-1, 2]
        end
    end

    println("tabla de errores lagrange")
    display(errs_l)
    println()
    println("tabla de errores diferencias divididas")
    display(errs_df)
    #fin de la primera parte de la evaluacion

    #segunda parte de la evaluacion
    pp_0 = Punto(0.4, 0.9115)
    pp_1 = Punto(0.7, 2.6283)
    pp_2 = Punto(1.0, 5.7074)
    pp_3 = Punto(1.3, 10.0921)
    pp_4 = Punto(1.6, 15.1945)
    pp_5 = Punto(1.9, 19.9307)
    pp_6 = Punto(2.2, 22.1838)

    ppuntos = [pp_0, pp_1, pp_2, pp_3, pp_4, pp_5, pp_6]

    rr_1 = diferencias_newton_reg(ppuntos, 1.8, 6, true)

    println("rr_1 = ", rr_1)

    rr_2 = diferencias_newton_prog(ppuntos, 0.6, 6, true)

    println("rr_2 = ", rr_2)


    #cuarta parte de la evalaucion


    pppp_0 = Punto(0.25, 1.1370547)
    pppp_1 = Punto(0.50, 1.31527542)
    pppp_2 = Punto(0.75, 1.56046016)

    pppp_puntos = [pppp_0, pppp_1, pppp_2]

    pppp_r = lagrange(pppp_puntos, 0.35, 2, true)

    #fin de la cuarta parte de la evaluacion

end

main()
