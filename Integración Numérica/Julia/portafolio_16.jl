include("extrapolacion_romberg.jl")

function f(x::Float64)
    return (x^5) * ((sqrt(3 + (2 * x^2)))/(4))
end

puntos = Array{Punto}(undef, 16)

x = 0.5
h = 0.1

for i ∈ axes(puntos, 1)
    puntos[i] = Punto(x, f(x))
    global x += h
end

display(puntos)

est = trapecio(puntos, false)
println(est)

a = romberg(puntos, f,  5, true)

d = trapecio(puntos, false)

println("trapecio n=15: ", d)

println("Extrapolacion de Romberg con 3 subparticiones: ", a)
