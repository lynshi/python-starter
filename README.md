# python-starter
[![codecov](https://codecov.io/gh/lynshi/python-starter/branch/master/graph/badge.svg)](https://codecov.io/gh/lynshi/python-starter) ![build](https://github.com/lynshi/python-starter/workflows/build/badge.svg)

This is a starter template for Python projects that includes a Dockerfile, a script `checks.sh` for running tests and verifying code quality and style, and a GitHub Action for running checks and publishing coverage results to [Codecov](https://codecov.io/). It is targeted for Linux/Mac; if you are on Windows, please use [WSL](https://docs.microsoft.com/en-us/windows/wsl/).

`checks.sh` does the following:
1. Runs unit tests and generates a code coverage report with [`pytest`](https://docs.pytest.org/en/latest/) and [`coverage`](https://coverage.readthedocs.io/en/coverage-5.1/).
2. Performs static type checking with [`pyright`](https://github.com/Microsoft/pyright).
3. Formats code with [`black`](https://github.com/psf/black).
4. Lints code with [`pylint`](https://github.com/PyCQA/pylint).

# Prerequisites
1. [`npm`](https://www.npmjs.com/) is required to install `pyright`. I recommend using [`nvm`](https://github.com/nvm-sh/nvm#install--update-script) to install `node`.

# Quickstart
1. [Download](https://github.com/lynshi/python-starter/archive/master.zip) and unpack a zip of this repository.
2. Rename `sample` and `test/sample` appropriately for your project.
3. Create a `virtualenv` for the Python project. [`virtualenvwrapper`](https://virtualenvwrapper.readthedocs.io/en/latest/) is a nice tool for managing virtual environments.
4. Activate the `virtualenv` (if you have created the `virtualenv` in your previous command, it should automatically be activated).
5. Run `setup.sh`, which installs `pyright` and the dependencies in `requirements.txt`.
6. Edit the parameter values at the start of `checks.sh`.
7. Run `checks.sh` as a sanity check.