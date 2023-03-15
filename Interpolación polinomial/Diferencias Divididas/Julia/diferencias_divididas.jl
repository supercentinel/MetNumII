struct Punto
    x::Float64
    y::Float64
end

function diferecias_divididas(puntos::Array{Punto}, est::Float64, grado::Int64)
    dif_div = zeros(Float64, length(puntos), length(puntos)+1)
    estimacion::Float64 = 0.0
    ∏c::Float64 = 1.0

    for i ∈ 1:size(dif_div, 1)
        dif_div[i,1] = puntos[i].x
        dif_div[i, 2] = puntos[i].y
    end

    for i ∈ 3:size(dif_div, 2)
        for j ∈ 1:size(dif_div, 1)-i+2
            dif_div[j,i] = (dif_div[j+1, i-1] - dif_div[j, i-1])/(dif_div[j+1+i-3, 1] - dif_div[j,1])
        end
    end

    for i ∈ 1:grado+1
        ∏c = 1.0
        for j ∈ 1:grado-i+1
            ∏c *= (est - dif_div[j,1])
            println("(", est," - ",dif_div[j,1],")")
        end

        estimacion += dif_div[1, grado-i+3] * ∏c
        println(dif_div[1,grado-i+3], " * ", ∏c, " = ", dif_div[1,grado-i+3]*∏c)
    end
    #display(dif_div)
    return estimacion
end

function main()
    p_1 = Punto(1.0, 475.0)
    p_2 = Punto(2.0, 532.0)
    p_3 = Punto(3.0, 495.0)
    p_4 = Punto(4.0, 437.0)
    p_5 = Punto(5.0, 522.0)
    #p_6 = Punto(6.0, 121.0)
    #p_7 = Punto(7.0, 108.0)
    p_7 = Punto(8.0, 829.0)
    p_8 = Punto(9.0, 573.0)
    p_9 = Punto(10.0, 648.0)


    puntos = [p_1, p_2, p_3, p_4, p_5, p_7, p_8, p_9]

    r = diferecias_divididas(puntos, 7.0, 7)
    println(r)
end

main()
