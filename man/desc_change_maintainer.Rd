% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/non-oo-api.R
\name{desc_change_maintainer}
\alias{desc_change_maintainer}
\title{Change maintainer of the package, in DESCRIPTION}
\usage{
desc_change_maintainer(
  given = NULL,
  family = NULL,
  email = NULL,
  comment = NULL,
  orcid = NULL,
  file = ".",
  normalize = FALSE
)
}
\arguments{
\item{given}{Given name.}

\item{family}{Family name.}

\item{email}{Email address.}

\item{comment}{Comment.}

\item{orcid}{ORCID.}

\item{file}{DESCRIPTION file to use. By default the DESCRIPTION
file of the current package (i.e. the package the working directory
is part of) is used.}

\item{normalize}{Whether to "normalize" (reorder and reformat) the fields when writing back
the result. See \code{\link[=desc_normalize]{desc_normalize()}}.}
}
\description{
Only works with the Authors@R field.
}
\details{
The current maintainer is kept if they have at least another role.
}
\seealso{
Other Authors@R: 
\code{\link{desc_add_author}()},
\code{\link{desc_add_author_gh}()},
\code{\link{desc_add_me}()},
\code{\link{desc_add_orcid}()},
\code{\link{desc_add_role}()},
\code{\link{desc_add_ror}()},
\code{\link{desc_coerce_authors_at_r}()},
\code{\link{desc_del_author}()},
\code{\link{desc_del_role}()},
\code{\link{desc_get_author}()},
\code{\link{desc_get_authors}()},
\code{\link{desc_get_maintainer}()},
\code{\link{desc_set_authors}()}
}
\concept{Authors@R}
