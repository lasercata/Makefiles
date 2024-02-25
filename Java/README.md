# Java Makefile
This is a generic Java makefile.

## Project structure
The file structure used for this the following one :
```
├── classes/
├── src/
└── Makefile
```
You can use `make dirs` to create this structure (it will create a `.gitignore` file in the `classes/` directory).

The sources files (`*.java`) should be put in the `src/` folder.

The `classes/` directory will contain the compiled classes.

## Usage
### Edit the target
Change the variable `MAIN` to the name of the main class. This is only used to run the compiled code, not to compile.

### Build the project
Then run `make` to build the project.

This will compile the `*.java` files into corresponding `*.class` files, and put them in the folder `classes/`.

### Run
To run (without arguments) : `make run`. This will run the main class.

To run, with arguments : `make run args="your arguments"`.
You can also set the variable `args` to default arguments in the makefile (to avoid typing them each time).

### Other commands
To clean : `make clean` cleans the `class/` folder.

To remake : `make remake` cleans and then build, and `make remake-debug` do the same, in debug mode.
