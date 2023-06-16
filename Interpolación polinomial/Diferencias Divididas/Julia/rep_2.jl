include("diferencias_divididas.jl")


p_1 = Punto(-1.0, 2.15853)
p_2 = Punto(-0.6, 2.20496)
p_3 = Punto(-0.3, 2.62258)
p_4 = Punto(0.1, 3.08993)
p_5 = Punto(0.6, 3.33424)
p_6 = Punto(1.1, 4.14531)
p_7 = Punto(1.5, 6.80999)

puntos = [p_1, p_2, p_3, p_4, p_5, p_6, p_7]

r = diferencias_divididas(puntos, 1.3, 5, true)

