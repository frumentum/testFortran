#' gives factorial of n
#' based on a simple fortran function \code{faculty} calculates the factorial of n.
#' @export

facto <- function(n, type = c("Fortran", "R")) {
  type <- match.arg(type)

  if(type == "Fortran") {
    out <- .Fortran(
      "facto",
      n = as.integer(n),
      answer = as.integer(1),
      PACKAGE = "testFortran"
    )$answer
  }

  if(type == "R") {
    out <- factorial(n)
  }

  return(out)
}
