struct Punto
    x::Float64
    y::Float64
end

function lagrange_1(puntos::Array{Punto}, p_0::Punto, p::Punto, p_1::Punto, grado::Int64)
    estimacion::Float64 = 0.0

    estimacion = (((p.x-p_1.x)/(p_0.x-p_1.x))*p_0.y)+(((p.x-p_0.x)/(p_1.x-p_0.x))*p_1.y)

    return estimacion
end

function lagrange_2(p_0::Punto, p_1::Punto, p_2::Punto, est::Float64)
    estimacion:Float64 = 0.0

    estimacion = ((((est - p_1.x)*(est - p_2.x))/((p_0.x-p_1.x)*(p_0.x - p_2.x)))*p_0.y)+((((est - p_0.x)*(est - p_2.x))/((p_1.x-p_0.x)*(p_1.x - p_2.x)))*p_1.y)+((((est - p_0.x)*(est - p_1.x))/((p_2.x-p_0.x)*(p_2.x - p_1.x)))*p_2.y)

    return estimacion
end
function lagrange_n(puntos::Array{Punto}, est::Float64, grado::Int64)
    estimacion::Float64 = 0.0
    pos::Int64
    L = zeros(Float64 , grado+1, 1)

    #suponiendo que el arreglo de puntos está ordenado
    for i ∈ 1:length(puntos)
        if p.x > puntos[i].x
            pos = i
            break
        end
    end

    for i ∈ 1:grado
        L *= (est - puntos[i].x)/()
    end

    for i ∈ 1:grado
        estimacion += L[i] * puntos[i-1].y
    end

    return estimacion
end

function main()
    p_0 = Punto(1.73, 8.1)
    p_1 = Punto(1.82, 8.3)
    p_2 = Punto(2.61, 7.8)
    p_3 = Punto(5.22, 2.4)
    p_4 = Punto(8.26, -1.7)
    est = 2.5


    r = lagrange_2(p_1, p_2, p_3, est)
    println(est, " ≈ ", r)
end

main()
