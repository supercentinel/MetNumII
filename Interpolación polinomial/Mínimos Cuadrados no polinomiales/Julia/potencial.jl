struct Punto
    x::Float64
    y::Float64
end

function fcnFromString(s)
    f = eval(Meta.parse("x -> " * s))
    return x -> Base.invokelatest(f, x)
end

function min_potencial(puntos::Array{Punto}, outprint::Bool)
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

    if outprint == true
        display(L)
        display(A)
        display(B)
        display(C)
        println(s)
    end

    fx = fcnFromString(s)

    return fx
end
