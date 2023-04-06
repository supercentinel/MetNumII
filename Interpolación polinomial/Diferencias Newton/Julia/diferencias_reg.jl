struct Punto
    x::Float64
    y::Float64
end

function diferencias_newton_reg(puntos::Array{Punto}, est::Float64, grado::Int64, outprint::Bool)
    dif_tab = zeros(Float64, length(puntos), length(puntos)+1)
    estimacion::Float64 = 0.0
    h::Float64 = puntos[2].x - puntos[1].x
    h = abs(round(h,digits=5))
    s = ((est - puntos[length(puntos)].x)/(h))
    s = round(s, digits=5)
    ∏s::Float64 = 1.0
    ∑p::Float64 = 0.0

     for i ∈ axes(dif_tab,1)
        dif_tab[i,1] = puntos[i].x
        dif_tab[i, 2] = puntos[i].y
    end

    for i ∈ axes(dif_tab,2)[(begin+2):end]
        for j ∈ axes(dif_tab, 1)[begin:(end-i+2)]
            dif_tab[j,i] = round(dif_tab[j+1, i-1] - dif_tab[j, i-1], digits=6)
        end
    end

    if outprint == true
        println("tabla de diferecias")
        display(dif_tab)
        println("polinomio de diferencias newton")
    end

    for i ∈ 1:grado+1
        ∏s = s
        if i ≠ grado+1
            if outprint == true
                print("s")
            end
        end

        for j ∈ 1:grado-i
            ∏s *= (s + j)
            if outprint == true
                print("(s+", j, ")")
            end
        end

        if outprint == true
            if i ≠ grado+1
                print(" * ")
            end
        end

        if i ≠ grado+1
        if outprint == true
            println(dif_tab[size(dif_tab, 1)-grado+i-1, grado-i+3], "/ ", grado-i+1, "! + ")
        end

            ∑p += round(∏s, digits=6) * ((round(dif_tab[size(dif_tab, 1)-grado+i-1, grado-i+3], digits=6))/(factorial(grado-i+1)))
        else
            if outprint == true
                println(dif_tab[size(dif_tab, 1)-grado+i-1, grado-i+3])
            end
            ∑p += round(dif_tab[size(dif_tab, 1)-grado+i-1, grado-i+3], digits=6)
        end
    end
    estimacion = ∑p

    return estimacion
end

