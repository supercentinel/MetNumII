include("../../Integración Numérica/Julia/simpson_13.jl")
include("../../Integración Numérica/Julia/simpson_38.jl")
include("../../Integración Numérica/Julia/extrapolacion_romberg.jl")

function syscls()
    if Sys.iswindows()
        run(`cmd /c "cls"`)
    else
        run(`clear`)
    end
end

function f_1(x::Float64)
    return (x^4) * ((√(3 + (2 * (x^2))))/(3))
end

function f_2(x::Float64)
    return ((x^5)/(((x^2) + 4)^(1/5)))
end


println("Cuarto programa")
println("Integeración numérica")
println("Integración de Simpson 1/3 y Extrapolación de Romberg")
println("Integrantes:")
println("Alan Cerón Chávez")
println("")

while true

    println("Menú")

    println("Seleccione la función a integrar")

    println("1.- f(x) = x^4 * √(3 + 2x^2)/3")
    println("2.- f(x) = x^5/(x^2 + 4)^(1/5)")

    opt_1 = readline()
    opt_1 = parse(Int64, opt_1)

    while opt_1 > 2 || opt_1 < 1
        println("Opción no válida")
        println("Seleccione la función a integrar")
        println("1.- f(x) = x^4 * √(3 + 2x^2)/3")
        println("2.- f(x) = x^5/(x^2 + 4)^(1/5)")
    end

    println("Seleccione el método de integración")
    println("1.- Integración de Simpson 1/3")
    println("2.- Extrapolacion de Romberg")

    opt_2 = readline()
    opt_2 = parse(Int64, opt_2)

    while opt_2 > 2 || opt_2 < 1
        println("Opción no válida")
        println("Seleccione el método de integración")
        println("1.- Integración de Simpson 1/3")
        println("2.- Extrapolacion de Romberg")
    end

    #integración por Simpson 1/3 o combinación de Simpson 1/3 y 3/8 o Simpson 3/8 dependiendo del número de intervalos
    if opt_2 == 1
        println("Ingrese el valor de a")
        a = readline()
        a = parse(Float64, a)

        println("Ingrese el valor de b")
        b = readline()
        b = parse(Float64, b)

        println("Ingrese el valor de n(número de intervalos)")
        n = readline()
        n = parse(Int64, n)

        if n < 2
            println("El número de intervalos debe ser mayor a 1")
            println("Ingrese el valor de n(número de intervalos)")
            n = readline()
            n = parse(Int64, n)
        end

        #Se calcula la distancia de los intervalos
        h = (b - a)/n
        println("El valor de h es: ", h)

        puntos = Array{Punto}(undef, n + 1)

        #Se evalua la función
        for i ∈ axes(puntos, 1)
            if opt_1 == 1
                puntos[i] = Punto(a, f_1(a))
            else
                puntos[i] = Punto(a, f_2(a))
            end
            a += h
        end

        # Se determina si el número de intervalos es par o impar para saber que método usar
        if n % 2 == 0
            println("El valor de la integral es: ", simpson_13(puntos, false))
        #si el número de intervalos es impar se usa el método de combinación de Simpson 1/3 y 3/8
        elseif n > 5
            puntos_2 = Array{Punto}(undef, length(puntos)-3)
            puntos_3 = Array{Punto}(undef, 4)

            for i ∈ axes(puntos, 1)
                if i > length(puntos_2)
                    puntos_3[i - length(puntos_2)] = puntos[i]
                else
                    puntos_2[i] = puntos[i]
                end
            end

            println("El numero de intervalos es impar, se usará el método de combinación de Simpson 1/3 y 3/8")
            println("El valor de la integral es: ", simpson_13(puntos_2, false) + simpson_38(puntos_3, false))
        #Pero si el número de intervalos es menor a 5 no se puede usar el método de combinación de Simpson 1/3 y 3/8
        else
            println("El numero de intervalos es impar y no se puede usar el método de combinación de Simpson 1/3 y 3/8
                    por lo que se usará el método de Simpson 3/8")
            println("El valor de la integral es: ", simpson_38(puntos, false))
        end
    #Integración por extrapolación de Romberg
    else
        println("Ingrese el valor de a")
        a = readline()
        a = parse(Float64, a)

        println("Ingrese el valor de b")
        b = readline()
        b = parse(Float64, b)

        println("Ingrese el valor de n(número de intervalos)")
        n = readline()
        n = parse(Int64, n)

        if n < 2
            println("El número de intervalos debe ser mayor a 1")
            println("Ingrese el valor de n(número de intervalos)")
            n = readline()
            n = parse(Int64, n)
        end

        h = (b - a)/n

        println("El valor de h es: ", h)

        println("Ingrese el grado del error")
        grado = readline()
        grado = parse(Int64, grado)

        puntos = Array{Punto}(undef, n + 1)

        for i ∈ axes(puntos, 1)
            if opt_1 == 1
                puntos[i] = Punto(a, f_1(a))
            else
                puntos[i] = Punto(a, f_2(a))
            end

            a += h
        end

        if grado < 1
            println("El grado del error debe ser mayor a 0")
            println("Ingrese el grado del error")
            grado = readline()
            grado = parse(Int64, grado)
        end

        println("desea ver la tabla de extrapolación de Romberg? (s/n)")
        opt_3 = readline()

        if opt_3 == "s"
            println("Tabla de extrapolación de Romberg")
            if opt_1 == 1
                est = romberg(puntos, f_1, grado, true)
                println("El valor de la integral es: ", est)
            else
                est = romberg(puntos, f_2, grado, true)
                println("El valor de la integral es: ", est)
            end
        else
            if opt_1 == 1
                println("El valor de la integral es: ", romberg(puntos, f_1, grado, false))
            else
                println("El valor de la integral es: ", romberg(puntos, f_2, grado, false))
            end
        end
    end

    println("Desea calcular otra integral? (s/n)")
    exit = readline()
    if exit == "n"
        break
    end
    syscls()
end
