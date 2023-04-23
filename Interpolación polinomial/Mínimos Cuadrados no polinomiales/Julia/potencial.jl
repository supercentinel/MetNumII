using Plots

struct Punto
    x::Float64
    y::Float64
end

function fcnFromString(s)
    f = eval(Meta.parse("x -> " * s))
    return x -> Base.invokelatest(f, x)
end

function min_potencial(puntos::Array{Punto})
    #linelized table
    L = zeros(Float64, length(puntos), 4)
    A = zeros(Float64, 2, 2)
    B = zeros(Float64, 2, 1)
    C = zeros(Float64, 2, 1)

    for i ∈ axes(L, 1)
        L[i,1] = log(puntos[i].x)
        A[1,1] += L[i,1]
        L[i,2] = log(puntos[i].y)
        B[1] += L[i,2]
        L[i,3] = L[i, 1]^2
        A[2, 1] += L[i,3]
        L[i,4] = L[i, 1] * L[i,2]
        B[2] += L[i,4]
    end

    A[2,2] = A[1,1]
    A[1,2] = length(puntos)

    C = inv(A) * B

    s = string(exp(C[2]), " * x^", C[1])

    fx = fcnFromString(s)

    return fx
end

p_1 = Punto(30.0, 3.38)
p_2 = Punto(35.5, 4.17)
p_3 = Punto(50.5, 4.97)
p_4 = Punto(75.0, 6.06)
p_5 = Punto(92.0, 6.71)
p_6 = Punto(105.0, 7.17)
p_7 = Punto(115.0, 7.51)
p_8 = Punto(130.0, 7.98)
p_9 = Punto(153.5, 8.67)
p_10 = Punto(180.0, 9.39)
p_11 = Punto(199.5, 9.89)


puntos = [p_1, p_2, p_3, p_4, p_5, p_6, p_7, p_8, p_9, p_10, p_11]

f = min_potencial(puntos)

plot(show=true, title="yes")

for punto ∈ puntos
    scatter!([punto.x], [punto.y])
end

plot!(f)
readline()
