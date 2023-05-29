include("trapecio.jl")

#=
Integral de Romberg
I_j(h_k)≅I_{j-1}(h_k)+\frac{I_{j-1}(h_{k}}) - I_{j-1}(h_k - 1)}{4^{j-1} - 1}
=#

function trapecio_mod(puntos::Array{Punto}, h::Float64)
    ∑f_i::Float64 = 0.0
    x = puntos[1].x + h

    for i ∈ axes(puntos, 1)[begin+1:end-1]

        if round(x, digits=12) == round(puntos[i].x, digits=12)
            ∑f_i += puntos[i].y
            x = x + h
        end
    end

    return (h/2) * (puntos[1].y + puntos[length(puntos)].y + (2 * ∑f_i))
end

function romberg(puntos::Array{Punto}, f::Function, k::Int64, outprint::Bool)
    #matriz de resultados
    resultados = zeros(Float64, k, k)
    h = puntos[2].x - puntos[1].x
    hs = Array{Float64}(undef, k)

    x_n = puntos[1].x

    for i ∈ axes(hs, 1)
        if i > 1
            hs[i] = round(hs[i-1]/2, digits=12)
        else
            hs[1] = round(h, digits=12)
        end
    end

    if outprint == true
        display(hs)
    end

    n_n = (puntos[length(puntos)].x - puntos[1].x)/hs[length(hs)]
    n_n = Int64(floor(n_n))

    #Big Fucking Array of points
    bfp = Array{Punto}(undef, n_n+1)

    #Filling the bfp
    for i in axes(bfp, 1)
        bfp[i] = Punto(x_n, f(x_n))
        x_n += hs[length(hs)]
    end

    #Filling the first column of the resultados Array
    for i ∈ axes(resultados, 1)
        resultados[i, 1] = trapecio_mod(bfp, hs[i])
    end

    #Fiilng the other columns of resultados
    for i ∈ axes(resultados, 1)[begin+1:end]
        for j ∈ axes(resultados, 2)[begin+i-1:end]
            # immma fucking genius -shit worked at first time-
            resultados[j,i] = resultados[j,i-1] + ((resultados[j,i-1] - resultados[j-1,i-1])/(4^(i-1)-1))#resultados[i, j]
        end
    end

    if outprint == true
        display(resultados)
    end

    return resultados[k, k]
end
