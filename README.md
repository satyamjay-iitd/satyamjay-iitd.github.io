# satyamjay-iitd.github.io

Personal website and blog of Satyam Jay, built with [MkDocs](https://www.mkdocs.org/)
and the [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) theme.
Published at <https://satyamjay-iitd.github.io/>.

## Prerequisites

- Python 3.9+
- [`typst`](https://github.com/typst/typst) (only needed to rebuild the resume)
- System libraries for the Material **social** plugin (image generation via
  Cairo/Pango). On Debian/Ubuntu:

  ```bash
  sudo apt-get install libcairo2-dev libfreetype6-dev libffi-dev libjpeg-dev libpng-dev libz-dev
  ```

## Setup

```bash
python3 -m venv venv
source venv/bin/activate           # fish: source venv/bin/activate.fish

pip install \
  mkdocs-material \
  mkdocs-rss-plugin \
  mkdocs-pdf \
  pillow cairosvg
```

> The `blog`, `search`, and `social` plugins ship with `mkdocs-material`;
> `rss` comes from `mkdocs-rss-plugin` and the `mkdocs-pdf` plugin from its own package.

## Run locally

```bash
mkdocs serve
```

Then open <http://127.0.0.1:8000/>. The site rebuilds automatically on file changes.

## Build

```bash
mkdocs build          # outputs the static site to ./site
```

## Deploy

The live site is served from the `gh-pages` branch. Publish with:

```bash
mkdocs gh-deploy
```

This builds the site and force-pushes it to `gh-pages` on `origin`.

## Rebuild the resume

The resume lives in `resume/main.typ` and is compiled to `resume/main.pdf`
(embedded in the site via the `mkdocs-pdf` plugin):

```bash
typst compile resume/main.typ resume/main.pdf
```

## Project layout

```
docs/          Markdown content (index, blog posts, contact, assets)
overrides/     Theme customizations (main.html, partials)
resume/        Typst source + compiled PDF
mkdocs.yml     Site configuration
```
