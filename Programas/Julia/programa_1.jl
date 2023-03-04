include("newton.jl")

#primer sistema de ecuaciones y sus derivadas
function f1a(X::Array{Float64})
    return (X[1] ^ 2) + (X[1] * X[2]) - 10
end

function f2a(X::Array{Float64})
    return X[2] + (3 * X[1] * (X[2] ^ 2)) - 50
end

function f1ax(X::Array{Float64})
    return (2 * X[1]) + X[2]
end

function f1ay(X::Array{Float64})
    return X[1]
end

function f2ax(X::Array{Float64})
    return (X[2] ^ 2)
end

function f2ay(X::Array{Float64})
    return (6 * X[1] * X[2]) + 1
end

#segundo sistema de ecuaciones y sus derivadas
function f1b(X::Array{Float64})
    return (X[1] ^ 2) + (X[2] ^ 2) - 9
end

function f2b(X::Array{Float64})
    return -exp(X[1]) - (2 * X[2]) - 3
end

function f1bx(X::Array{Float64})
    return 2 * X[1]
end

function f1by(X::Array{Float64})
    return 2 * X[2]
end

function f2bx(X::Array{Float64})
    return -exp(X[1])
end

function f2by(X::Array{Float64})
    return (-2 * X[2])
end
#tercer sistema de ecuaciones y sus derivadas(la tercera ecuacion es la misma que la del cuarto sistema de ecuaciones)
function f1c(X::Array{Float64} )
    return (2 * ( X[1] ^ 2)) - (4 * X[1]) + (X[2] ^ 2) + (3 * (X[3] ^ 2)) + (6 * X[3]) + 2
end

function f2c(X::Array{Float64} )
    return (X[1] ^ 2) + (X[2] ^ 2) - (2 * X[2]) + (2 * (X[3]^ 2)) - 5
end

function f1cx(X::Array{Float64} )
    return (4 * X[1]) - 4
end

function f1cy(X::Array{Float64} )
    return 2 * X[2]
end

function f1cz(X::Array{Float64} )
    return (6 * X[3]) + 6
end
function f2cx(X::Array{Float64} )
    return 2 * X[1]
end

function f2cy(X::Array{Float64} )
    return (2 * X[2]) - 2
end

function f2cz(X::Array{Float64} )
    return 4 * X[3]
end

#cuarto sistema de ecuaciones y sus derivadas
function f1d(X::Array{Float64} )
    return (X[1] ^ 2) - (4 * X[1]) + (X[2] ^ 2)
end

function f2d(X::Array{Float64} )
    return (X[1] ^ 2) - X[1] - (12 * X[2]) + 1
end

function f3cd(X::Array{Float64} )
    return  (3 * (X[1] ^ 2)) - (12 * X[1]) + (X[2] ^ 2) - (3 * (X[3] ^ 2)) + 8
end

function f1dx(X::Array{Float64} )
    return (2 * X[1]) - 4
end

function f1dy(X::Array{Float64} )
    return 2 * X[2]
end

function f1dz(X::Array{Float64} )
    return 0
end

function f2dx(X::Array{Float64} )
    return (2 * X[1]) - 1
end

function f2dy(X::Array{Float64} )
    return -12
end

function f2dz(X::Array{Float64} )
    return 0
end

function f3cdx(X::Array{Float64} )
    return (6 * X[1]) - 12
end

function f3cdy(X::Array{Float64} )
    return (2 * X[2])
end

function f3cdz(X::Array{Float64} )
    return 6 * X[3]
end

J_1 = [f1ax f1ay; f2ax f2ay]
F_1 = [f1a f2a]

J_2 = [f1bx f1by; f2bx f2by]
F_3 = [f1b f2b]

J_3 = [f1cx f1cy f1cz; f2cx f2cy f2cz; f3cdx f3cdy f3cdz]
F_3 = [f1c f2c f3cd]

J_4 = [f1dx f1dy f1dz; f2dx f2dy f2dz; f3cdx f3cdy f3cdz]
F_4 = [f1d f2d f3cd]

println("Instrucciones: ")
println("Para usar la funcion newton() necesita de 6 argumentos los cuales son:")
println("1.- El Punto inicial. lo declaras en la consola de la siguiente manera → A=[0.0, 0.0, 0.0]")
println("2.- El sistema de ecuaciones. Puede ser F_1 a F_4  los dos primeros teniendo solo dos variables")
println("3.- la matriz jacobiana. Al igual que el segundo argumento → J_1 a J_4")
println("4.- y 5.- la tolerancia siendo un flotante 0.0 y las iteraciones siendo un entero")
println("6.- solo dejalo como: false")

function main()
    opt::Int64

    println("Sistemas de ecuaciones")
    println("1.- f₁(x,y)=x²+xy-10=0")
    println("    f₂(x,y)=y+3xy²-50=0")
    println("")
    println("2.- f₁(x,y)=x²+y²-9=0")
    println("    f₂(x,y)=-ℯ^x-2y-3=0")
    println("")
    println("3.- f₁(x,y,z)=2x²-4x+y²+3z²+6z+2=0")
    println("    f₂(x,y,z)=x²+y²-2y+2z²-5=0")
    println("    f₃(x,y,z)=3x²-12x+y²-3z²+8=0")
    println("")
    println("4.- f₁(x,y,z)=x²-4x+y²=0")
    println("    f₂(x,y,z)=x²-x-12y+1=0")
    println("    f₃(x,y,z)=3x²-12x+y²-3z²+8=0")




end


main()



#=
function main()
    A = [2.0, 3.0]
    R = newton(A, F_1, J_1, 0.005, 10, false)
    println(R)
end



main()
=#
#=
function main()
    A_1 = [1.0, 1.0, 2.0]
    A_2 = [-1.25, -0.75, 2.0]

    J = [f1dx f1dy f1dz; f2dx f2dy f2dz; f3cdx f3cdy f3cdz]
    F = [f1d f2d f3cd]

    R_1 = newton(A_1, F, J, 0.0005, 20, false)
    println(R_1)
    #println("")
    #R_2 = newton(A_2, 0.0005, 10, false)
    #println(R_2)
end

main()
=#
