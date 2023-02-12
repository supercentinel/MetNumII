mutable struct Punto
    x::Float64
    y::Float64
end

function g_1(x::Float64, y::Float64)
    return -(((x * x) - y - 2.0 - (4.0 * x))/(4.0));
end

function g_2(x::Float64, y::Float64)
    return return -(((2.0 * x * y) - 3.0 - (5.0 * y))/(5.0));
end

function distancia(p_1::Punto, p_2::Punto)
    return √(((p_1.x - p_2.x) ^ 2) + ((p_1.y - p_2.y) ^ 2))
end

function punto_fijo_sucesivo(x::Float64, y::Float64, tolerancia::Float64, iteraciones::Int64)
    p = Punto(x, y)
    pkm1 = Punto(0.0, 0.0)
    k::UInt32 = 0.0
    e_a::Float64 = 1.0

    while true
        pkm1.x = p.x
        pkm1.y = p.y

        println(k, "|", p.x, "|", p.y, "|", e_a)

        if k >= iteraciones 
            break
        end
        if e_a <= tolerancia 
            break
        end

        p.x = g_1(p.x, p.y)
        p.y = g_2(p.x, p.y)

        e_a = distancia(p, pkm1)
            
        k += 1
    end
    
    return p
end


function main()
    p = punto_fijo_sucesivo(1.75, 1.0, 0.00008, 100)
end

main()
