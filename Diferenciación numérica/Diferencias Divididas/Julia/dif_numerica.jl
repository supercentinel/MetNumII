struct Punto
    x::Float64
    y::Float64
end

function diff_numerica(puntos::Array{Punto}, grado::Int64, outprint::Bool)
    dif_div = zeros(Float64, length(puntos), length(puntos)+1)
    estimacion::Float64 = 0.0
    ∑s = 0.0
    ∏c::Float64 = 1.0

    for i ∈ axes(dif_div,1)
        dif_div[i,1] = puntos[i].x
        dif_div[i, 2] = puntos[i].y
    end

    for i ∈ axes(dif_div,2)[(begin+2):end]
        for j ∈ axes(dif_div, 1)[begin:(end-i+2)]
            dif_div[j,i] = (dif_div[j+1, i-1] - dif_div[j, i-1])/(dif_div[j+1+i-3, 1] - dif_div[j,1])
        end
    end

    for i ∈ 1:grado+1
        for j ∈ 1:grado-i+1
            ∏c = 1.0
            for k ∈ 1:grado-i+1


    if outprint == true
        println("Tabla de diferencias divididas:")
        display(dif_div)
    end
end

p_0 = Punto(0.5, -0.46828)
p_1 = Punto(1.0, -2.88906)
p_2 = Punto(1.1, -3.89501)
p_3 = Punto(1.3, -6.89374)
p_4 = Punto(1.6, -15.35253)

puntos = [p_0, p_1, p_2, p_3, p_4]

diff_numerica(puntos, 2, true)
