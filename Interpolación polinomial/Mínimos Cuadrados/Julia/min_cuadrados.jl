struct Punto
    x::Float64
    y::Float64
end

function min_cuadrados(puntos::Array{Puntos})
    m = length(puntos)
    A = zeros(Float64, 2, 2)
    B = zeros(Float64, 2, 1)
    C = zeros(Float64, 2, 1)
    ∑x = 0.0
    ∑x2 = 0.0
    ∑y = 0.0
    ∑xy = 0.0

    A[1,1] = m

    for i ∈ axes(puntos, 1)
        ∑x += puntos[i].x
        ∑x2 += puntos[i].x^2
        ∑y += puntos[i].y
        ∑xy += puntos[i].x * puntos[i].y
    end

    A[2,1] = ∑x
    A[1,2] = ∑x
    A[2,2] = ∑x2

    B[1] = ∑y
    B[2] = ∑xy

    C = A * B

    ∑x = 0.0

    display(C)
end
