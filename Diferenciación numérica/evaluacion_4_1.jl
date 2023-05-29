include("Diferencias Divididas/Julia/ddiff_div.jl")
include("Diferencias Finitas/Julia/ddiff_finitas.jl")

#Primera parte
puntos_1 = Array{Punto}(undef, 16)

puntos_1[1] = Punto(0.5, 2.16752)
puntos_1[2] = Punto(0.6, 1.41100)
puntos_1[3] = Punto(0.7, 1.08049)
puntos_1[4] = Punto(0.8, 0.97501)
puntos_1[5] = Punto(0.9, 1.00166)
puntos_1[6] = Punto(1.0, 1.11325)
puntos_1[7] = Punto(1.1, 1.28404)
puntos_1[8] = Punto(1.2, 1.49921)
puntos_1[9] = Punto(1.3, 1.74987)
puntos_1[10] = Punto(1.4, 2.03045)
puntos_1[11] = Punto(1.5, 2.33742)
puntos_1[12] = Punto(1.6, 2.66845)
puntos_1[13] = Punto(1.7, 3.02198)
puntos_1[14] = Punto(1.8, 3.39698)
puntos_1[15] = Punto(1.9, 3.79274)
puntos_1[16] = Punto(2.0, 4.20876)


est_1_0_63 = diff_divididas(puntos_1, 3, 0.63, false)
est_1_1_78 = diff_divididas(puntos_1, 3, 1.78, false)


println("estimación de 3er grado para f'(", 0.63, ") = ", est_1_0_63)
println("estimación de 3er grado para f'(", 1.78, ") = ", est_1_1_78)

puntos_1_1 = [puntos_1[3], puntos_1[4], puntos_1[5], puntos_1[6], puntos_1[7], puntos_1[8], puntos_1[9], puntos_1[10], puntos_1[11], puntos_1[12], puntos_1[13], puntos_1[14], puntos_1[15]]

est_1_1_1 = ddiff_finitas(puntos_1_1)

println("estimación para f'(x) en [0.8,1.8]")
display(est_1_1_1)

puntos_1_1_2 = [est_1_1_1[2], est_1_1_1[3], est_1_1_1[4], est_1_1_1[5], est_1_1_1[6], est_1_1_1[7], est_1_1_1[8], est_1_1_1[9] ]

est_1_1_1_1 = ddiff_finitas(puntos_1_1_2)

println("estimación para f''(x) en [1.0,1.5]")
display(est_1_1_1_1)



#Fin de la primera parte

function f(x::Float64)::Float64
    return ((x^2 + sin(x))/(x-2)) + (3)
end


