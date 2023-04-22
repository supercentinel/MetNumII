using CSV, Plots, DataFrames
include("min_cuadrados.jl")

data = CSV.read("DatosPort-MinsCuads.xlsx - CasosCovid.csv", DataFrame)

cdmx = [Punto(row.Día, row.CdMx) for row ∈ eachrow(data)]
edomex = [Punto(row.Día, row.EdoMex) for row ∈ eachrow(data)]
nacional = [Punto(row.Día, row.Nacional) for row ∈ eachrow(data)]


m_cdmx_5 = min_cuadrados(cdmx, 5, false)
m_cdmx_6 = min_cuadrados(cdmx, 6, false)

r = range(0, 265, length=100)

plot(title="cdmx covid", show=true, size=(1920, 1080))

for punto ∈ cdmx
    scatter!([punto.x], [punto.y], label="")
end

plot!(r, m_cdmx_5, label="grad=5")
plot!(r, m_cdmx_6, label="grad=6")

readline()
savefig("cdmx.png")


plot(title="EdoMex covid", show=true, size=(1920, 1080))

m_edomex_5 = min_cuadrados(edomex, 5, false)
m_edomex_6 = min_cuadrados(edomex, 6, false)

for punto ∈ edomex
    scatter!([punto.x], [punto.y], label="")
end

plot!(r, m_edomex_6, label="grad=6")
plot!(r, m_edomex_5, label="grad=5")

readline()
savefig("edomex.png")


plot(title="Nacional covid", show=true, size=(1920, 1080))

m_nacional_5 = min_cuadrados(nacional, 5, false)
m_nacional_6 = min_cuadrados(nacional, 6, false)

for punto ∈ nacional
    scatter!([punto.x], [punto.y], label="")
end

plot!(r, m_nacional_6, label="grad=6")
plot!(r, m_nacional_5, label="grad=5")

readline()
savefig("nacional.png")

