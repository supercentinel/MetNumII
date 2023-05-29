include("simpson_13.jl")
include("simpson_38.jl")
include("trapecio.jl")
include("extrapolacion_romberg.jl")

function f(x::Float64)::Float64
    return ((x^2 + sin(x))/(x-2)) + (3)
end

puntos_1 = Array{Punto}(undef, 11)

x::Float64 = -4.0
h::Float64 = 0.5

for i ∈ axes(puntos_1, 1)
    puntos_1[i] = Punto(x, f(x))
    global x += h
end

extrapolacion_p_1 = romberg(puntos_1, f, 5, true)

println("Extrapolacion de romberg:")
println(extrapolacion_p_1)
println()

#Fin segunda parte

puntos_2 = Array{Punto}(undef, 14)

puntos_2[1] = Punto(-3.0, 2.408)
puntos_2[2] = Punto(-2.8, 2.172)
puntos_2[3] = Punto(-2.6, 1.979)
puntos_2[4] = Punto(-2.4, 1.822)
puntos_2[5] = Punto(-2.2, 1.697)
puntos_2[6] = Punto(-2.0, 1.599)
puntos_2[7] = Punto(-1.8, 1.527)
puntos_2[8] = Punto(-1.6, 1.478)
puntos_2[9] = Punto(-1.4, 1.452)
puntos_2[10] = Punto(-1.2, 1.448)
puntos_2[11] = Punto(-1.0, 1.468)
puntos_2[12] = Punto(-0.8, 1.512)
puntos_2[13] = Punto(-0.6, 1.584)
puntos_2[14] = Punto(-0.4, 1.686)

est_trap = trapecio(puntos_2, false)

puntos_2_1 = [puntos_2[1], puntos_2[2], puntos_2[3], puntos_2[4], puntos_2[5], puntos_2[6], puntos_2[7], puntos_2[8], puntos_2[9], puntos_2[10], puntos_2[11]]

puntos_2_2 = [puntos_2[11], puntos_2[12], puntos_2[13], puntos_2[14]]

est_sim_13 = simpson_13(puntos_2_1, false)
est_sim_38 = simpson_38(puntos_2_2, false)

println("estimación con regla del trapecio = ", est_trap)
println("estimación con regla de simspson 1/3 + simpson 3/8  = ", est_sim_13, " + ", est_sim_38, " = ", est_sim_13 + est_sim_38)

