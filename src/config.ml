open Force
open World
open Geom2D

type to_print = X | Y | SX | SY 

type gui_config =
  { lx : float;
    ly : float;
    scale : float;
    tx : int;
    ty : int;
    center : point;

    trace : Body.body_id list ;
    axis : bool;
  }

type world_config = {
  dt : float;
  t_0 : float;
  t_end : float;
  refresh_time : float;
  draw : gui_config option;
  print : (Body.body_id * to_print) list;
  print_file : string option
}
