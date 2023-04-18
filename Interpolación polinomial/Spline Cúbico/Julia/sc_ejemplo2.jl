using Plots

include("Spline_c.jl")

p_0 = Punto(1.24,4.17)
p_1 = Punto(2.04,3.73)
p_2 = Punto(3.67,3.56)
p_3 = Punto(4.59,2.37)
p_4 = Punto(6.00,1.3)
p_5 = Punto(7.28,0.48)
p_6 = Punto(10.04,0.94)

puntos = [p_0, p_1, p_2, p_3, p_4, p_5, p_6]

g = Array{Function}(undef, length(puntos)-1)
labels = Array{String}(undef, length(puntos)-1)

g = Spline_C(puntos, true)

for i ∈ axes(labels, 1)
    labels[i] = @sprintf("g_%d(x)", i-1)
end

plot(xlabel="x", ylabel="y", title="polynomials", label=labels, show=true)

for i ∈ axes(g, 1)[begin:end]
    x_a = range(puntos[i].x, puntos[i+1].x, length=100)
    plot!(x_a, g[i], label=labels[i])
end

readline()
savefig("polynomials.png")
