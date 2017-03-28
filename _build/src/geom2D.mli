type point
type vector

module Vector : sig 

  val nul_vector : vector

  val make : float -> float -> vector

  val x_coord : vector -> float
  val y_coord : vector -> float

  val of_points : point -> point -> vector
  val magnitude : vector -> float
  val normalize : vector -> vector
  val dot_product : vector -> vector -> float

  val scal_mult : float -> vector -> vector
  val opposite : vector -> vector

  val add : vector -> vector -> vector
  val substract : vector -> vector -> vector

  val string_of_vector : vector -> string

end

module Point : sig
    
  val make : float -> float -> point

  val origin : point

  val distance_sq : point -> point-> float
  val distance : point -> point-> float

  val x_coord : point -> float
  val y_coord : point -> float

  val translate_vector : point -> vector -> point

  val string_of_point : point -> string
    
end
