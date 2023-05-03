include("Spline_c.jl")

#=
#Ejemplo de como usar la función
Spline_C() tiene dos argumentos: Un arreglo de puntos y un booleano para inprimir al stout los polinomios resultantes.
Para que sean congruentes los polinomios deben estar ordenados. Usen un algoritmo de ordenamiento para acomodar los puntos.

#Asi se crea un arreglo de puntos
#Definimos el arreglo
A::Array{Punto} = []
#iniciamos un punto
c = Punto(0.0, 0.0)

#La función regresa un arreglo de los polinomios
g = Spline_c(A, true)
asi obtenemos los poliniomios al stdout

para leer los polinomios
x = readline()
x = parse(Float64, x)
# x es ahora un número


Si tienen más dudas pueden consultar el repositorio de git y la documentación del lenguaje https://docs.julialang.org/en/v1/
=#
function read_csv(filename::AbstractString)::Vector{Punto}
    puntos = Vector{Punto}()
    open(filename) do file
        for line in eachline(file)
            x, y = split(line, ",")
            push!(puntos, Punto(parse(Float64, x), parse(Float64, y)))
        end
    end
    return puntos
end

function read_stdin()::Vector{Punto}
    puntos = Vector{Punto}()
    i = 0
    while true
        try
            print("x_", i, " = ")
            x = parse(Float64, readline())
            print("y_", i, " = ")
            y = parse(Float64, readline())
            push!(puntos, Punto(x, y))
            i += 1
        catch
            break
        end
    end
    return puntos
end

println("Programa 3")
println("Este programa calcula los polinomios cubicos de Spline")
println("Ya sea con un csv como argumento ejemplo:en la shell `julia main.jl ejemplo.csv` ")
println("O directamente del stdin")
println("Integrantes:")
println("Alan Ceron Chavez")

if length(ARGS) == 1
    puntos = read_csv(first(ARGS))
    g = Spline_C(puntos, true)
else
  while true
    println("introduce un enter para terminar la lectura de datos")
    
    global puntos = read_stdin()
    print("Los datos son correctos?[y/n]")
    ans = readline()
    if ans == "y"
      break
    end
  end
  
  g = Spline_C(puntos, true)
end
