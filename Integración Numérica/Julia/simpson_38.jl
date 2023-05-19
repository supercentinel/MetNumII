struct Punto
    x::Float64
    y::Float64
end

function simpson_38(puntos::Array{Punto}, outprint::Bool)::Float64
    h::Float64 = puntos[2].x - puntos[1].x
    n = length(puntos)-1
    ∑s::Float64 = 0.0

    for i ∈ axes(puntos, 1)[begin+1:end-1]
        ri = i-1

        if ri % 3 == 0
            ∑s += 2.0 * puntos[i].y
        else
            ∑s += 3.0 * puntos[i].y
        end

    end

    return ((3 * h)/8) * (puntos[1].y + puntos[n+1].y + ∑s)
end
