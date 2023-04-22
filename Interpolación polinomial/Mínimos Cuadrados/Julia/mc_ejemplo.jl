using Plots
include("min_cuadrados.jl")

p_0 = Punto(-2.3, -18.7)
p_1 = Punto(-1.1, -6.5)
p_2 = Punto(0.3, -2.5)
p_3 = Punto(1.3, 1.8)
p_4 = Punto(2.2, 11.1)
p_5 = Punto(2.8, 14.6)

puntos = [p_0, p_1, p_2, p_3, p_4, p_5]

f_3 = min_cuadrados(puntos, 3, false)
f_2 = min_cuadrados(puntos, 2, false)
f_1 = min_cuadrados(puntos, 1, false)

r = range(-3, 3, length=100)

plot( title="Mínimos cuadrados", show=true)

plot!(r, f_3)
plot!(r, f_2)
plot!(r, f_1)

readline()
