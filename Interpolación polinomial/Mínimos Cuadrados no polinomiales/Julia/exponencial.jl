using Plots

struct Punto
    x::Float64
    y::Float64
end

function fcnFromString(s)
    f = eval(Meta.parse("x -> " * s))
    return x -> Base.invokelatest(f, x)
end

function min_exponencial(puntos::Array{Punto}, o::Float64)
    #linelized table
    L = zeros(Float64, length(puntos), 4)
    A = zeros(Float64, 2, 2)
    B = zeros(Float64, 2, 1)
    C = zeros(Float64, 2, 1)

    for i ∈ axes(L, 1)
        L[i,1] = 1/puntos[i].x
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

    t = o * C[1]

    s = string(exp(C[2]), " * exp(", t,"/(", o, " * x))")

    println(s)

    fx = fcnFromString(s)

    return fx
end

p_1 = Punto(283.15, 0.000108)
p_2 = Punto(293.15, 0.000475)
p_3 = Punto(303.15, 0.00163)
p_4 = Punto(313.15, 0.00576)
p_5 = Punto(323.15, 0.0185)
p_6 = Punto(333.15, 0.0548)

puntos = [p_1, p_2, p_3, p_4, p_5, p_6]

f = min_exponencial(puntos, -8.31446)

plot(show=true, title="yes")

for punto ∈ puntos
    scatter!([punto.x], [punto.y])
end

plot!(f)
readline()
