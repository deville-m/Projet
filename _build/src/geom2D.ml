type point = {x : float; y : float }
type vector = {dx : float; dy : float }

let pi = 4. *. atan 1.

module Vector = struct

  let make dx dy = {dx;dy}

  let nul_vector = make 0. 0.

  let x_coord (v:vector) = v.dx
  let y_coord (v:vector) = v.dy

  let of_points (a: point) (b : point) : vector =
    {dx = b.x -. a.x; dy = b.y -. a.y}
      
  let magnitude ({dx;dy}:vector) =
    sqrt (dx *. dx +. dy *. dy)
           
  let dot_product vect1 vect2 =
    vect1.dx *. vect2.dx +. vect1.dy *. vect2.dy

  let scal_mult f vect =
    {dx = f *. vect.dx; dy = f *. vect.dy}

  let normalize ({dx;dy} as v) =
    scal_mult (1. /. (magnitude v)) v

  let opposite v =
    scal_mult (-.1.) v

  let add (v1:vector) (v2:vector) : vector = 
    {dx = v1.dx +. v2.dx; dy = v1.dy +. v2.dy}

  let substract v1 v2 =
    add v1 (opposite v2)

  let string_of_vector {dx;dy} =
    Format.sprintf "@[(%f,%f)@]" dx dy

end

module Point = struct
    
  let make x y = {x; y}

  let origin = make 0. 0. 

  let x_coord p = p.x
  let y_coord p = p.y

  let distance_sq {x=a;y=b} {x=d;y=e} =
    (a -. d) *. (a -. d) +. (b -. e) *. (b -. e)

  let distance p1 p2 =
    sqrt (distance_sq p1 p2)
    
  let translate_vector pt vect =
    {x = pt.x +. vect.dx; y = pt.y +. vect.dy}

  let string_of_point {x;y} =
    Format.sprintf "@[(%f,%f)@]" x y
    
end
