include("ddiff_finitas.jl")

function f(x::Float64)
    return cbrt((x^2 + 4)/(x^2 - 4))
end

puntos = Array{Punto}(undef, 11)
x::Float64 = 2.5
h::Float64 = 0.1

for i ∈ axes(puntos, 1)
    puntos[i] = Punto(x, f(x))
    global x += h
end

display(puntos)

a = ddiff_finitas(puntos)

display(a)
