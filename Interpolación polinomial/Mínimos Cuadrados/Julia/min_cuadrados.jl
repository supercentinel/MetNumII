struct Punto
    x::Float64
    y::Float64
end

function min_cuadrados(puntos::Array{Punto}, grado::Int64)
    m = length(puntos)
    n = grado+1
    A = zeros(Float64, n, n)
    B = zeros(Float64, n, 1)
    C = zeros(Float64, n, 1)
    ∑x = 0.0
    ∑y = 0.0

    for i ∈ axes(A, 1)
        for j ∈ axes(A, 2)
            ∑x = 0.0
            for k ∈ 1:m
                ∑x += puntos[i].x^j+i-2
            end
            A[i,j] = ∑x
        end
    end

    display(A)
end

p_0 = Punto(-2.3, -18.7)
p_1 = Punto(-1.1, -6.5)
p_2 = Punto(0.3, -2.5)
p_3 = Punto(1.3, 1.8)
p_4 = Punto(2.2, 11.1)
p_5 = Punto(2.8, 14.6)

puntos = [p_0, p_1, p_2, p_3, p_4, p_5]

min_cuadrados(puntos, 3)

