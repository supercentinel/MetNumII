struct Punto
    x::Float64
    y::Float64
end

function lagrange(puntos::Array{Punto}, est::Float64)
    ∑ = 0.0

    for k ∈ 1:length(puntos)
        ∏ = 1.0
        for j ∈ 1:length(puntos)
            if k ≠ j
                ∏ = ∏ * ((est - puntos[j].x)/(puntos[k].x - puntos[j].x))
            end
        end
        ∑ += ∏ * puntos[k].y
    end

    return ∑
end

