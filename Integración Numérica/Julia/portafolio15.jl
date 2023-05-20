include("simpson_13.jl")
include("simpson_38.jl")
include("trapecio.jl")

function f(x::Float64)
    return (4 * x * log(x)) + ((cos(x-3))/(√(1 + x^2)))
end

puntos_12 = Array{Punto}(undef, 13)
puntos_24 = Array{Punto}(undef, 25)

x = 0.2
h_12 = 0.2
h_24 = 0.1

for i ∈ axes(puntos_12, 1)
    puntos_12[i] = Punto(x, f(x))
    global x += h_12
end

x = 0.2

for i ∈ axes(puntos_24, 1)
    puntos_24[i] = Punto(x, f(x))
    global x += h_24
end

est_t12 = trapecio(puntos_12, false)
est_t24 = trapecio(puntos_24, false)

est_13_12 = simpson_13(puntos_12, false)
est_13_24 = simpson_13(puntos_24, false)

est_38_12 = simpson_38(puntos_12, false)
est_38_24 = simpson_38(puntos_24, false)

println("Regla del trapecio")
println("12 intervalos: ", est_t12)
println("24 intervalos: ", est_t24)

println("Simpson 1/3")
println("12 intervalos: ", est_13_12)
println("24 intervalos: ", est_13_24)

println("Simpson 3/8")
println("12 intervalos: ", est_38_12)
println("24 intervalos: ", est_38_24)
