open Geom2D

type force_on (* = ... *)
       = Grav of int
       
type t = Body.body_id * force_on
