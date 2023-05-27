struct Punto
    x::Float64
    y::Float64
end

function ddiff_finitas(puntos::Array{Punto})
    h::Float64 = puntos[2].x - puntos[1].x
    dfx = Array{Float64}(undef, length(puntos)-2)

    for i ∈ axes(dfx, 1)
        dfx[i] = (1/(2 * h)) * (puntos[i+2].y - puntos[i].y)
    end

    return dfx
end
