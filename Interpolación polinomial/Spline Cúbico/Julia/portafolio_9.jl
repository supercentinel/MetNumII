using Plots

include("Spline_c.jl")

C = Punto(3.08, 0.36)
D = Punto(2.58, 2.12)
E = Punto(0.92, 2.38)
F = Punto(1.86, 3.24)
G = Punto(2.76, 3.04)
H = Punto(3.0, 3.72)
I = Punto(4.0, 4.0)
J = Punto(4.02, 2.46)
K = Punto(3.56, 1.58)
L = Punto(4.98, 1.5)
M = Punto(6.94, 3.3)
N = Punto(9.02, 3.74)
O = Punto(10.22, 2.96)
P = Punto(9.98, 0.62)
Q = Punto(8.98, 0.66)
R = Punto(8.1, 0.46)
S = Punto(7.62, 0.78)

puntos_a = [Punto(3.42, 2.22),K, L, M, N, O, Punto(10.52, 1.72)#=, F, G, H, I, J, K, L, M, N, O, P, Q, R, S=#]
puntos_b = [S, R, Q, P, Punto(10.52, 1.72)]
puntos_c = [E, F, G, H, I, Punto(4.41, 3.38)]
puntos_d = [Punto(3.42, 2.22), J, Punto(4.41, 3.38)]
puntos_e = [E, Punto(1.56, 1.96), D, C]

#g_a = Array{Function}(undef, length(puntos)-1)
#g_b = Array{Function}
labels = Array{String}(undef, length(puntos_a)-1)

println("Primera parte")
g = Spline_C(puntos_a, true)
println("Segunda parte")
g_2 = Spline_C(puntos_b, true)
println("Tercera parte")
g_3 = Spline_C(puntos_c, true)
println("Cuarta parte")
g_4 = Spline_C(puntos_d, true)
println("Quinta parte")
g_5 = Spline_C(puntos_e, true)

for i ∈ axes(labels, 1)
    labels[i] = @sprintf("g_%d(x)", i-1)
end

plot(xlabel="x", ylabel="y", title="polynomials", label=labels, show=true)

for i ∈ axes(g, 1)[begin:end]
    x_a = range(puntos_a[i].x, puntos_a[i+1].x, length=100)
    plot!(x_a, g[i], label="")
end

for i ∈ axes(g_2, 1)[begin:end]
     x_a = range(puntos_b[i].x, puntos_b[i+1].x, length=100)
     plot!(x_a, g_2[i], label="")
end

for i ∈ axes(g_3, 1)[begin:end]
     x_a = range(puntos_c[i].x, puntos_c[i+1].x, length=100)
     plot!(x_a, g_3[i], label="")
end

for i ∈ axes(g_4, 1)
     x_a = range(puntos_d[i].x, puntos_d[i+1].x, length=100)
     plot!(x_a, g_4[i], label="")
end

for i ∈ axes(g_4, 1)
     x_a = range(puntos_e[i].x, puntos_e[i+1].x, length=100)
     plot!(x_a, g_5[i], label="")
end

readline()
savefig("polynomials.png")
