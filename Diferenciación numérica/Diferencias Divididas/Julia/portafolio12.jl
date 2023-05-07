include("ddiff_div.jl")

function f(x::Float64)::Float64
    return (2 * x^2 - 1) * ((cos(4 * x))/(x))
end

puntos = Array{Punto}(undef, 6)

puntos[1] = Punto(0.5, f(0.5))
puntos[2] = Punto(1.2, f(1.2))
puntos[3] = Punto(2.5, f(2.5))
puntos[4] = Punto(3.0, f(3.0))
puntos[5] = Punto(3.4, f(3.4))
puntos[6] = Punto(4.6, f(4.6))

estimaciones = []

x = 1.0

for i ∈ 2:5
    push!(estimaciones, diff_divididas(puntos, i, x, true))
end

errs = Array{Float64}(undef, length(estimaciones)-1)

for i ∈ axes(errs, 1)
    errs[i] = estimaciones[i+1] - estimaciones[i]
end

display(puntos)
display(estimaciones)
display(errs)
