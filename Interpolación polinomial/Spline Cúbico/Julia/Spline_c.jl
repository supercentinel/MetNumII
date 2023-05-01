using Printf

struct Punto
    x::Float64
    y::Float64
end

function fcnFromString(s)
    f = eval(Meta.parse("x -> " * s))
    return x -> Base.invokelatest(f, x)
end

function Spline_C(puntos::Array{Punto}, outprint::Bool)
    n = length(puntos)

    distancias = zeros(Float64, n-1, 1)
    dif_div = zeros(Float64, n-1, 1)
    A = zeros(Float64, n-2, n)
    nu_A = zeros(Float64, n-2, n-2)
    B = zeros(Float64, n-2, 1)
    a = zeros(Float64, n-1, 1)
    b = zeros(Float64, n-1, 1)
    c = zeros(Float64, n-1, 1)
    fn = Array{String}(undef, n-1)
    g = Array{Function}(undef, n-1)

    #filling distancias
    for i ∈ axes(distancias,1)
        distancias[i] = puntos[i+1].x - puntos[i].x
        dif_div[i] = (puntos[i+1].y - puntos[i].y)/(distancias[i])
    end

    #filling A
    for i ∈ axes(A, 1)
        k = 1
        for j ∈ axes(A, 2)[begin+i-1:end]
            if k == 1
                A[i,j] = distancias[i]
            elseif k == 2
                A[i,j] = 2 * (distancias[i] + distancias[i+1])
            elseif k == 3
                A[i,j] = distancias[i+1]
            end
            k += 1
        end
    end

    #filling B
    for i ∈ axes(B,1)
        B[i] = 6 * (dif_div[i+1] - dif_div[i])
    end

    #trimming to make a square matrix
    for i ∈ axes(nu_A, 1)
        for j ∈ axes(nu_A, 2)
            nu_A[i,j] = A[i,j+1]
        end
    end

    S = inv(nu_A) * B
    if outprint == true
        println("S")
        display(S)
    end

    #definitely, it works
    for i ∈ axes(a, 1)
        if i == 1
            a[i] = (S[i] - 0)/(6 * distancias[i])
            b[i] = 0/2
            c[i] = dif_div[i] - (((S[i] + (2 * 0))/(6)) * distancias[i])
        elseif i == length(a)
            a[i] = (0 - S[i-1])/(6 * distancias[i])
            b[i] = S[i-1]/2
            c[i] = dif_div[i] - (((0 + (2 * S[i-1]))/(6)) * distancias[i])
        else
            a[i] = (S[i] - S[i-1])/(6 * distancias[i])
            b[i] = S[i-1]/2
            c[i] = dif_div[i] - (((S[i] + (2 * S[i-1]))/(6)) * distancias[i])
        end
    end

    #printing the polynomials
    for i ∈ axes(a, 1)
            if outprint == true
            println(a[i], "(x - ", puntos[i].x, ")^3 + ",
                    b[i], "(x - ", puntos[i].x, ")^2 + ",
                    c[i] ,"(x - ", puntos[i].x, ")  + ",
                    puntos[i].y,", (",
                    puntos[i].x," ≤ x ≤ ", puntos[i+1].x,")")
            end
        fn[i] = @sprintf("%LF * (x - %LF)^3 + %LF * (x - %LF)^2 + %LF * (x - %LF) + %LF", a[i], puntos[i].x, b[i], puntos[i].x, c[i], puntos[i].x, puntos[i].y)
        g[i] = fcnFromString(fn[i])
    end

    return g
end
