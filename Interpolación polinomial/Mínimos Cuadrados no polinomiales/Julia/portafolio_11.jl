using Plots, CSV, DataFrames
include("potencial.jl")
include("exponencial.jl")
include("../../Mínimos Cuadrados/Julia/min_cuadrados.jl")

data = CSV.read("CasosCovid - Covid2022.csv", DataFrame)

confirmados = [Punto(row.Día, row.CasosConfirmados) for row ∈ eachrow(data)]
fallecidos = [Punto(row.Día, row.Fallecimientos) for row ∈ eachrow(data)]

r = range(6, 40, length=100)

pol_c = min_cuadrados(confirmados, 2, true)
pot_c = min_potencial(confirmados, false)

plot(title="Covid confirmados", show=true, size=(1920, 1080))


for punto ∈ confirmados
    scatter!([punto.x], [punto.y], label="")
end

plot!(r, pol_c, label="polinomial grad()=2")
plot!(r, pot_c, label="potencial")

readline()
savefig("contagios.png")

plot(title="Covid fallecidos", show=true, size=(1920, 1080))

ex_f = min_exponencial(fallecidos, 1.0, false)
pol_f = min_cuadrados(fallecidos, 2, true)

for punto ∈ fallecidos
    scatter!([punto.x], [punto.y], label="")
end

plot!(r, ex_f, label="exponencial")
plot!(r, pol_f, label="polinomial grad()=2")

readline()
savefig("fallecidos")
