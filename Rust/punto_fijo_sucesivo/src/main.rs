use std::num;

struct Punto
{
    x: f64,
    y: f64,
}

impl Punto
{
    fn new(_x:f64, _y:f64) -> Self
    {
        Self {
            x: _x,
            y: _y,
        }
    }

    fn distancia(&self, otro: &Punto) -> f64
    {
        return ((self.x - otro.x).powi(2) + (self.y - otro.y).powi(2)).sqrt(); 
    }
}

fn g_1(x:f64, y:f64) -> f64
{
    return -(((x * x) - y - 2.0 - (4.0 * x))/(4.0));
}

fn g_2(x:f64, y:f64) -> f64
{
    return -(((2.0 * x * y) - 3.0 - (5.0 * y))/(5.0));
}

fn punto_fijo_sucesivo(x:f64, y:f64, tolerancia:f64, iteraciones:u32) -> Punto
{
    let mut k: u32 = 0;
    let mut e_a: f64 = 1.0;
    let mut p = Punto::new(0.0, 0.0);
    let mut p_km1: Punto = Punto::new(0.0, 0.0);

    p.x = x;
    p.y = y;

    println!("|{:<4}|{:<25}|{:<25}|{:<25}|", "k", "x_k", "y_k", "E_a");

    loop
    {
        p_km1.x = p.x;
        p_km1.y = p.y;

        println!("|{:<4}|{:<25}|{:<25}|{:<25}|", k, p.x, p.y, e_a);

        p.x = g_1(p.x, p.y);
        p.y = g_2(p.x, p.y);

        e_a = p.distancia(&p_km1);


        if k >= iteraciones {break};
        if e_a < tolerancia {break};

        k += 1;
    }

    return p;
}

fn main() {
    punto_fijo_sucesivo(1.75, 1.0, 0.00008, 100);
}
