struct Punto
    x::Float64
    y::Float64
end

function simpson_13(puntos::Array{Punto}, a::Float64, b::Float64)::Float64
    ∑s::Float64 = 0.0
    i::Int64 = 1
    n = length(puntos)
    h = puntos[2].x - puntos[1].x

    while i ≠ n-2
        ∑s += ((4 * puntos[i].y) + (2 * puntos[i+1].y))
        i += 2
    end

    return  h/3 * puntos[1].y + puntos[length(puntos)].y + ∑s
end

function f(x::Float64)
    return (5 * cos(x^3/2) + x^3 + log(x^2+1))
end

puntos = Array{Punto}(undef, 25)

puntos[1] = Punto(-1.0, f(-1.0))

for i ∈ 2:length(puntos)
    x = puntos[i-1].x + 0.125
    puntos[i]= Punto(x, f(x))
end

display(puntos)

result = simpson_13(puntos, 0.0, 0.0)
println("resultado = ", result)
