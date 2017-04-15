open Geom2D
open Force
open World
open Body

let eval_force w (i,f) =
  match f with
  |Grav(j) -> let a = w.bodies.(i) in
	      let b = w.bodies.(j) in
	      let ab = Vector.of_points a.pos b.pos in
	      let mass_mult = a.mass *. b.mass in
	      Vector.scal_mult (w.g *. mass_mult /. ((Vector.magnitude ab) ** 3.)) ab

let sum_force w =
  let res = Array.make (Array.length w.bodies) (Vector.nul_vector) in
  List.iter (fun (i, f)  ->  res.(i) <- Vector.add (eval_force w (i, f)) res.(i)) w.forces;
  res
	
         
let step w sfl dt =
  Array.iteri (fun id body ->
      w.bodies.(id) <- {
                   mass = body.mass;
                   pos = body.pos;
                   spe = (Vector.add body.spe (Vector.scal_mult (dt /. body.mass) sfl.(id)));
                   radius = body.radius;
                   col = body.col;
                 }
    ) w.bodies;
  w
