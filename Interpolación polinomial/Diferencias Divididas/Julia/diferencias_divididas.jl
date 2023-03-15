struct Punto
    x::Float64
    y::Float64
end

function diferecias_divididas(puntos::Array{Punto}, est::Float64)
    dif_div = zeros(Float64, length(puntos), length(puntos)+1)

    for i ∈ 1:size(dif_div, 1)
        dif_div[i,1] = puntos[i].x
        dif_div[i, 2] = puntos[i].y
    end

    for i ∈ 3:size(dif_div, 2)
        for j ∈ 1:size(dif_div, 1)-i+2
            dif_div[j,i] = (dif_div[j+1, i-1] - dif_div[j, i-1])/(dif_div[j+1+i-3, 1] - dif_div[j,1])
        end
    end

    display(dif_div)
end

function main()
    p_1 = Punto(1.73, 8.1)
    p_2 = Punto(1.82, 8.3)
    p_3 = Punto(2.61, 7.8)
    p_4 = Punto(5.22, 2.4)
    p_5 = Punto(8.26, -1.7)

    puntos = [p_1, p_2, p_3, p_4, p_5]

    diferecias_divididas(puntos, 2.5)
end

main()
