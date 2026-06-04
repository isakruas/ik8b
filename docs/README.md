# ik documentation

The complete ik language and standard-library manual, built with
[Sphinx](https://www.sphinx-doc.org/) and the
[Furo](https://pypi.org/project/furo/) theme.

## Layout

```
docs/
├── Makefile             # `make html`, `make clean`, `make linkcheck`
├── requirements.txt     # Sphinx + theme
└── source/
    ├── conf.py          # Sphinx configuration
    ├── _ext/ikdomain.py # tiny custom domain: `.. function::` + `:func:` for ik
    ├── _static/         # custom.css
    ├── index.rst        # manual root
    ├── tutorial/        # hands-on introduction
    ├── reference/       # language reference (incl. full EBNF grammar)
    ├── library/         # per-module standard library reference
    ├── toolchain/       # compiler CLI + supported device table
    └── glossary.rst
```

## Building

```bash
cd docs
python3 -m venv .venv
. .venv/bin/activate
pip install -r requirements.txt
make html
```

The rendered site is written to `docs/build/html/`; open
`docs/build/html/index.html`.

## Keeping it accurate

Two pages are generated from the toolchain itself and should be regenerated when
the language or device support changes:

- `source/reference/grammar.rst` mirrors the repository's `EBNF` file.
- `source/toolchain/devices.rst` embeds the output of `./ik8b list-devices`.

Standard-library pages document the real signatures in `std/*.ik`; update them
alongside any library change.
