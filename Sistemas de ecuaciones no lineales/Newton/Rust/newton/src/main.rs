struct Vector3
{
    x:f64,
    y:f64,
    z:f64,
}

impl Vector3
{
    fn new(_x:f64, _y:f64, _z:f64) -> Self
    {
        Self
        {
            x: _x,
            y: _y,
            z: _z,
        }
    }

    fn norma(&self) -> f64
    {
        return (self.x.powi(2) + self.y.powi(2) + self.z.powi(2)).sqrt()
    }

}

fn f1(x:&Vector3) -> f64
{
    return x.x.powi(2) + x.y + (2.0 * x.z.powi(2)) - 10.0;
}

fn f2(x:&Vector3) -> f64
{
    return (5.0 * x.x) - (6.0 * x.y) + x.z;
}

fn f3(x:&Vector3) -> f64
{
    return x.z - x.x.powi(2) - x.y.powi(2);
}
//con respecto a y
fn f1d(x:&Vector3) -> f64
{
    return 1.0;
}
//con respecto a x
fn f2d(x:&Vector3) -> f64
{
    return 5.0;
}
//con respecto a z
fn f3d(x:&Vector3) -> f64
{
    return 1.0;
}

fn newton_mod(v:&Vector3, tolerancia:f64, iteraciones:u32) -> Vector3
{
    let mut x:Vector3 = Vector3 {x:v.x, y:v.y, z:v.z};
    let mut f_x_k:Vector3 = Vector3::new(0.0, 0.0, 0.0);
    let mut df_x_k:Vector3 = Vector3::new(0.0, 0.0, 0.0);
    let mut e_a:f64 = 0.0;
    let mut k:u32 = 0;

    println!("|{:<4}|{:<20.15}|{:<20.15}|{:<20.15}|{:<20.15}|", "k", "X^k", "F(X^k)", "dF(X^k)", "Error");
    println!("------------------------------------------------------------------------------------------");

    loop
    {
        f_x_k.x = f2(&x);
        f_x_k.y = f1(&x);
        f_x_k.z = f3(&x);

        df_x_k.x = f2d(&x);
        df_x_k.y = f1d(&x);
        df_x_k.z = f3d(&x);

        e_a = f_x_k.norma();

        println!("|{:<4}|{:<20.15}|{:<20.15}|{:<20.15}|{:<20.15}|", k, x.x, f_x_k.x, df_x_k.x, e_a);
        println!("|{:<4}|{:<20.15}|{:<20.15}|{:<20.15}|", "", x.y, f_x_k.y, df_x_k.y);
        println!("|{:<4}|{:<20.15}|{:<20.15}|{:<20.15}|", "", x.z, f_x_k.z, df_x_k.z);
        println!("------------------------------------------------------------------------------------------");

        if e_a <= tolerancia {break};
        if k >= iteraciones {break} ;

        x.x = x.x - ((f_x_k.x)/(df_x_k.x));
        x.y = x.y - ((f_x_k.y)/(df_x_k.y));
        x.z = x.z - ((f_x_k.z)/(df_x_k.z));

        k += 1;
    }


    return x;
}

fn main()
{
    let a:Vector3 = Vector3::new(1.0, 1.0, 2.0);
    let r:Vector3 = newton_mod(&a, 0.005, 100);
    println!("Resultado");
    println!("|{:<20.15}|{:<20.15}|{:<20.15}|", r.x, r.y, r.z);
}
