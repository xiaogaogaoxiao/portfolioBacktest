#' @title Checking uninstalled packages written in the portfolio functions defined by customer
#'
#' @description Checke uninstalled packages of portfolio functions written in format form
#'
#' @param folder_path Path for a folder which contains all (and only) functions to be evaluated
#' 
#' @author Daniel P. Palomar and Rui Zhou
#' 
checkUninstalledPackages <- function(folder_path, show_detail = FALSE) {
  if (!require("readtext")) stop("Package \"readtext\" is required to run this function!")
  if (!require("stringi")) stop("Package \"stringi\" is required to run this function!")
  uninstalled_pkgs_all <- c()
  files <- list.files(folder_path)
  for (file in files) {
    suppressWarnings(codes <- readtext(paste0(folder_path, "/", file)))
    pkgs <- stri_extract_all(codes$text, regex = "library\\(.*?\\)", simplify = TRUE)
    if (is.na(pkgs[1])) next
    pkgs <- as.vector(pkgs)
    pkgs <- sub(".*\\(", "", pkgs)
    pkgs <- sub(")", "", pkgs)
    uninstalled_pkgs<- pkgs[! pkgs %in% rownames(installed.packages())]
    uninstalled_pkgs_all <- c(uninstalled_pkgs_all, uninstalled_pkgs)
    
    if (show_detail) 
      if (length(as.vector(uninstalled_pkgs)) != 0)
        cat("find uninstalled packages", uninstalled_pkgs, "in", file, "\n")
  }
  return(unique(uninstalled_pkgs_all))
}

checkRequiredPackages <- function(file_path = NA, folder_path = NA, file_name = NA) {
  if (!require("readtext")) stop("Package \"readtext\" is required to run this function!")
  if (!require("stringi")) stop("Package \"stringi\" is required to run this function!")
  if (is.na(file_path)) file_path <- paste0(folder_path, "/", file_name)
  suppressWarnings(codes <- readtext(file_path))
  pkgs <- stri_extract_all(codes$text, regex = "library\\(.*?\\)", simplify = TRUE)
  if (is.na(pkgs[1])) return(c())
  else {
    pkgs <- as.vector(pkgs)
    pkgs <- sub(".*\\(", "", pkgs)
    pkgs <- sub(")", "", pkgs)
    return(pkgs)
  }
}

detachPackages <- function(items) {
  for (item in items) {
    if (item %in% search()) {
      detach(item, unload = TRUE, character.only = TRUE)
    }
  }
}