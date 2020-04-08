# -*- coding: utf-8 -*-
#
# BMO documentation build configuration file, created by
# sphinx-quickstart on Fri May  5 01:30:21 2017.
#
# This file is execfile()d with the current directory set to its
# containing dir.
#
# Note that not all possible configuration values are present in this
# autogenerated file.
#
# All configuration values have a default; values that are commented out
# serve to show the default.

import importlib
import os
import shutil
import warnings

import sphinx_bootstrap_theme
from pkg_resources import parse_version

from sdssdb import __version__
from sdssdb.utils import create_schema_graph


try:
    import peewee
except ImportError:
    peewee = None


# Importing matplotlib here with agg to prevent tkinter error in readthedocs
# import matplotlib
# matplotlib.use('agg')

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.

# -- General configuration ------------------------------------------------

# If your documentation needs a minimal Sphinx version, state it here.
#
# needs_sphinx = '1.0'

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = ['sphinx.ext.autodoc', 'sphinx.ext.napoleon', 'sphinx.ext.autosummary',
              'sphinx.ext.todo', 'sphinx.ext.viewcode', 'sphinx.ext.mathjax',
              'sphinx.ext.intersphinx', 'sdsstools.releases', 'sphinx.ext.napoleon']

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# The suffix(es) of source filenames.
# You can specify multiple suffix as a list of string:
#
source_suffix = ['.rst', '.md']
# source_suffix = '.rst'

# source_parsers = {
#     '.md': 'recommonmark.parser.CommonMarkParser',
# }

# The master toctree document.
master_doc = 'index'

# General information about the project.
project = 'sdssdb'
copyright = '{0}, {1}'.format('2018', 'José Sánchez-Gallego')
author = 'José Sánchez-Gallego, Brian Cherinka, Jen Sobeck'

# The version info for the project you're documenting, acts as replacement for
# |version| and |release|, also used in various other places throughout the
# built documents.

# The short X.Y version.
version = parse_version(__version__).base_version
# The full version, including alpha/beta/rc tags.
release = __version__

# The language for content autogenerated by Sphinx. Refer to documentation
# for a list of supported languages.
#
# This is also used if you do content translation via gettext catalogs.
# Usually you set "language" from the command line for these cases.
language = None

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This patterns also effect to html_static_path and html_extra_path
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']

# The reST default role (used for this markup: `text`) to use for all
# documents.
default_role = 'py:obj'

# If true, '()' will be appended to :func: etc. cross-reference text.
# add_function_parentheses = True

# If true, the current module name will be prepended to all description
# unit titles (such as .. function::).
add_module_names = True

# If true, sectionauthor and moduleauthor directives will be shown in the
# output. They are ignored by default.
# show_authors = False

# The name of the Pygments (syntax highlighting) style to use.
pygments_style = 'sphinx'

# A list of ignored prefixes for module index sorting.
# modindex_common_prefix = []

# If true, keep warnings as "system message" paragraphs in the built documents.
# keep_warnings = False

# If true, `todo` and `todoList` produce output, else they produce nothing.
todo_include_todos = False

# Intersphinx mappings
intersphinx_mapping = {'python': ('https://docs.python.org/3.6', None),
                       'astropy': ('http://docs.astropy.org/en/latest', None),
                       'numpy': ('http://docs.scipy.org/doc/numpy/', None),
                       'peewee': ('http://docs.peewee-orm.com/en/latest/', None),
                       'sqlalchemy': ('https://docs.sqlalchemy.org/en/latest/', None)}

autodoc_mock_imports = ['_tkinter']
autodoc_member_order = 'groupwise'

napoleon_use_rtype = False
napoleon_use_ivar = True

rst_epilog = f"""
.. |sdssdb_version| replace:: {__version__}
.. |numpy_array| replace:: Numpy array
"""

releases_github_path = 'sdss/sdssdb'
releases_document_name = ['CHANGELOG']
releases_unstable_prehistory = True


# -- Options for HTML output ----------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = 'bootstrap'

html_sidebars = {}

# Theme options are theme-specific and customize the look and feel of a theme
# further.  For a list of options available for each theme, see the
# documentation.
html_theme_options = {
    # Navigation bar title. (Default: ``project`` value)
    'navbar_title': "SDSS: {0}".format(project),

    # Tab name for entire site. (Default: "Site")
    'navbar_site_name': "Site",

    # A list of tuples containing pages or urls to link to.
    # Valid tuples should be in the following forms:
    #    (name, page)                 # a link to a page
    #    (name, "/aa/bb", 1)          # a link to an arbitrary relative url
    #    (name, "http://example.com", True) # arbitrary absolute url
    # Note the "1" or "True" value above as the third argument to indicate
    # an arbitrary url.
    'navbar_links': [
    ],

    # Render the next and previous page links in navbar. (Default: true)
    'navbar_sidebarrel': False,

    # Render the current pages TOC in the navbar. (Default: true)
    'navbar_pagenav': False,

    # Tab name for the current pages TOC. (Default: "Page")
    'navbar_pagenav_name': "Page",

    # Global TOC depth for "site" navbar tab. (Default: 1)
    # Switching to -1 shows all levels.
    'globaltoc_depth': 2,

    # Include hidden TOCs in Site navbar?
    #
    # Note: If this is "false", you cannot have mixed ``:hidden:`` and
    # non-hidden ``toctree`` directives in the same page, or else the build
    # will break.
    #
    # Values: "true" (default) or "false"
    'globaltoc_includehidden': "true",

    # HTML navbar class (Default: "navbar") to attach to <div> element.
    # For black navbar, do "navbar navbar-inverse"
    'navbar_class': "navbar",

    # Fix navigation bar to top of page?
    # Values: "true" (default) or "false"
    'navbar_fixed_top': "true",

    # Location of link to source.
    # Options are "nav" (default), "footer" or anything else to exclude.
    'source_link_position': "",

    # Bootswatch (http://bootswatch.com/) theme.
    #
    # Options are nothing (default) or the name of a valid theme
    # such as "amelia" or "cosmo".
    'bootswatch_theme': "paper",

    # Choose Bootstrap version.
    # Values: "3" (default) or "2" (in quotes)
    'bootstrap_version': "3",
}

# Add any paths that contain custom themes here, relative to this directory.
html_theme_path = sphinx_bootstrap_theme.get_html_theme_path()

html_favicon = './_static/favicon.ico'

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']


html_sidebars = {'**': ['localtoc.html']}

# -- Options for HTMLHelp output ------------------------------------------

# Output file base name for HTML help builder.
htmlhelp_basename = '{0}pdoc'.format('sdssdb')


# -- Options for LaTeX output ---------------------------------------------

latex_elements = {
    # The paper size ('letterpaper' or 'a4paper').
    #
    # 'papersize': 'letterpaper',

    # The font size ('10pt', '11pt' or '12pt').
    #
    # 'pointsize': '10pt',

    # Additional stuff for the LaTeX preamble.
    #
    # 'preamble': '',

    # Latex figure (float) alignment
    #
    # 'figure_align': 'htbp',
}

# Grouping the document tree into LaTeX files. List of tuples
# (source start file, target name, title,
#  author, documentclass [howto, manual, or own class]).
latex_documents = [
    (master_doc, '{0}.tex'.format(project), u'{0} Documentation'.format(project),
     author, 'manual'),
]

# -- Options for manual page output ---------------------------------------

# One entry per manual page. List of tuples
# (source start file, name, description, authors, manual section).
man_pages = [
    (master_doc, 'sdssdb', u'{0} Documentation'.format(project),
     [author], 1)
]

# -- Options for Texinfo output -------------------------------------------

# Grouping the document tree into Texinfo files. List of tuples
# (source start file, target name, title, author,
#  dir menu entry, description, category)
texinfo_documents = [
    (master_doc, project, u'{0} Documentation'.format(project),
     author, project, 'One line description of project.',
     'Miscellaneous'),
]


def generate_schema_graphs():
    """Generates schema graphs for a series of schemas."""

    if not peewee:
        warnings.warn('peewee is not installed. Cannot generate schema graphs.',
                      UserWarning)
        return

    schemas = ['operationsdb.platedb', 'operationsdb.mangadb', 'operationsdb.apogeeqldb']

    output_dir = os.path.join(os.path.dirname(__file__), '_static/schema_graphs/auto')

    if os.path.exists(output_dir):
        shutil.rmtree(output_dir)

    os.makedirs(output_dir)

    for schema in schemas:

        __, schema_name = schema.split('.')

        module = importlib.import_module('sdssdb.peewee.' + schema)

        models = []
        for attr in dir(module):
            obj = getattr(module, attr)

            if not isinstance(obj, peewee.ModelBase):
                continue

            models.append(obj)

        if len(models) > 0:
            graph = create_schema_graph(models, schema=schema_name)
            graph.write_pdf(os.path.join(output_dir, schema + '.pdf'))


def setup(app):
    generate_schema_graphs()
