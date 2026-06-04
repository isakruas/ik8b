# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------

project = "ik"
copyright = "2026, The ik8b Authors"
author = "The ik8b Authors"

# The language/version this manual documents.
language = "en"
release = "0.1.0"
version = "0.1"

# -- General configuration ---------------------------------------------------

import os
import sys

# Make the bundled ik domain extension importable.
sys.path.insert(0, os.path.abspath("_ext"))

extensions = [
    "sphinx.ext.todo",
    "sphinx.ext.ifconfig",
    "ikdomain",
]

# Let ``.. function::`` and ``:func:`` resolve to the ik domain by default.
primary_domain = "ik"

templates_path = ["_templates"]
exclude_patterns = []

# A short, descriptive byline shown in some themes.
html_short_title = "ik 0.1.0 documentation"

# Treat every warning about a missing reference as just a warning, never fatal,
# so the manual always builds even while it is being written.
nitpicky = False

# There is no Pygments lexer for the ik language, so code blocks default to
# plain ``text`` highlighting rather than guessing.
highlight_language = "text"

rst_prolog = """
.. role:: ikkw(literal)
.. role:: iktype(literal)
"""

# -- Options for HTML output -------------------------------------------------

# Use a clean, neutral theme. Fall back to the built-in Alabaster theme (which
# ships with Sphinx) so the build never fails if Furo is not installed.
try:
    import furo  # noqa: F401

    html_theme = "furo"
except ImportError:
    html_theme = "alabaster"

html_static_path = ["_static"]
html_css_files = ["custom.css"]

html_title = "ik Language and Standard Library Reference"

# -- Extension configuration -------------------------------------------------

todo_include_todos = False
