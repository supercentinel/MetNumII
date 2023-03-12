struct Punto
    x::Float64
    y::Float64
end

function lagrange_1(p_0::Punto, p_1::Punto, p::Punto)
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
    L::Float64 = 1.0
    ubik = 0
    
    if grado > length(puntos)
        println("El grado maximo del polinomio es n siendo el tamaño del arreglo de puntos n+1")
        return 0.0
    end
    #=
    for i ∈ 1:length(puntos)
        if est < puntos[i].x
            ubik = i-1
            println(puntos[i-1].x, " > ", est, " > ",puntos[i].x)
            break
        end
    end
    =#

    for i ∈ 1:grado+1
        #println("i = ", i)
        L = 1.0
        
        for j ∈ 1:grado
            #println("j = ",j)
            if i == j
                #=
                if i == grado+1
                    L *= (est - puntos[1].x)/(puntos[i].x - puntos[1].x)
                else
                end
                    =#
                    L *= (est - puntos[grado+1].x)/(puntos[i].x - puntos[grado+1].x)
                    println(est, " - ", puntos[grado+1].x)
                    println("-----------")
                    println(puntos[i].x, " - ", puntos[grado+1].x)
                    
                continue
            end

            #println(est, " - ", puntos[j].x, "/", puntos[i].x, " - ", puntos[j].x)
            println(est, " - ", puntos[j].x)
            println("-----------")
            println(puntos[i].x, " - ", puntos[j].x)
            L *= (est - puntos[j].x)/(puntos[i].x - puntos[j].x)
            #println(L)
        end
        
        println(" * ", puntos[i].y)
        estimacion += L * puntos[i].y
    end

    return estimacion
end

function main()
    p_0 = Punto(1.73, 8.1)
    p_1 = Punto(1.82, 8.3)
    p_2 = Punto(2.61, 7.8)
    p_3 = Punto(5.22, 2.4)
    p_4 = Punto(8.26, -1.7)

    pasr = Punto(2.5, 0)

    puntos = [p_1, p_2]

    est = 2.5

    r = lagrange_n(puntos, est, 1)
    println("Usando la función para n ", est, " ⭇ ", r)

    r_1 = lagrange_1(p_1, p_2, pasr)
    println(r_1)

    r_3 = lagrange_2(p_1, p_2, p_3, est)
    println(est, " ⭇ ", r_3)
end

main()
