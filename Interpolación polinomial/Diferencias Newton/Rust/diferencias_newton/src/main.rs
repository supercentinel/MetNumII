struct Punto
{
    x: f64,
    y: f64,
}

impl Punto
{
    fn new(_x:f64, _y:f64) -> Self
    {
        Self
        {
            x: _x,
            y: _y,
        }
    }
}

fn diferencias_newton(puntos:&Vec<Punto>, est:f64, grado:i64) -> f64
{
    let mut estimacion:f64 = 0.0;

    let mut dif_tab = [[1.0; 5]; 5];

    for i in 1..5
    {
        for j in 1..5
        {
            print!("dif tab[{}][{}] = {}", i, j, dif_tab[i][j]);
        }
        println!();
    }


    return estimacion
}



fn main()
{
    let puntos: Vec<Punto> = vec![Punto::new(1.2, 1.4), Punto::new(5.0, 2.0)];
    let p = Punto::new(1.0, 2.8);

    let ps = [Punto::new(1.0, 2.0); 5];

    //print!("p.x = {}, p.y = {}", puntos[0].x, puntos[0].y);

    for i in 0..puntos.len()
    {
        println!("psadunto[{}] x = {} y = {}", i, puntos[i].x, puntos[i].y);
    }


    let est = diferencias_newton(&puntos, 2.5, 4);
}
