using Plots

include("exponencial.jl")

p_1 = Punto(283.15, 0.000108)
p_2 = Punto(293.15, 0.000475)
p_3 = Punto(303.15, 0.00163)
p_4 = Punto(313.15, 0.00576)
p_5 = Punto(323.15, 0.0185)
p_6 = Punto(333.15, 0.0548)

puntos = [p_1, p_2, p_3, p_4, p_5, p_6]

f = min_exponencial(puntos, -8.31446, false)

plot(show=true, title="yes")

for punto ∈ puntos
    scatter!([punto.x], [punto.y])
end

plot!(f)
readline()
