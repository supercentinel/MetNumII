struct Punto
    x::Float64
    y::Float64
end

function Spline_C(puntos::Array{Punto})
    distancias = zeros(Float64, length(puntos)-1, 1)
    dif_div = zeros(Float64, length(puntos)-1, 1)
    sEq = zeros(Float64, length(puntos)-2, length(puntos))
    ssEq = zeros(Float64, length(puntos)-2, 1)
    S = zeros(Float64, length(puntos)-2, 1)
    a = zeros(Float64, length(puntos)-1, 1)
    b = zeros(Float64, length(puntos)-1, 1)
    c = zeros(Float64, length(puntos)-1, 1)

    for i ∈ axes(distancias,1)
        distancias[i] = puntos[i+1].x - puntos[i].x
        dif_div[i] = (puntos[i+1].y - puntos[i].y)/(distancias[i])
    end

    display(sEq)
end


function main()

    p_0 = Punto(0.95, -1.1)
    p_1 = Punto(1.73, 0.27)
    p_2 = Punto(2.23, -0.29)
    p_3 = Punto(2.77, 0.56)
    p_4 = Punto(2.99, 1.0)

    puntos = [p_0, p_1, p_2, p_3, p_4]

    Spline_C(puntos)

end

main()
