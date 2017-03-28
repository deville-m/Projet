open Geom2D
open Force

type t = {
  bodies : Body.t array ;
  forces : Force.t list ;
  g : float ;

}
