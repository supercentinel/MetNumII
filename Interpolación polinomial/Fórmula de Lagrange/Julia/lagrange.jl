struct Punto
    x::Float64
    y::Float64
end

function lagrange(puntos::Array{Punto}, estimar::Punto, grado::Int64)
    estimacion::Float64 = 0.0

    for i ∈ 1:grado
        estimacion += 1.0
    end

    return estimacion
end

pt_1 = Punto(1.0, 1.0)

pt_2 = Punto(1.0, 2.0)

pts = [pt_1, pt_2]

r = lagrange(pts, pt_1, 2)
println(r)
display(pts)
