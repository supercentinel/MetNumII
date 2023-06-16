include("diferencias_prog.jl")

p_1 = Punto(0.5, 2.34)
p_2 = Punto(1.0, 2.85)
p_3 = Punto(1.5, 3.21)
p_4 = Punto(2.0, 3.19)
p_5 = Punto(2.5, 3.02)
p_6 = Punto(3.0, 2.83)

puntos = [p_1, p_2, p_3, p_4, p_5, p_6]

r = diferencias_newton_prog(puntos, 1.3, 5, true)
