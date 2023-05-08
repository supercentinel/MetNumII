struct Punto
    x::Float64
    y::Float64
end


function ddiff_finitas(puntos::Array{Punto}, f::Function)
    h::Float64 = puntos[2].x - puntos[1].x

    return (1/(2 * h))*(f(puntos[3].x)-f(puntos[1].x))
end


puntos = Array{Punto}(undef, 9)

puntos[1] = Punto(2.0, 0.123060)
puntos[2] = Punto(2.1, 0.105706)
puntos[3] = Punto(2.2, 0.089584)
puntos[4] = Punto(2.3, 0.074764)
puntos[5] = Punto(2.4, 0.061277)
puntos[6] = Punto(2.5, 0.049126)
puntos[7] = Punto(2.6, 0.038288)
puntos[8] = Punto(2.7, 0.028722)
puntos[9] = Punto(2.8, 0.020371)

p_1 = [puntos[1], puntos[2], puntos[3]]
p_2 = [puntos[2], puntos[3], puntos[4]]
p_3 = [puntos[3], puntos[4], puntos[5]]
p_4 = [puntos[4], puntos[5], puntos[6]]
p_5 = [puntos[5], puntos[6], puntos[7]]
p_6 = [puntos[6], puntos[7], puntos[8]]
p_7 = [puntos[7], puntos[8], puntos[9]]

function f(x::Float64)
    return exp(-x) * sin(x)
end

a_1 = ddiff_finitas(p_1, f)
a_2 = ddiff_finitas(p_2, f)
a_3 = ddiff_finitas(p_3, f)
a_4 = ddiff_finitas(p_4, f)
a_5 = ddiff_finitas(p_5, f)
a_6 = ddiff_finitas(p_6, f)
a_7 = ddiff_finitas(p_7, f)

display(a_4)
