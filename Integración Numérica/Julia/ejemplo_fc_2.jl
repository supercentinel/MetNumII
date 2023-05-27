include("simpson_13.jl")
include("simpson_38.jl")
include("trapecio.jl")

function f(x::Float64)
    return (x^(3/2))+(2/x)
end

puntos = Array{Punto}(undef, 16)
x = 1.0

h = 0.2

for i ∈ axes(puntos, 1)
    puntos[i] = Punto(x, f(x))
    global x += h
end


display(puntos)

est_t = trapecio(puntos, false)

println()
println(est_t)

pp_13 = Array{Punto}(undef, 15)

for i ∈ axes(pp_13, 1)
    pp_13[i] = Punto(puntos[i].x, puntos[i].y)
end

pp_t = Array{Punto}(undef, 2)

pp_t[1] = Punto(puntos[15].x, puntos[15].x)
pp_t[2] = Punto(puntos[16].x, puntos[16].y)

est_p13 = simpson_13(pp_13, false)
est_pt = trapecio(pp_t, false)

est_t13 = est_p13 + est_pt

println("trapecio: ", est_pt, " + simspon 1/3: ", est_p13," = ", est_t13)

display(pp_t)

pp_132 = Array{Punto}(undef, 13)

for i ∈ axes(pp_132, 1)
    pp_132[i] = Punto(puntos[i].x, puntos[i].y)
end

pp_38 = Array{Punto}(undef, 4)

pp_38[1] = Punto(puntos[13].x, puntos[13].y)
pp_38[2] = Punto(puntos[14].x, puntos[14].y)
pp_38[3] = Punto(puntos[15].x, puntos[15].y)
pp_38[4] = Punto(puntos[16].x, puntos[16].y)

est_132 = simpson_13(pp_132, false)
est_38 = simpson_38(pp_38, false)

est_1338 = est_132 + est_38

println("1/3 + 3/8 = ", est_1338)





