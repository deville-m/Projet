open Force
open World
open Geom2D

type to_print = X | Y | SX | SY 

type gui_config =
  { 
    (* World's width *)
    lx : float;
    (* World's height *)
    ly : float;

    (* Scaling factor *)
    scale : float;
    
    (* Screen width *)
    tx : int;
    (* Screen height *)
    ty : int;

    (* Camera position *)
    center : point;

    (* Bodies we should trace *)
    trace : Body.body_id list ;
    (* Display axis *)
    axis : bool;
  }

type world_config = {
  (* Delta of time between each physical step *)
  dt : float;

  (* Initial time *)
  t_0 : float;

  (* End time *)
  t_end : float;

  (* Sleeping time <=> Frame Per Second *)
  refresh_time : float;

  (* GUI configuration *)
  draw : gui_config option;

  (* Bodies and their coordinates to log *)
  print : (Body.body_id * to_print) list;
  (* Log output file *)
  print_file : string option
}
