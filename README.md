<img align="right" src="https://raw.github.com/cliffano/knut-haugland/master/avatar.jpg" alt="Avatar"/>

[![Build Status](https://github.com/cliffano/knut-haugland/actions/workflows/ci-workflow.yaml/badge.svg)](https://github.com/cliffano/knut-haugland/actions/workflows/ci-workflow.yaml)
<br/>

Knut Haugland
-------------

Knut Haugland is a Makefile for creating Kon-Tiki static sites.
It provides utility targets for linting, building, testing, documenting Python packages.

Have a look at [KnutHauglandExample](examples/) as an example project which uses Knut Haugland.

Installation
------------

1. Download `src/Makefile-knut-haugland` as the `Makefile` of your project:
    `curl https://raw.githubusercontent.com/cliffano/knut-haugland/main/src/Makefile-knut-haugland -o Makefile`
2. Create configuration file `knut-haugland.yml` with properties described in [Configuration](#configuration) section
3. Run the available `Makefile` targets described in [Usage](#usage) section

Configuration
-------------

Create KnutHaugland configuration file called `knut-haugland.yml` with contains the following properties:

| Property | Description | Example |
|----------|-------------|---------|
| package_name | The name of the Python package | `somepackage` |
| author | The author of the package | `Some Author` |

Usage
-----

The following targets are available:

| Target | Description |
|--------|-------------|
| ci | CI target to be executed by CI/CD tool, end to end build of the Python package |
| stage | Ensure stage directory exists |
| clean | Remove all temporary (staged, generated, cached) files |
| deps | Retrieve package dependencies using [Poetry](https://python-poetry.org/) |
| deps-upgrade | Upgrade package dependencies using [Poetry](https://python-poetry.org/) |
| deps-extra-apt | Install extra tools using `apt`: Python [VirtualEnv](https://virtualenv.pypa.io/) |
| update-to-latest | Update Makefile to the latest version on origin's main branch |
| update-to-version | Update Makefile to the version defined in `TARGET_KNUT_HAUGLAND_VERSION` parameter |
| lint | Run lint checks against source and test code using [pylint](https://www.pylint.org/), then generate lint report using [pylint_report](https://pypi.org/project/pylint-report/) |
| complexity | Run complexity checks against source and test code using [wily](https://wily.readthedocs.io/), then generate complexity report |
| test | Run unit testing using [pytest](https://pytest.org), then generate test report |
| test-integration | Run integration testing using [pytest](https://pytest.org), then generate test report |
| test-examples | Run example scripts under `examples/` directory |
| coverage | Run coverage checks using [Coverage.py](https://github.com/nedbat/coveragepy), then generate coverage report |
| release-major | Create a major release using [rtk](https://github.com/cliffano/rtk) |
| release-minor | Create a minor release using [rtk](https://github.com/cliffano/rtk) |
| release-patch | Create a patch release using [rtk](https://github.com/cliffano/rtk) |
| package | Build the Python package using [Poetry](https://python-poetry.org/) |
| install | Install the built package using [Poetry](https://python-poetry.org/). For CLI, the binary is available at `/opt/poetry-venv/bin/` |
| uninstall | Uninstall the package using [Pip](https://pypi.org/project/pip/) |
| reinstall | Uninstall, rebuild, and then install the package again |
| publish | Publish package to PyPi using [Poetry](https://python-poetry.org/) |
| doc | Generate package documentation using [Sphinx](https://www.sphinx-doc.org/) |

Colophon
--------

Related Projects:

* [generator-python](https://github.com/cliffano/generator-python) - Python projects generator using Plop
