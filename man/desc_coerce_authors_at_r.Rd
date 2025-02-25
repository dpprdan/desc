% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/non-oo-api.R
\name{desc_coerce_authors_at_r}
\alias{desc_coerce_authors_at_r}
\title{Coerce Author and Maintainer Fields to Authors@R}
\usage{
desc_coerce_authors_at_r(file = ".", normalize = FALSE)
}
\arguments{
\item{file}{DESCRIPTION file to use. By default the DESCRIPTION
file of the current package (i.e. the package the working directory
is part of) is used.}

\item{normalize}{Whether to "normalize" (reorder and reformat) the fields when writing back
the result. See \code{\link[=desc_normalize]{desc_normalize()}}.}
}
\description{
Convert the \code{Author} and \code{Maintainer} fields to
\code{Authors@R}, which is necessary for other functions such as
\code{desc_get_authors()}.
}
\details{
If the \code{Authors@R} field does not exist,
\code{desc_coerce_authors_at_r} tries to parse the \code{Author} and
\code{Maintainer} fields with \code{\link[utils:person]{utils::as.person()}} and writes
them to the \code{Authors@R} field.
Note that \code{Author} and \code{Maintainer} are free-form fields, so
parsing them may fail.
}
\seealso{
Other Authors@R: 
\code{\link{desc_add_author}()},
\code{\link{desc_add_author_gh}()},
\code{\link{desc_add_me}()},
\code{\link{desc_add_orcid}()},
\code{\link{desc_add_role}()},
\code{\link{desc_add_ror}()},
\code{\link{desc_change_maintainer}()},
\code{\link{desc_del_author}()},
\code{\link{desc_del_role}()},
\code{\link{desc_get_author}()},
\code{\link{desc_get_authors}()},
\code{\link{desc_get_maintainer}()},
\code{\link{desc_set_authors}()}
}
\concept{Authors@R}
