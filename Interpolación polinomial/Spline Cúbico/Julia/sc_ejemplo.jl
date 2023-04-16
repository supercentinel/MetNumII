include("Spline_c.jl")

function fcnFromString(s)
    f = eval(Meta.parse("x -> " * s))
    return x -> Base.invokelatest(f, x)
end

function main()
    p_0 = Punto(0.95, -1.1)
    p_1 = Punto(1.73, 0.27)
    p_2 = Punto(2.23, -0.29)
    p_3 = Punto(2.77, 0.56)
    p_4 = Punto(2.99, 1.0)
    #p_5 = Punto(3.33, 0.7)

    puntos = [p_0, p_1, p_2, p_3, p_4#=, p_5=#]

    fn = Array{String}(undef, length(puntos)-1)
    g = Array{Function}(undef, length(puntos)-1)

    fn = Spline_C(puntos)

    println()

    for i ∈ axes(fn, 1)
        println("Polinomio[", i, "] = ", fn[i])
        g[i] = fcnFromString(fn[i])
    end

    display(g)

    println(g[1](0.95))


end

main()
