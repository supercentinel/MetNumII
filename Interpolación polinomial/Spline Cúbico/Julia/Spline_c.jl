struct Punto
    x::Float64
    y::Float64
end

function Spline_C(puntos::Array{Punto})
    distancias = zeros(Float64, length(puntos)-1, 1)
    dif_div = zeros(Float64, length(puntos)-1, 1)
    A = zeros(Float64, length(puntos)-2, length(puntos))
    nu_A = zeros(Float64, 3, 3)
    B = zeros(Float64, length(puntos)-2, 1)
    #S = zeros(Float64, length(puntos)-2, 1)
    a = zeros(Float64, length(puntos)-1, 1)
    b = zeros(Float64, length(puntos)-1, 1)
    c = zeros(Float64, length(puntos)-1, 1)

    for i ∈ axes(distancias,1)
        distancias[i] = puntos[i+1].x - puntos[i].x
        dif_div[i] = (puntos[i+1].y - puntos[i].y)/(distancias[i])
    end

    #filling A
    for i ∈ axes(A, 1)
        k = 1
        for j ∈ axes(A, 2)[begin+i-1:length(puntos)-2+i-1]
            if k == 1
                A[i,j] = distancias[i]
            elseif k == 2
                A[i,j] = 2 * (distancias[i] + distancias[i+1])
                println(distancias[i], " + ", distancias[i+1])
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

    for i ∈ axes(nu_A, 1)
        for j ∈ axes(nu_A, 2)
            nu_A[i,j] = A[i,j+1]
        end
    end

    S = inv(nu_A) * B
    #refactor this shit
    for i ∈ axes(a, 1)
        if i == 1
            a[i] = (S[i+1] - 0)/(6 * distancias[i])
            b[i] = 0/2
            c[i] = dif_div[i+1] - (((S[i+1] + (2 * 0))/(6)) * distancias[i])
        elseif i == 4
            a[i] = (0 - S[i])/(6 * distancias[i])
            b[i] = S[i]/2
            c[i] = dif_div[i+1] - (((0 + (2 * S[i]))/(6)) * distancias[i])
        else
            a[i] = (S[i+1] - S[i])/(6 * distancias[i])
            b[i] = S[i]/2
            c[i] = dif_div[i+1] - (((S[i+1] + (2 * S[i]))/(6)) * distancias[i])
        end
    end
    
    display(a)
end


function main()

    p_0 = Punto(0.95, -1.1)
    p_1 = Punto(1.73, 0.27)
    p_2 = Punto(2.23, -0.29)
    p_3 = Punto(2.77, 0.56)
    p_4 = Punto(2.99, 1.0)

    puntos = [p_0, p_1, p_2, p_3, p_4]

    Spline_C(puntos)

end

main()
