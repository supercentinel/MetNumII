include("../../Interpolación polinomial/Diferencias Divididas/Julia/diferencias_divididas.jl")

function f(x::Float64)::Float64
    return (2 * x^2 - 1) * ((cos(4 * x))/(x))
end

puntos = Array{Punto}(undef, 6)

puntos[1] = Punto(0.5, f(0.5))
puntos[2] = Punto(1.2, f(1.2))
puntos[3] = Punto(2.5, f(2.5))
puntos[4] = Punto(3.0, f(3.0))
puntos[5] = Punto(3.4, f(3.4))
puntos[6] = Punto(4.6, f(4.6))

display(puntos)
