include("extrapolacion_romberg.jl")

function f(x::Float64)
    return x^4 - (5 * x^3) + (5 * x^2) + (5 * x) - 6
end

puntos = Array{Punto}(undef, 31)

x = -1.0
h = 0.1

for i ∈ axes(puntos, 1)
    x = round(x, digits=12)
    puntos[i] = Punto(x, f(x))
    global x += h
end

display(puntos)

println("extrapolacion romberg:")

a = romberg(puntos, f, 10, true)
println("extraspolacion romberg: = ",a)

