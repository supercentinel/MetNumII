struct Punto
    x::Float64
    y::Float64
end

function diferencias_divididas(puntos::Array{Punto}, est::Float64, grado::Int64, outprint::Bool)
    dif_div = zeros(Float64, length(puntos), length(puntos)+1)
    estimacion::Float64 = 0.0
    ∏c::Float64 = 1.0

    for i ∈ axes(dif_div,1)
        dif_div[i,1] = puntos[i].x
        dif_div[i, 2] = puntos[i].y
    end

    for i ∈ axes(dif_div,2)[(begin+2):end]
        for j ∈ axes(dif_div, 1)[begin:(end-i+2)]
            dif_div[j,i] = (dif_div[j+1, i-1] - dif_div[j, i-1])/(dif_div[j+1+i-3, 1] - dif_div[j,1])
        end
    end

    if outprint == true
        println("Tabla de diferencias divididas:")
        display(dif_div)
        println("polinomio de diferencias divididas. P_", grado, "[x] = ");
    end

    for i ∈ 1:grado+1
        ∏c = 1.0
        for j ∈ 1:grado-i+1
            ∏c *= (est - dif_div[j,1])
            if outprint == true
                print("(x" ," - ",dif_div[j,1],")")
            end
        end

        estimacion += dif_div[1, grado-i+3] * ∏c

        if outprint == true
            if i ≠ grado+1
                println("* ", dif_div[1,grado-i+3], " + ")
            else
                println(dif_div[1,grado-i+3])
            end
        end
    end
    return estimacion
end
