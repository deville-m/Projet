open Geom2D


(** Evaluates an actual force as a vector *)
val eval_force : World.t -> Force.t -> vector

(** Creates an array binding each [body_id] (e.g. indexes of the
    array) to the sum of all forces applied onto the body represented
    by body_id *)
val sum_force : World.t -> vector array


(** Applies the Fundamental Principle of Dynamics (2nd law of Newton)
    on each body with a step in time *)
val step : World.t -> vector array -> float -> World.t
