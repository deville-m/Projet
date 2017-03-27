open Geom2D 

type body_id = int

type t = {
  mass : float ;
  pos : point ;
  spe : vector ;

  radius : float ;
  col : Graphics.color ;

(** Extension pour les prochains TPs *)
(* charge : float ; *)
(* movable : bool *)
}

