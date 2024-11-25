# C Makefile
This is a generic LaTeX makefile.

## Project structure
The file structure used for this the following one :
```
├── sections/
├── main.tex
└── Makefile
```
You can use `make init` to create this structure (the `sections/` folder and a `.gitignore` file for LaTeX).

The `sections/` folder contain the LaTeX sections that are included in `main.tex` (using `\include` for example).

## Usage
### Edit the target
Change the variable `TARGET` to the name of the main `.tex` file.

### Build the project
Then run `make` to build the project.

This will compile `$(TARGET).tex` file and create a `$(TARGET).pdf` file.

### Other commands
To clean : `make clean` cleans LaTeX compilation files, `make clean-pdf` cleans the output, and `make clean-all` do both.

To remake : `make remake` cleans and then build.
