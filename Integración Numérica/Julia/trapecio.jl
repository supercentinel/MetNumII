struct Punto
    x::Float64
    y::Float64
end

function trapecio(puntos::Array{Punto}, outprint::Bool)
    ∑f_i::Float64 = 0.0
    h::Float64 = puntos[2].x - puntos[1].x

    for i ∈ axes(puntos, 1)[begin+1:end-1]
        ∑f_i += puntos[i].y
    end

    if outprint == true
        println(h/2, " * ", puntos[1].y, " + ", puntos[length(puntos)].y, " + ", ∑f_i)
    end

    return (h/2) * (puntos[1].y + puntos[length(puntos)].y + (2 * ∑f_i))
end
