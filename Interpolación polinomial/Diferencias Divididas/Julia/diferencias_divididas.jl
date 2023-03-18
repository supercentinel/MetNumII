struct Punto
    x::Float64
    y::Float64
end

function diferecias_divididas(puntos::Array{Punto}, est::Float64, grado::Int64)
    dif_div = zeros(Float64, length(puntos), length(puntos)+1)
    estimacion::Float64 = 0.0
    ∏c::Float64 = 1.0

    for i ∈ axes(dif_div,1)
        dif_div[i,1] = puntos[i].x
        dif_div[i, 2] = puntos[i].y
    end

    for i ∈ axes(dif_div,2)[3:end]#3:size(dif_div, 2)
        for j ∈ axes(dif_div, 1)[1:end-i+2]#1:size(dif_div, 1)-i+2
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