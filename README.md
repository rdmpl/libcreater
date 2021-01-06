# libcreater
## Dscriptions:
````
This is a template project to generate your libraries. it just use the Make tools to manage the source.
It is especially suited for embedded systems, for the cross-compile tool is always out of date, and not support the newly project tools(such as cmake).
It auto detects the dependency using the compilers, and compiles as little as it is needed when you modified the files.
````
## USAGES:
````
 a.Put your source C files to the source directories, and H files to the include directories
 b.Modify the Makefile in the source directories, add your compiler tools position and the compiler tags when compiling and archieve.
 c.Execute "make" in the root directory to compile the libraries
 d.Execute "make compress" in the root directory to compress the header files and lib file together to distribute.
````

