use std::num;

struct Punto {
    x: f64,
    y: f64,
}

fn g_1(x: f64, y: f64) -> f64
{
    ((x * x) - y + 0.5)/2.0
}

fn g_2(x: f64, y: f64) -> f64
{
    (-(x * x) - (4.0 * (y * y)) + (8.0 * y) + 4.0)/(8.0)
}

fn punto_fijo(x_0: f64, y_0: f64, tolerancia: f64, iteraciones: u32) -> Punto
{
    let mut p = Punto
    {
        x: 0.0,
        y: 0.0,
    };
    let mut pe = Punto
    {
        x: 0.0,
        y: 0.0,
    };

    let mut k: u32 = 0;
    let mut x_k: f64 = 0.0;
    let mut y_k: f64 = 0.0;
    let mut e_a: f64;

    p.x = x_0;
    p.y = y_0;

    println!("|{:<4}|{:<25}|{:<25}|{:<25}|", "k", "x_k", "y_k", "E_a");

    loop
    {
        pe.x = p.x - x_k;
        pe.y = p.y - y_k;

        x_k = p.x;
        y_k = p.y;

        if pe.x == 0.0
        {
            pe.y = pe.y.powi(2);
            e_a = pe.y.sqrt();
        }else if pe.y == 0.0
        {
            pe.x = pe.x.powi(2);
            e_a = pe.x.sqrt();
        }else
        {
            pe.y = pe.y.powi(2);
            pe.x = pe.x.powi(2);
            e_a = (pe.x + pe.y).sqrt();
        }

        println!("|{:<4}|{:<25}|{:<25}|{:<25}|", k, x_k, y_k, e_a);

        if k >= iteraciones {break};
        if e_a < tolerancia {break};

        p.x = g_1(x_k, y_k);
        p.y = g_2(x_k, y_k);

        k += 1;
    }

    return p;
}
fn main() {
    let p = punto_fijo(0.0, 1.0, 0.000005, 10);
}
