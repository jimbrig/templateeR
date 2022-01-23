
<!-- README.md is generated from README.Rmd. Please edit that file -->

# templateeR

`templateeR` is an R package providing a suite of various R related
templates.

<!-- badges: start -->

[![R-CMD-check](https://github.com/jimbrig/templateeR/workflows/R-CMD-check/badge.svg)](https://github.com/jimbrig/templateeR/actions)
<!-- badges: end -->

The goal of `templateeR` is to provide the R developer easy-to-use,
reproducible templates. Additionally, `templateer` attempts to provide
developer’s more general best practice templates for various workflows
and projects.

## Installation

You can install the development version of `templateeR` from
[GitHub](https://github.com/) with:

``` r
pak::pak("jimbrig/templateeR")
```

## Templates

### General

-   [use_git_cliff](R/use_git_cliff.R) - function that generates
    necessary files to implement [git-cliff]() functionality for the
    repo. `git-cliff` auto-generates a [CHANGELOG.md]() using the [Keep
    a Changelog]() methodology with a provided `cliff.toml`
    configuration file.

### Files and Scripts
