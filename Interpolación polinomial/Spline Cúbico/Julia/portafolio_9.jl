using Plots

include("Spline_c.jl")

p_0 = Punto(3.08, 0.36)
p_1 = Punto(2.58, 2.12)
p_2 = Punto(0.92, 2.38)
p_3 = Punto(1.86, 3.24)
p_4 = Punto(2.76, 3.04)
p_5 = Punto(3.0, 3.72)
p_6 = Punto(4.0, 4.0)
p_7 = Punto(4.02, 2.46)
p_8 = Punto(3.56, 1.58)
p_9 = Punto(4.98, 1.5)
p_10 = Punto(6.94, 3.3)
p_11 = Punto(9.02, 3.74)
p_12 = Punto(10.22, 2.96)
p_13 = Punto(9.98, 0.62)
p_14 = Punto(8.98, 0.66)
p_15 = Punto(8.1, 0.46)
p_16 = Punto(7.62, 0.78)

puntos = [p_0, p_1, p_2, p_3, p_4, p_5, p_6, p_7,
          p_8, p_9, p_10, p_11, p_12, p_13, p_14, p_15, p_16]

g = Array{Function}(undef, length(puntos)-1)
labels = Array{String}(undef, length(puntos)-1)

g = Spline_C(puntos, false)

for i ∈ axes(labels, 1)
    labels[i] = @sprintf("g_%d(x)", i-1)
end

plot(xlabel="x", ylabel="y", title="polynomials", label=labels)

for i ∈ axes(g, 1)[begin:end]
    x_a = range(puntos[i].x, puntos[i+1].x, length=100)
    plot!(x_a, g[i], label=labels[i])
end

savefig("polynomials.png")
