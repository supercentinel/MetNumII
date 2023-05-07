include("ddiff_div.jl")

puntos = Array{Punto}(undef, 5)

x = 0.8
grado = 4

puntos[1] = Punto(0.5, -0.46828)
puntos[2] = Punto(1.0, -2.88906)
puntos[3] = Punto(1.1, -3.89501)
puntos[4] = Punto(1.3, -6.89374)
puntos[5] = Punto(1.6, -15.35253)

est = diff_divididas(puntos, grado, x, true)
println("estimacion de P'_", 4,"(", x,") = ", est)
