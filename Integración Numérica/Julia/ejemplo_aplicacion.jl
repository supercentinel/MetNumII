include("simpson_13.jl")
include("simpson_38.jl")
include("trapecio.jl")

function f(x::Float64)::Float64
    return π * ((1 + ((x/2)^2))^2)
end

puntos = Array{Punto}(undef, 101)
x::Float64 = 0.0
h = 0.03

for i ∈ axes(puntos, 1)
    puntos[i] = Punto(x, f(x))
    global x += h
end



est_s13 = simpson_13(puntos, false)

println(est_s13)


