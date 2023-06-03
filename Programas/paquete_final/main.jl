#todo list
# 1.- Menus
#

#Métodos
include("../Programa_1/Julia/Programa_1/src/newton.jl")
include("../../Interpolación polinomial/Diferencias Divididas/Julia/diferencias_divididas.jl")
include("../../Interpolación polinomial/Spline Cúbico/Julia/Spline_c.jl")
include("../../Diferenciación numérica/Diferencias Finitas/Julia/ddiff_finitas.jl")
include("../../Integración Numérica/Julia/simpson_13.jl")
include("../../Integración Numérica/Julia/simpson_38.jl")
include("../../Integración Numérica/Julia/trapecio.jl")

#funciones
include("f_ssl.jl")

## Sistemas de ecuaciones no lineales
#Ejemplo newton(A::Array{Float64}, F::Array{Function}, J::Array{Function}, tolerancia::Float64, iteraciones::Int64, TeX::Bool)

function Pretty_point_display(puntos::Array{Punto})
   # Get the width of the longest x and y values
  x_width = 24
  y_width = 24

  # Create a string with the header
  header = "|x" * x_width + "|" * y_width + "|"
    println(header)

  # Print each point, padding the x and y values to the same width
  for point in puntos
    println(point.i, string(x_width - length(string(point.i)))*" ", point.x, string(y_width - length(string(point.y)))*" ", point.y)
  end
end

function cls()
    if Sys.iswindows()
        return read(run(`powershell cls`), String)
    elseif Sys.isunix()
        return read(run(`clear`), String)
    elseif Sys.islinux()
        return read(run(`printf "\033c"`), String)
    end
end

function main_menu()
    println("Paquete final de métodos numéricos II")
    println()
    println("1.- Sistemas de ecuaciones no lineales")
    println("2.- Interpolación polinomial")
    println("3.- Diferenciación numérica")
    println("4.- Integración numérica")
    println("5.- Salir")

    opt = readline()
    opt = parse(Int64, opt)

    return opt
end

function s_eq_menu()
    println("Sistemas de ecuaciones no lineales")
    println("1.- f₁(x,y) = x²+xy-10 = 0")
    println("    f₂(x,y) = y+3xy²-50 = 0")
    println()
    println("2.- f₁(x,y) = x²+y²-9 = 0")
    println("    f₂(x,y) = -ℯ^x - 2y-3 = 0")
    println()
    println("3.- f₁(x,y,z)=2x²-4x+y²+3z²+6z+2=0")
    println("    f₂(x,y,z)=x²+y²-2y+2z²-5=0")
    println("    f₃(x,y,z)=3x²-12x+y²-3z²+8=0")
    println()
    println("4.- f₁(x,y,z)=x²-4x+y²=0")
    println("    f₂(x,y,z)=x²-x-12y+1=0")
    println("    f₃(x,y,z)=3x²-12x+y²-3z²+8=0")
    println()
    println("5. Salir")

    opt = readline()
    opt = parse(Int64, opt)

    return opt
end

function interp_menu()
    println("Interpolación polinomial")
    println("1.- Diferencias divididas")
    println("2.- Spline cúbico")
    println("3.- Salir")

    opt = readline()
    opt = parse(Int64, opt)

    return opt
end

function diff_menu()
    println("Diferenciación numérica")
    println("1.- Diferencias finitas")
    println("2.- Salir")

    opt = readline()
    opt = parse(Int64, opt)

    return opt
end

function int_menu()
    println("Integración numérica")
    println("1.- Simpson 1/3")
    println("2.- Simpson 3/8")
    println("3.- Regla del trapecio")
    println("3.- Salir")

    opt = readline()
    opt = parse(Int64, opt)

    return opt
end

function lectura_puntos()::Array{Punto}
    puntos = Array{Punto}(undef, 0)
    i = 0

    println("Ingrese los puntos de la forma (x,y)")
    println("Para terminar ingrese un punto con x = 42.42")
    while true
        println("Ingrese x[", i, "]: ")
        x = readline()
        x = parse(Float64, x)
        if x == 42.42
            break
        end
        println("Ingrese y[", i, "]: ")
        y = readline()
        y = parse(Float64, y)
        push!(puntos, Punto(x,y))
        i += 1
    end

    return puntos
end

function lectura_s_eq(Vsize::Int64)
    if Vsize == 2
        println("Ingrese el vector inicial de la forma (x,y)")
        println("Ingrese x: ")
        x = readline()
        x = parse(Float64, x)
        println("Ingrese y: ")
        y = readline()
        y = parse(Float64, y)
        println("Ingrese la tolerancia: ")
        tol = readline()
        tol = parse(Float64, tol)
        println("Ingrese el número de iteraciones: ")
        iter = readline()
        iter = parse(Int64, iter)
        return ([x,y], tol, iter)
    elseif Vsize == 3
        println("Ingrese el vector inicial de la forma (x,y,z)")
        println("Ingrese x: ")
        x = readline()
        x = parse(Float64, x)
        println("Ingrese y: ")
        y = readline()
        y = parse(Float64, y)
        println("Ingrese z: ")
        z = readline()
        z = parse(Float64, z)
        println("Ingrese la tolerancia: ")
        tol = readline()
        tol = parse(Float64, tol)
        println("Ingrese el número de iteraciones: ")
        iter = readline()
        iter = parse(Int64, iter)
        return ([x,y,z], tol, iter)
    end
end


println("Paquete final de métodos numéricos II")
println()
println("Integrantes:")
println("Alan Cerón Chávez")

println("Presione enter para continuar...")
readline()
cls()


while true
    menu = main_menu()

    if menu == 1
        cls()

        while true

            s_menu = s_eq_menu()

            if s_menu == 1
                cls()
                input = lectura_s_eq(2)
                cls()
                println("Resultado de Newton-Raphson")
                R = newton(input[1], F_1, J_1, input[2], input[3], false)


            elseif s_menu == 2
                cls()
                input = lectura_s_eq(2)
                println("Resultado de Newton-Raphson")
                R = newton(input[1], F_2, J_2, input[2], input[3], false)

            elseif s_menu == 3
                cls()
                input = lectura_s_eq(3)
                println("Resultado de Newton-Raphson")
                R = newton(input[1], F_3, J_3, input[2], input[3], false)

            elseif s_menu == 4
                cls()
                input = lectura_s_eq(3)
                println("Resultado de Newton-Raphson")
                R = newton(input[1], F_4, J_4, input[2], input[3], false)

            else
                cls()
                break
            end

            println("Presione enter para continuar...")
            readline()
            cls()

        end

    elseif menu == 2
        cls()

        while true
            ip_menu = interp_menu()

            if ip_menu == 1
                cls()
                puntos = lectura_puntos()
                println("Ingrese el valor a interpolar: ")
                est = readline()
                est = parse(Float64, est)
                println("Ingrese el grado del polinomio(Recuerde que el grado es n-1):")
                grado = readline()
                grado = parse(Int64, grado)

                println("Desea ver la tabla de diferencias divididas? (y/n)")
                opt = readline()
                if opt == "y"
                    cls()
                    println("Tabla de diferencias divididas")
                    r = diferencias_divididas(puntos, est, grado, true)
                    println("Resultado de diferencias divididas = ", r)
                else
                    cls()
                    println("Resultado de diferencias divididas")
                    println(diferencias_divididas(puntos, est, grado, false))
                end

                println("Presione enter para continuar...")
                readline()

            elseif ip_menu == 2
                cls()
                puntos = lectura_puntos()
                cls()
                println("Resultado de spline cúbico")
                sp = Spline_C(puntos, true)

                println("Presione enter para continuar...")
                readline()

            else
                cls()
                break
            end

            cls()
        end

    elseif menu == 3
        cls()

        while true
            d_menu = diff_menu()

            if d_menu == 1
                cls()
                println("Recuerde que los puntos deben estar equiespaciados")
                puntos = lectura_puntos()
                println("Valores de la derivada por diferencias finitas")
                dd = ddiff_finitas(puntos)
                display(dd)

                println("Presione enter para continuar...")
                readline()
            else
                cls()
                break
            end

            cls()
        end

    elseif menu == 4
        cls()

        while true
            i_menu = int_menu()

            if i_menu == 1
                cls()
                println("Recuerde que n-1 puntos debe ser par")
                puntos = lectura_puntos()

                r = simpson_13(puntos, false)

                println("Resultado de la integración numérica por Simpson 1/3")
                println(r)

                println("Presione enter para continuar...")
                readline()

            elseif i_menu == 2
                cls()
                println("Recuerde que n-1 puntos debe ser divisible entre 3")
                puntos = lectura_puntos()

                r = simpson_38(puntos, false)

                println("Resultado de la integración numérica por Simpson 3/8")
                println(r)

                println("Presione enter para continuar...")
                readline()

            elseif i_menu == 3
                cls()
                println("Recuerde que n puntos debe ser mayor a 1")
                puntos = lectura_puntos()

                r = trapecio(puntos, false)

                println("Resultado de la integración numérica por trapecio")
                println(r)

                println("Presione enter para continuar...")
                readline()

            else
                cls()
                break
            end

            cls()
        end

    else
        println("さよなら")
        break
    end

end
