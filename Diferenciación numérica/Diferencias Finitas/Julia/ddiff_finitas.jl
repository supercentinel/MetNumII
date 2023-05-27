struct Punto
    x::Float64
    y::Float64
end

function ddiff_finitas(puntos::Array{Punto})
    h::Float64 = puntos[2].x - puntos[1].x
    dpuntos = Array{Punto}(undef, length(puntos)-2)

    for i ∈ axes(dpuntos, 1)
        dfx = (1/(2 * h)) * (puntos[i+2].y - puntos[i].y)
        dpuntos[i] = Punto(puntos[i+1].x, dfx)
    end

    return dpuntos
end
