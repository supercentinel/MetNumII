include("trapecio.jl")

#=
Integral de Romberg
I_j(h_k)≅I_{j-1}(h_k)+\frac{I_{j-1}(h_{k}}) - I_{j-1}(h_k - 1)}{4^{j-1} - 1}
=#

function romberg(puntos::Array{Punto}, k::Int64)
    subpars = Matrix{Punto}(undef, k, length(puntos))
    h = puntos[2].x - puntos[1].x
    hs = Array{Float64}(undef, k-1)

    for i ∈ hs
        if i > 1
            hs[i] = 1/hs[i-1]^2
        else
            hs[1] = 1/h
        end
    end

    display(hs)

    return
end


function f(x::Float64)
    return π * ( 1 + (x/3.0)^2)^2
end

puntos = Array{Punto}(undef, 7)

x = 0.0
h = 0.5

for i ∈ axes(puntos, 1)
    puntos[i] = Punto(x, f(x))
    global x += h
end

display(puntos)

est = trapecio(puntos, false)
println(est)

romberg(puntos, 4)
