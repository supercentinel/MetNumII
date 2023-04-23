using Plots
include("potencial.jl")

p_1 = Punto(30.0, 3.38)
p_2 = Punto(35.5, 4.17)
p_3 = Punto(50.5, 4.97)
p_4 = Punto(75.0, 6.06)
p_5 = Punto(92.0, 6.71)
p_6 = Punto(105.0, 7.17)
p_7 = Punto(115.0, 7.51)
p_8 = Punto(130.0, 7.98)
p_9 = Punto(153.5, 8.67)
p_10 = Punto(180.0, 9.39)
p_11 = Punto(199.5, 9.89)


puntos = [p_1, p_2, p_3, p_4, p_5, p_6, p_7, p_8, p_9, p_10, p_11]

f = min_potencial(puntos, false)

plot(show=true, title="yes")

for punto ∈ puntos
    scatter!([punto.x], [punto.y])
end

plot!(f)
readline()


