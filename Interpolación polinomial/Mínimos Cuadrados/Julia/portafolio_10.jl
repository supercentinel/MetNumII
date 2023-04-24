using CSV, Plots, DataFrames
include("min_cuadrados.jl")

data = CSV.read("DatosPort-MinsCuads.xlsx - CasosCovid.csv", DataFrame)

cdmx = [Punto(row.Día, row.CdMx) for row ∈ eachrow(data)]
edomex = [Punto(row.Día, row.EdoMex) for row ∈ eachrow(data)]
nacional = [Punto(row.Día, row.Nacional) for row ∈ eachrow(data)]

err_cdmx = zeros(Float64, 6, 1)
err_edomex = zeros(Float64, 6, 1)
err_nacional = zeros(Float64, 6, 1)

m_cdmx_3 = min_cuadrados(cdmx, 3, true)
m_cdmx_4 = min_cuadrados(cdmx, 4, true)
m_cdmx_5 = min_cuadrados(cdmx, 5, true)
m_cdmx_6 = min_cuadrados(cdmx, 6, true)
m_cdmx_7 = min_cuadrados(cdmx, 7, true)
m_cdmx_8 = min_cuadrados(cdmx, 8, true)

r = range(0, 265, length=100)

plot(title="cdmx covid", show=true, size=(1920, 1080))

for punto ∈ cdmx
    scatter!([punto.x], [punto.y], label="")
    err_cdmx[1] += (punto.y - m_cdmx_3(punto.x))^2
    println(punto.y ," - ", m_cdmx_3(punto.x),")^2 = ",(punto.y - m_cdmx_3(punto.x))^2)
    err_cdmx[2] += (punto.y - m_cdmx_4(punto.x))^2
    err_cdmx[3] += (punto.y - m_cdmx_5(punto.x))^2
    err_cdmx[4] += (punto.y - m_cdmx_6(punto.x))^2
    err_cdmx[5] += (punto.y - m_cdmx_7(punto.x))^2
    err_cdmx[6] += (punto.y - m_cdmx_8(punto.x))^2
end

for i ∈ axes(err_cdmx,1)
    println("error P_", i+2,"(x) = ", err_cdmx[i])
end

plot!(r, m_cdmx_3, label="grad=3")
plot!(r, m_cdmx_4, label="grad=4")
plot!(r, m_cdmx_5, label="grad=5")
plot!(r, m_cdmx_6, label="grad=6")
plot!(r, m_cdmx_7, label="grad=7")
plot!(r, m_cdmx_8, label="grad=8")

readline()
savefig("cdmx.png")


plot(title="EdoMex covid", show=true, size=(1920, 1080))

m_edomex_3 = min_cuadrados(edomex, 3, true)
m_edomex_4 = min_cuadrados(edomex, 4, true)
m_edomex_5 = min_cuadrados(edomex, 5, true)
m_edomex_6 = min_cuadrados(edomex, 6, true)
m_edomex_7 = min_cuadrados(edomex, 7, true)
m_edomex_8 = min_cuadrados(edomex, 8, true)

for punto ∈ edomex
    scatter!([punto.x], [punto.y], label="")
    err_edomex[1] += (punto.y - m_edomex_3(punto.x))^2
    err_edomex[2] += (punto.y - m_edomex_4(punto.x))^2
    err_edomex[3] += (punto.y - m_edomex_5(punto.x))^2
    err_edomex[4] += (punto.y - m_edomex_6(punto.x))^2
    err_edomex[5] += (punto.y - m_edomex_7(punto.x))^2
    err_edomex[6] += (punto.y - m_edomex_8(punto.x))^2
end

for i ∈ axes(err_cdmx,1)
    println("error P_", i+2,"(x) = ", err_edomex[i])
end

plot!(r, m_edomex_3, label="grad=3")
plot!(r, m_edomex_4, label="grad=4")
plot!(r, m_edomex_5, label="grad=5")
plot!(r, m_edomex_6, label="grad=6")
plot!(r, m_edomex_7, label="grad=7")
plot!(r, m_edomex_8, label="grad=8")

readline()
savefig("edomex.png")

plot(title="Nacional covid", show=true, size=(1920, 1080))

m_nacional_3 = min_cuadrados(nacional, 3, true)
m_nacional_4 = min_cuadrados(nacional, 4, true)
m_nacional_5 = min_cuadrados(nacional, 5, true)
m_nacional_6 = min_cuadrados(nacional, 6, true)
m_nacional_7 = min_cuadrados(nacional, 7, true)
m_nacional_8 = min_cuadrados(nacional, 8, true)

for punto ∈ nacional
    scatter!([punto.x], [punto.y], label="")
    err_nacional[1] += (punto.y - m_nacional_3(punto.x))^2
    err_nacional[2] += (punto.y - m_nacional_4(punto.x))^2
    err_nacional[3] += (punto.y - m_nacional_5(punto.x))^2
    err_nacional[4] += (punto.y - m_nacional_6(punto.x))^2
    err_nacional[5] += (punto.y - m_nacional_7(punto.x))^2
    err_nacional[6] += (punto.y - m_nacional_8(punto.x))^2
end

for i ∈ axes(err_cdmx,1)
    println("error P_", i+2,"(x) = ", err_nacional[i])
end

plot!(r, m_nacional_3, label="grad=3")
plot!(r, m_nacional_4, label="grad=4")
plot!(r, m_nacional_5, label="grad=5")
plot!(r, m_nacional_6, label="grad=6")
plot!(r, m_nacional_7, label="grad=7")
plot!(r, m_nacional_8, label="grad=8")

readline()
savefig("nacional.png")
