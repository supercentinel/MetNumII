include("extrapolacion_romberg.jl")

function f(x::Float64)
    return π * ( 1 + (x/3.0)^2)^2
end

puntos = Array{Punto}(undef, 7)

x = 0.0
h = 0.5

for i ∈ axes(puntos, 1)
    puntos[i] = Punto(x, f(x))
    global x += h
end

est = trapecio(puntos, false)
println(est)

a = romberg(puntos, f,  4, true)

println("Extrapolacion de Romberg con 4 subparticiones: ", a)