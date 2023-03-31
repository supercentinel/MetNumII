struct Punto
    x::Float64
    y::Float64
end

function diferencias_newton(puntos::Array{Punto}, est::Float64, grado::Int64)
    dif_tab = zeros(Float64, length(puntos), length(puntos)+1)
    estimacion::Float64 = 0.0
    h::Float64 = puntos[2].x - puntos[1].x
    h = abs(round(h,digits=5))
    s = ((est - puntos[1].x)/(h))
    s = round(s, digits=5)
    ∏s::Float64 = 1.0
    ∑p::Float64 = 0.0

     for i ∈ axes(dif_tab,1)
        dif_tab[i,1] = puntos[i].x
        dif_tab[i, 2] = puntos[i].y
    end

    for i ∈ axes(dif_tab,2)[(begin+2):end]
        for j ∈ axes(dif_tab, 1)[begin:(end-i+2)]
            dif_tab[j,i] = (dif_tab[j+1, i-1] - dif_tab[j, i-1])
        end
    end
    
    display(dif_tab)

    for i ∈ 1:grado+1
        ∏s = s
        print("s")
        for j ∈ 1:grado-i
            ∏s *= (s - j)
            print("(s-", j, ")") 
        end
        print(" * ")
        if i != grado+1
            ∑p += round(∏s, digits=6) * ((round(dif_tab[1, grado-i+3], digits=6))/(factorial(grado-i+1)))
            print(dif_tab[1, grado-i+3], "/ ", grado-i+1, "! + ")
        else
            print(dif_tab[1, grado-i+3])
            ∑p += round(dif_tab[1, grado-i+3], digits=6)
        end
        
    end
    
    estimacion = ∑p

    return estimacion
end
