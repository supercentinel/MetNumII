include("ddiff_finitas.jl")

function f(x::Float64)
    return ((4 * x) * log(x)) + ((cos(x - 3)) / (√(1 + x^2)))
end

puntos_1 = Array{Punto}(undef, 19)
x::Float64 = 0.5
h::Float64 = 0.1

for i ∈ axes(puntos_1, 1)
    puntos_1[i] = Punto(x, f(x))
    global x += h
end

puntos_2 = Array{Punto}(undef, 37)
x::Float64 = 0.5
h::Float64 = 0.05

for i ∈ axes(puntos_2, 1)
    puntos_2[i] = Punto(x, f(x))
    global x += h
end

puntos_3 = Array{Punto}(undef, 73)
x::Float64 = 0.5
h::Float64 = 0.025

for i ∈ axes(puntos_3, 1)
    puntos_3[i] = Punto(x, f(x))
    global x += h
end

dpuntos_1 = ddiff_finitas(puntos_1)
dpuntos_2 = ddiff_finitas(puntos_2)
dpuntos_3 = ddiff_finitas(puntos_3)

println("h = 0.1")
println("f(x)")
display(puntos_1)
println("f'(x)")
display(dpuntos_1)

println("h = 0.05")
println("f(x)")
display(puntos_2)
println("f'(x)")
display(dpuntos_2)

println("h = 0.0.25")
println("f(x)")
display(puntos_3)
println("f'(x)")
display(dpuntos_3)

function dfx(x::Float64)
    return (4 * log(x)) + (((-x * cos(3-x))+((1 + x^2) * (sin(3-x))))/((1+x^2)^(3/2)))
end

println("derivada analítica")

i = 0.6

while i < 2.3
    println(i, ", ", dfx(i))
    global i += 0.1
end
