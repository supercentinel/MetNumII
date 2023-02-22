using Printf

mutable struct Punto
    x::Float64
    y::Float64
end

function g_1(x::Float64, y::Float64)
    return ((x ^ 2)- (y ^ 2) - x - 3 + (3 * x))/(3)
end

function g_2(x::Float64, y::Float64)
    return -(x + (2 * y) + 1 - (3 * y))/(3)
end

function distancia(p_1::Punto, p_2::Punto)
    return √(((p_1.x - p_2.x) ^ 2) + ((p_1.y - p_2.y) ^ 2))
end

function punto_fijo(x::Float64, y::Float64, tolerancia::Float64, iteraciones::Int64)
    p = Punto(x, y)
    pkm1 = Punto(0.0, 0.0)
    k::UInt32 = 0.0
    e_a::Float64 = 1.0

    @printf("|%-4s|%-24s|%-24s|%-24s|\n", "k", "x^k", "y^k", "E_a")
    #println("|-|-|-|-|")
    
    while true
        pkm1.x = p.x
        pkm1.y = p.y

        @printf("|%-4i|%-24.20LF|%-24.20LF|%-24.20LF|\n", k, p.x, p.y, e_a)

        if k >= iteraciones
            break
        end
        if e_a <= tolerancia
            break
        end

        p.x = g_1(pkm1.x, pkm1.y)
        p.y = g_2(pkm1.x, pkm1.y)

        e_a = distancia(p, pkm1)

        k += 1
    end

    return p
end


function main()
    p = punto_fijo(0.0, 0.0,0.0005, 100)
end

main()