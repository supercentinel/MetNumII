include("simpson_38.jl")

puntos = Array{Punto}(undef, 13)

puntos[1] = Punto(1.4, 4.055)
puntos[2] = Punto(1.6, 4.953)
puntos[3] = Punto(1.8, 6.050)
puntos[4] = Punto(2.0, 7.389)
puntos[5] = Punto(2.2, 9.025)
puntos[6] = Punto(2.4, 11.023)
puntos[7] = Punto(2.6, 13.46)
puntos[8] = Punto(2.8, 16.445)
puntos[9] = Punto(3.0, 20.086)
puntos[10] = Punto(3.2, 24.533)
puntos[11] = Punto(3.4, 29.964)
puntos[12] = Punto(3.6, 36.598)
puntos[13] = Punto(3.8, 44.701)

estimacion = simpson_38(puntos, true)

println(estimacion)
