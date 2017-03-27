type point = {x : float; y : float }
type vector = {dx : float; dy : float }

let pi = 4. *. atan 1.

module Vector = struct

  let make dx dy = {dx;dy}

  let nul_vector = make 0. 0.

  let x_coord (v:vector) = v.dx
  let y_coord (v:vector) = v.dy

  let of_points (a: point) (b : point) : vector =
    assert false
      
  let magnitude ({dx;dy}:vector) =
    assert false

  let normalize (({dx;dy} as v):vector) =
    assert false
           
  let dot_product ({dx=a;dy=b}:vector) ({dx=d;dy=e}:vector) =
    assert false

  let scal_mult f ({dx;dy}:vector) : vector =
    assert false

  let opposite v =
    assert false

  let add (v1:vector) (v2:vector) : vector = 
    assert false

  let substract v1 v2 =
    assert false

  let string_of_vector {dx;dy} =
    Format.sprintf "@[(%f,%f)@]" dx dy

end

module Point = struct
    
  let make x y = {x; y}

  let origin = make 0. 0. 

  let x_coord p = p.x
  let y_coord p = p.y

  let distance_sq {x=a;y=b} {x=d;y=e} =
    assert false

  let distance p1 p2 =
    assert false
    
  let translate_vector ({x;y} ) ({dx;dy} : vector) = 
    assert false

  let string_of_point {x;y} =
    Format.sprintf "@[(%f,%f)@]" x y
    
end
