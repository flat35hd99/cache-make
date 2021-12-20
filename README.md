# Cache `make` result on GitHub Actions using cache action

## Usage

```yml
jobs:
  build:
    runs-on: ubuntu-18.04
    steps:
      # To load past commits, please set `fetch-depth: 0`
      - uses: actions/checkout@v2
        with:
          fetch-depth: 0
      # Cache output files in dist directory
      - name: Setup cache
        uses: actions/cache@v2
        with:
          path: test/dist
          key: ${{ runner.os }}-makefile-${{ github.sha }}-${{ hashFiles('**/makefile') }}
          restore-keys: |
            ${{ runner.os }}-makefile-
      # This workflow change updated time of files was not changed.
      # You can control behavior by setting reference, or commit id.
      # See below more infomation.
      - name: Change updated time
        uses: flat35hd99/cache-make@v1.0.0

      - name: Build
        run: make
```
