# C Makefile
This is a generic C makefile.

## Project structure
The file structure used for this the following one :
```
├── bin/
├── build/
├── include/
├── src/
└── Makefile
```
You can use `make dirs` to create this structure.

The sources files (`*.c`) should be put in the `src/` folder.
The headers (`*.h` files) should be put in the `include/` folder.

## Usage
### Edit the target
Change the variable `TARGET` to the name of the main `.c` file.

### Build the project
Then run `make` to build the project (with `O2` level of optimisation).

To build in debug mode (`O0` optimisation, `-g` for debug symbols), run `make debug`.

This will compile `*.o` files and put them in the folder `build/`, and link them to create the executable `bin/$(TARGET)`.

### Other commands
To clean : `make clean-obj` cleans the `build/` folder, `make clean-bin` cleans the `bin/` folder, and `make clean` calls both.

To remake : `make remake` cleans and then build, and `make remake-debug` do the same, in debug mode.

To run (without arguments) : `make run`.
