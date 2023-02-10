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

fn g_1(x:f64, y:f64)
{
}

fn g_2(x:f64, y:f64)
{
}

fn punto_fijo_sucesivo(x:f64, y:f64, tolerancia:f64, iteraciones:i32)
{
    let mut k: i32 = 0;
    let mut E_a: f64 = 1.0;
    let mut p = Punto::new(0.0, 0.0);




    loop
    {
        if k >= iteraciones {break};
        if E_a < tolerancia {break};
    }
    
}



fn main() {
    println!("Hello, world!");
}
