function distancia(X::Array{Float64}, X_2::Array{Float64})
    ∑ = 0.0

    if length(X) != length(X_2)
        return 0.0
    end

    for i ∈ 1:length(X)
        ∑ += (X[i] - X_2[i]) ^ 2
    end

    return √∑
end

function punto_fijo_sucesivo(X::Array{Float64}, G::Array{Function}, tolerancia::Float64, iteraciones::Int64)
    X_k = copy(X)
    X_km1 = copy(X)
    k::UInt32 = 0.0
    e_a::Float64 = 1.0

    print("k = ")
    println(k)
    print("X = ")
    println(X_k)

    while true
        X_km1 = copy(X_k)

        for i ∈ 1:length(G)
            X_k[i] = G[i](X_k)
        end

        e_a = distancia(X_k, X_km1)

        print("k = ")
        println(k)
        print("X = ")
        println(X_k)
        print("Error = ")
        println(e_a)

        if e_a <= tolerancia
            break
        end
        if k >= iteraciones
            break
        end

        k += 1
    end

    return X_k
end
