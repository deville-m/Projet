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

    trace = [0;1;2];
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


let ball = 
  { mass = 0.1;
    pos = Point.make 1. 1.;
    spe = Vector.make 7.5 7.5;

    radius = 10.;
    col = Graphics.blue;
  }

let ball2 = 
  { mass = 0.1;
    pos = Point.make 1. 1.;
    spe = Vector.make 7.5 7.5;

    radius = 10.;
    col = Graphics.red;
  }

let ball3 = 
  { mass = 0.1;
    pos = Point.make 5. 7.5;
    spe = Vector.nul_vector;

    radius = 10.;
    col = Graphics.green;
  }

let earth =
  {
    mass = 6e24;
    pos = Point.make 0. (-. 6300000.);
    spe = Vector.nul_vector;
    
    (* We do not display the earth... silly *)
    radius = 0.;
    col = Graphics.black;
  }

let world =
  {
    bodies = [| ball; ball2; earth |]; 
    forces = [ (0, Grav 3); (1, Grav 3); 
	       (3, Grav 0); (3, Grav 1); 
	       (1, Fric 0.05) ];
    g = 6.67e-11
  }
  
