struct Punto
    x::Float64
    y::Float64
end

function lagrange(puntos::Array{Punto}, est::Float64, grado::Int64, outprint::Bool)
    ∑ = 0.0

    if outprint == true
        if grado >= length(puntos)
            println("El grado del polinomio no puede ser igual o mayor al número de puntos")
        end
    end


    for k ∈ 1:grado+1
        ∏ = 1.0
        for j ∈ 1:grado+1
            if k ≠ j
                ∏ = ∏ * ((est - puntos[j].x)/(puntos[k].x - puntos[j].x))
                if outprint == true
                    print("[x - ", puntos[j].x, " ]/[ ", puntos[k].x, " - ", puntos[j].x, "]")
                end
            end
        end
        ∑ += ∏ * puntos[k].y
        if outprint == true
            if k == grado+1
                println(" * ", puntos[k].y)
            else
                println(" * ", puntos[k].y, " + ")
            end
        end
    end

    return ∑
end

