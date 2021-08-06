buildEnv <- function (
    collate , parent = as.environment ( 2 ) ,
    name = NULL , .name = NULL ) {

    iENV   <- collate [ , 1 ] + 1L
    FILES  <- collate [ , 2 ]
    NNAMED <- ! is.null (  name )
    .NAMED <- ! is.null ( .name )

    Endo <- new.env ( parent = parent )
    attr ( Endo , "name" ) <-
            if ( .NAMED ) .name else
            if ( NNAMED ) paste0 ( "." , name )

    Exo <- new.env ( parent = Endo )
    attr ( Exo , "name" ) <- if ( NNAMED ) name

    for ( i in seq_along ( FILES ) ) source (
        file = FILES [[ i ]] ,
        local = c ( Endo , Exo ) [[ iENV [[ i ]] ]] )

    Exo }
