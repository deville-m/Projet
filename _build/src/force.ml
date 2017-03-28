open Geom2D

type force_on = Grav of Body.body_id
       
type t = Body.body_id * force_on
