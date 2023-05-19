struct Punto
    x::Float64
    y::Float64
end

function simpson_13(puntos::Array{Punto}, outprint::Bool)::Float64
    ∑s::Float64 = 0.0
    n = length(puntos)-1
    h = puntos[2].x - puntos[1].x
    i::Int64 = 1

    if outprint == true
        s = string("f_0 + ")
        ss = string(puntos[1].y, " + ")
    end

    while true

        if outprint == true
            s = string(s, "4f_", i, " + 2f_", i+1, " + ")
            ss = string(ss, "4 * ", puntos[i+1].y, " + 2 * ", puntos[i+2].y, " + ")
        end

        ∑s += (4 * puntos[i+1].y) + (2 * puntos[i+2].y)

        if i == n-3
            break
        end

        i += 2
    end

    if outprint == true
        s = string(s, "4f_", i+2, " + f_", n)
        ss = string(ss, "4 * ", puntos[n].y, " + ", puntos[n+1].y)
        println(s)
        println(ss)

        println(h/3, " * [", puntos[1].y, " + ", puntos[n+1].y, " + ", ∑s, " + 4", puntos[i+2].y, "]")
    end

    return (h/3) * (puntos[1].y + puntos[n+1].y + ∑s + (4 * puntos[n].y))
end
