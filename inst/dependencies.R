# No Remotes ----
# Attachments ----
to_install <- c("cli", "crayon", "fs", "glue", "here", "magrittr", "purrr", "rlang",
                "tibble", "usethis", "whisker", "yaml")
for (i in to_install) {
    message(paste("looking for ", i))
    if (!requireNamespace(i)) {
        message(paste("     installing", i))
        install.packages(i)
    }
}
