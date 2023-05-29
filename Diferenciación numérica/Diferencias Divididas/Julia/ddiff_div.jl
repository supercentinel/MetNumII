struct Punto
    x::Float64
    y::Float64
end

function diff_divididas(puntos::Array{Punto}, grado::Int64, x::Float64, outprint::Bool)::Float64
   dif_div = zeros(Float64, length(puntos), length(puntos)+1)
    estimacion::Float64 = 0.0
    ∑s::Float64 = 0.0
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

    for k ∈ 1:grado
        #prints the difs
        if outprint == true
            if k == 1
                print(dif_div[1, k+2])
            else
                print(dif_div[1, k+2], " * ")
            end
        end
        ∑s = 0.0
        if outprint == true
            print("[")
        end
        for i ∈ 1:k
            ∏c = 1.0
            for j ∈ 1:k
                if i ≠ j
                    if outprint == true
                        print("(x - ", puntos[j].x,")")
                    end
                    ∏c *= x - puntos[j].x
                end
            end
            ∑s += ∏c
            if i ≠ k
                if outprint == true
                    print(" + ")
                end
            end
        end

        if outprint == true
            print("]")
        end

        if outprint == true
            if k ≠ grado
                println(" + ")
            else
                println()
            end
        end
        if k > 1
            estimacion += dif_div[1, k+2] * ∑s
        else
            estimacion += dif_div[1, k+2]
        end
    end

    return estimacion
end
