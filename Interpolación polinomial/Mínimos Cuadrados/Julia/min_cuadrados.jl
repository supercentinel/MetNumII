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
    n = 0

    #filling A
    for i ∈ axes(A, 1)
        for j ∈ axes(A, 2)
            ∑x = 0.0
            for k ∈ 1:m
                n = j+i-2
                ∑x += (puntos[k].x)^n
            end
            A[i,j] = ∑x
        end
    end

    #Filling B
    for i ∈ axes(B, 1)
        n = i-1
        ∑y = 0.0
        for k ∈ 1:m
            ∑y += puntos[k].y * puntos[k].x^n
        end
        B[i] = ∑y
    end

    #Solving C
    C = inv(A) * B

    #print polynomial
    for i ∈ axes(C, 1)
        if i == 1
            print(C[i]," + ")
            continue
        end
        if i ≠ length(C)
            print(C[i], " * x^", i-1, " + ")
        else
            println(C[i], " * x^", i-1)
        end
    end
end

p_0 = Punto(-2.3, -18.7)
p_1 = Punto(-1.1, -6.5)
p_2 = Punto(0.3, -2.5)
p_3 = Punto(1.3, 1.8)
p_4 = Punto(2.2, 11.1)
p_5 = Punto(2.8, 14.6)

puntos = [p_0, p_1, p_2, p_3, p_4, p_5]

min_cuadrados(puntos, 3)

