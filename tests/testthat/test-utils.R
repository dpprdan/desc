test_that("check_for_package works", {
  expect_true(check_for_package("utils"))

  expect_snapshot(
    error = TRUE,
    check_for_package("foobarfoobarfoobar")
  )
})

test_that("is_ascii", {
  expect_true(is_ascii(""))
  expect_true(is_ascii("a"))
  expect_true(is_ascii(rawToChar(as.raw(127))))

  expect_equal(
    is_ascii(character()),
    logical()
  )

  expect_equal(
    is_ascii(c("a", "b")),
    c(TRUE, TRUE)
  )

  expect_false(is_ascii(rawToChar(as.raw(128))))
})

test_that("is_url", {
  expect_true(is_url("http://acme.com"))
  expect_true(is_url("https://acme.com"))
  expect_true(is_url("ftp://this.is.it"))

  expect_equal(is_url(character()), logical())

  expect_false(is_url(""))
  expect_false(is_url("this.is.not"))
  expect_false(is_url("http://"))
  expect_false(is_url("http:/this.is.no"))

  expect_equal(
    is_url(c("http://acme.com", "http://index.me")),
    c(TRUE, TRUE)
  )

  expect_equal(
    is_url(c("foo", "https://foo.bar")),
    c(FALSE, TRUE)
  )
})

test_that("is_url_list", {
  expect_true(is_url_list(""))
  expect_true(is_url_list("http://foo.bar"))

  expect_false(is_url_list("this is not it"))
  expect_false(is_url_list("http://so.far.so.good, oh, no!"))
})

test_that("parse_full_name works", {
  # thanks charlatan::ch_name()
  name <- "Chanie Reynolds"
  parsed_name <- parse_full_name(name)
  expect_equal(parsed_name$given, "Chanie")
  expect_equal(parsed_name$family, "Reynolds")

  name <- "Cathryn Schuster-Cruickshank"
  parsed_name <- parse_full_name(name)
  expect_equal(parsed_name$given, "Cathryn")
  expect_equal(parsed_name$family, "Schuster-Cruickshank")

  name <- "Petra J. Heaney"
  parsed_name <- parse_full_name(name)
  expect_equal(parsed_name$given, "Petra J.")
  expect_equal(parsed_name$family, "Heaney")
})

test_that("deparse", {
  x <- "G\u00e1bor \U1F680"
  expect_equal(utf8ToInt(x), c(71L, 225L, 98L, 111L, 114L, 32L, 128640L))
  dx <- fixed_deparse1(x)
  expect_equal(dx, paste0("\"", x, "\""))
  expect_equal(Encoding(dx), "UTF-8")

  # Test in non-UTF-8 locale as well
  dx2 <- callr::r(
    function(x) {
      Sys.setlocale("LC_ALL", "C")
      asNamespace("desc")$fixed_deparse1(x)
    },
    list(x = x)
  )
  expect_equal(dx2, paste0("\"", x, "\""))
  expect_equal(Encoding(dx2), "UTF-8")
})
