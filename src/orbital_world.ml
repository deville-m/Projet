open Config
open World
open Geom2D
open Body
open Force

let world_gui_config =
  { lx = 10.;
    ly = 10.;
    scale = 1.;
    tx = 800;
    ty = 800;
    center = Point.make 5. 5.;

    (* trace = [0;1]; *)
    trace = []; 
    axis = false;
  }


let world_config =
  {
    dt = 0.01;
    t_0 = 0.;
    t_end = 1000.;
    refresh_time = 0.01;
    draw = Some world_gui_config;
    print = [];
    print_file = None
  }


let satellite = 
  { mass = 0.1;
    pos = Point.make 1. 5.;
    spe = Vector.make 0. 7.5;

    radius = 10.;
    col = Graphics.blue;
  }

let satellite' = 
  { mass = 0.1;
    pos = Point.make 10. 5.;
    spe = Vector.make 0. 7.5;

    radius = 10.;
    col = Graphics.red;
  }

let planet =
  {
    mass = 6e12;
    pos = Point.make 5. 5.;
    spe = Vector.nul_vector;
    
    (* We do not display the planet... silly *)
    radius = 20.;
    col = Graphics.green;
  }

let world =
  {
    bodies = [| satellite; satellite'; planet |];
    forces = [ (0, Grav 2); (1, Grav 2) ; (0, Grav 1); (1, Grav 0)];
    g = 6.67e-11
  }
  
