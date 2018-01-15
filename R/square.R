#' @title squares number(s)
#' @description
#' based on a fortran subroutine or calculated in R, depending in type
#' @param x single number or even a vector containing numerical values
#' @param type character value: language which shall be used for calculating: 'Fortran' or 'R'
#' @examples
#' require(microbenchmark)
#' microbenchmark(square(1:1000, type = "Fortran"), square(1:1000, type = "R"))
#' @useDynLib testFortran
#' @export

square <- function(x, type = c("Fortran", "R")) {
  type <- match.arg(type)
  stopifnot(is.numeric(x))

  if(type == "Fortran") {
    out <- .Fortran(
      "square",
      x = as.double(x),
      n = length(x),
      PACKAGE = "testFortran"
    )$x
  }

  if(type == "R") {
    out <- x*x
  }

  return(out)
}
