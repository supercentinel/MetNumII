using Plots

include("Spline_c.jl")

p_0 = Punto(0.95, -1.1)
p_1 = Punto(1.73, 0.27)
p_2 = Punto(2.23, -0.29)
p_3 = Punto(2.77, 0.56)
p_4 = Punto(2.99, 1.0)
#p_5 = Punto(3.33, 0.7)

puntos = [p_0, p_1, p_2, p_3, p_4]

g = Array{Function}(undef, length(puntos)-1)
labels = Array{String}(undef, length(puntos)-1)

g = Spline_C(puntos, true)

for i ∈ axes(labels, 1)
    labels[i] = @sprintf("g_%d(x)", i-1)
end

plot(xlabel="x", ylabel="y", title="polynomials", label=labels)

for i ∈ axes(g, 1)[begin:end]
    x_a = range(puntos[i].x, puntos[i+1].x, length=100)
    plot!(x_a, g[i], label=labels[i])
end

savefig("polynomials.png")
