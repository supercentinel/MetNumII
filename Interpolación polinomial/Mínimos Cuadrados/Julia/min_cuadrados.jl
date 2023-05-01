struct Punto
    x::Float64
    y::Float64
end

function fcnFromString(s)
    f = eval(Meta.parse("x -> " * s))
    return x -> Base.invokelatest(f, x)
end

function min_cuadrados(puntos::Array{Punto}, grado::Int64, outprint::Bool)
    m = length(puntos)
    n = grado+1
    A = zeros(Float64, n, n)
    B = zeros(Float64, n, 1)
    C = zeros(Float64, n, 1)
    ∑x = 0.0
    ∑y = 0.0
    n = 0
    g = ""

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

    if outprint == true
        display(A)
        display(B)
        display(C)
    end

    #print polynomial
    for i ∈ axes(C, 1)
        if i == 1
            if outprint == true
                print(C[i]," + ")
            end
            g = string(g, C[i], " + ")
            continue
        end
        if i ≠ length(C)
            if outprint == true
                print(C[i], " * x^", i-1, " + ")
            end
            g = string(g, C[i], " * x^", i-1, " + ")
        else
            if outprint == true
                println(C[i], " * x^", i-1)
            end
            g = string(g, C[i], " * x^", i-1)
        end
    end

    fx = fcnFromString(g)

    return fx
end
