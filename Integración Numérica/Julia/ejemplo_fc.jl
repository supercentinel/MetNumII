include("simpson_13.jl")
include("simpson_38.jl")
include("trapecio.jl")

function f(x::Float64)::Float64
    return (5 * cos( x^3 / 2 )) + (x^3) + log(x^2 + 1)
end

puntos = Array{Punto}(undef, 25)
x::Float64 = -1.0
h = 0.125

for i ∈ axes(puntos, 1)
    puntos[i] = Punto(x, f(x))
    global x += h
end

println(x)

display(puntos)

est_t = trapecio(puntos, false)
est_s13 = simpson_13(puntos, false)
est_s38 = simpson_38(puntos, false)

println("Trapecio = ", est_t)
println("Simpson 1/3 = ", est_s13)
println("Simpson 3/8 = ", est_s38)

