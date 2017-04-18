open Config

let doifnotnone f opt =
  match opt with
  |Some(x) -> f x
  |None -> ()

let run_world (world : World.t) (config : Config.world_config) =

  let () =
    match config.draw with
    |Some gui_config -> 
      Graphics.open_graph (Printf.sprintf " %dx%d" gui_config.tx gui_config.ty)
    |None -> ()
  in

  (* (\* Output channel *\) *)
  (* let oc_log = match config.print_file with *)
  (*   |Some(s) -> Some(open_out s) *)
  (*   |None -> None *)
  (* in *)

  let rec loop world t =

    let t_beg = Unix.time () in
    if t < config.t_end then
      begin
	let sf = Physic.sum_force world in
	let next_world = Physic.step world sf config.dt in

	(* Logging Section  *)
	(* TODO : faire le système de log *)
	(* Drawing Section  *)

	begin
	  match config.draw with
	  | Some gui_config -> Gui.draw_world world gui_config
	  | None -> ()
	end;

	let t_now = Unix.time () in
	Printf.printf "%f\n%!" t_now;
        Unix.sleepf (config.refresh_time -. (t_now -. t_beg));
	loop next_world (t +. config.dt)
      end
  in

  loop world config.t_0

(* let current_world = Orbital_world.world *)
(* let current_world_config = Orbital_world.world_config *)

let current_world = Ball_world.world
let current_world_config = Ball_world.world_config

let () =
  run_world current_world current_world_config
