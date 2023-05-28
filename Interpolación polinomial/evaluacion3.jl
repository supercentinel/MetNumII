using Plots

include("Spline Cúbico/Julia/Spline_c.jl")
include("Mínimos Cuadrados/Julia/min_cuadrados.jl")
include("Mínimos Cuadrados no polinomiales/Julia/exponencial.jl")
include("Mínimos Cuadrados no polinomiales/Julia/potencial.jl")


#Primera parte
perro = Array{Punto}(undef, 17)

perro[1] = Punto(0.4, 5.4)
perro[2] = Punto(1.0, 6.0)
perro[3] = Punto(1.7, 6.4)
perro[4] = Punto(2.1, 7.0)
perro[5] = Punto(2.5, 7.3)
perro[6] = Punto(3.3, 7.2)
perro[7] = Punto(3.8, 6.6)
perro[8] = Punto(3.9, 6.0)
perro[9] = Punto(4.0, 5.2)
perro[10] = Punto(4.6, 4.8)
perro[11] = Punto(5.5, 4.9)
perro[12] = Punto(6.2, 5.3)
perro[13] = Punto(6.9, 5.4)
perro[14] = Punto(7.5, 5.3)
perro[15] = Punto(8.1, 5.1)
perro[16] = Punto(8.6, 4.6)
perro[17] = Punto(8.8, 4.1)

g = Spline_C(perro, true)

plot(show=true, size=(1920, 1080), title="perro")

for i in axes(g, 1)
    r = range(perro[i].x, perro[i+1].x, length=100)
    plot!(r, g[i], label="")
end

readline()
savefig("perro.png")

#Segunda parte

min_c = Array{Punto}(undef, 24)

min_c[1] = Punto(0.1, 1.9)
min_c[2] = Punto(1.1, 7.9)
min_c[3] = Punto(1.6, 24.9)
min_c[3] = Punto(2.4, 25.2)
min_c[5] = Punto(2.5, 34.9)
min_c[6] =  Punto(4.1, 42.7)
min_c[7] =  Punto(5.2, 29.7)
min_c[8] =  Punto(6.1, 42.6)
min_c[9] =  Punto(6.6, 36.1)
min_c[10] = Punto(7.1, 23.7)
min_c[11] = Punto(8.2, 13.0)
min_c[12] = Punto(9.1, 12.7)
min_c[13] = Punto(9.4, -3.1)
min_c[14] = Punto(11.,1 -13.0)
min_c[16] = Punto(12.,2 -39.5)
min_c[17] = Punto(13.,2 -48.6)
min_c[18] = Punto(14.,1 -40.2)
min_c[19] = Punto(15.,6 -51.6)
min_c[20] = Punto(16.,1 -30.5)
min_c[21] = Punto(17.,6 -34.6)
min_c[22] = Punto(17.,9 -16.4)
min_c[23] = Punto(19.,1 -13.4)
min_c[24] = Punto(20.0 ,-1.1)

println("min_c cuadrados")
m_2 = min_cuadrados(min_c, 2, true)
err_m_2::Float64 = 0.0
println("min_c cubicos")
m_3 = min_cuadrados(min_c, 3, true)
err_m_3::Float64 = 0.0


plot(show=true, size=(1920, 1080), title="min cuadrados polinomial")

for punto ∈ min_c
    scatter!([punto.x], [punto.y], label="")
    global err_m_2 += (punto.y - m_2(punto.x))^2
    global err_m_3 += (punto.y - m_3(punto.x))^2
end

r = range(min_c[1].x, min_c[24].x, length=100)
plot!(r, m_2, label="cuadrados")
plot!(r, m_3, label="cubicos")

println("Error cuadrado = ", err_m_2)
println("Error Cúbico = ", err_m_3)


readline()
savefig("min_c.png")

#tercera parte
min_np = Array{Punto}(undef, 20)
err_mn_2::Float64 = 0.0
err_mn_3::Float64 = 0.0

min_np[1] = Punto(3.5, 19.0)
min_np[2] = Punto(3.62, 20.0)
min_np[3] = Punto(3.95, 30.0)
min_np[4] = Punto(4.2, 30.0)
min_np[5] = Punto(4.63, 40.0)
min_np[6] = Punto(4.91, 40.0)
min_np[7] = Punto(5.1, 52.0)
min_np[8] = Punto(5.58, 70.0)
min_np[9] = Punto(5.82, 70.0)
min_np[10] = Punto(6.23, 102.0)
min_np[11] = Punto(6.5, 122.0)
min_np[12] = Punto(6.8, 140.0)
min_np[13] = Punto(7.11, 180.0)
min_np[14] = Punto(7.4, 216.0)
min_np[15] = Punto(7.82, 250.0)
min_np[16] = Punto(7.95, 310.0)
min_np[17] = Punto(8.17, 340.0)
min_np[18] = Punto(8.22, 355.0)
min_np[19] = Punto(8.4, 370.0)
min_np[20] = Punto(8.5, 400.0)

println("Potencial")
pot = min_potencial(min_np ,true)
println("Exponencial")
expo = min_exponencial(min_np, 1.0, true)

plot(show=true, size=(1920, 1080), title="min cuadrados no polinomial")

for punto ∈ min_np
    scatter!([punto.x], [punto.y], label="")
    global err_mn_2 += (punto.y - pot(punto.x))^2
    global err_mn_3 += (punto.y - expo(punto.x))^2
end

r = range(min_np[1].x, min_np[20].x, length=100)
plot!(r, expo, label="exponencial")
plot!(r, pot, label="potencial")

println("Error potencial = ", err_mn_2)
println("Error exponencial = ", err_mn_3)

readline()
savefig("min_np.png")
