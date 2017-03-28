open Geom2D
open Body
open Graphics
open World
open Force
open Config

let traces = Hashtbl.create 12

let foi = float
let iof = int_of_float

let pi = 4. *. atan 1.

let lpos = ref []

let draw_world (w : World.t) (gui_conf : gui_config) =
  clear_graph ();
  let sx = size_x () and sy = size_y () in
  let scx = foi sx /. gui_conf.lx and scy = foi sy /. gui_conf.ly in

  let centerx, centery =
    Point.x_coord gui_conf.center, Point.y_coord gui_conf.center
  in
  let of_real_space (p : point) =
    let rescale a b =
      iof ((a -. centerx) *. scx) + sx/2, iof ((b -. centery) *. scy) + sy/2
    in
    rescale (Point.x_coord p) (Point.y_coord p)
  in

  (* Tracing bodies *)
  List.iter ( fun i ->
    try let l = Hashtbl.find traces i in
        let (px,py) = of_real_space w.bodies.(i).pos in
        Hashtbl.replace traces i ((px,py) :: l)
    with
    |Not_found ->
      let (px,py) = of_real_space w.bodies.(i).pos in
      Hashtbl.add traces i ((px,py) :: [])
  ) gui_conf.trace;

  (* Drawing traces *)
  List.iter ( fun i ->
    try let l = Hashtbl.find traces i in
        Graphics.set_color w.bodies.(i).col;
        let _ = List.fold_left (fun acc (c,d) -> match acc with
          |None -> Some((c,d))
          |Some(a,b) -> (Graphics.moveto a b; Graphics.lineto c d; Some((c,d)))
        ) None l
        in ()
    with
    |Not_found -> ()
  ) gui_conf.trace;

  (* Drawing Bodies  *)
  lpos := [];
  Array.iteri (fun i x ->
    let (px,py) = of_real_space x.pos in
    set_color x.col;
    let circle_radius = iof (gui_conf.scale *. x.radius) in
    fill_circle px py circle_radius;
    lpos := ((px,py),circle_radius,i) :: (!lpos)
  ) w.bodies

(* Drawing Springs  *)
(* List.iter (fun (i,x) -> *)
(*   match x with *)
(*   |Spri(k,l,j) -> *)
(*      let (pix,piy),_ = of_real_space w.bodies.(i).pos in *)
(*      let (pjx,pjy),_ = of_real_space w.bodies.(j).pos in *)
(*      let ratio = atan ((k *. Vector3D.magnitude (Vector3D.of_points w.bodies.(i).pos w.bodies.(j).pos)) -. l) in *)
(*      (\* Printf.printf "ratio : %f\n%!" ratio; *\) *)
(*      let mc = Graphics.rgb (min 255 (iof ((512./.(pi/.2.)) *. (abs_float ratio)))) (min 255 (iof ((512. *. (1. -. (abs_float ratio)/.(pi/.2.)))))) 0 in *)
(*      Graphics.set_color mc; *)
(*      Graphics.moveto pix piy; *)
(*      Graphics.lineto pjx pjy *)
(*   |_ -> () *)
(* ) w.forces *)
