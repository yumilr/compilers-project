# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/jlr/IDES/clion-2020.3.1/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/jlr/IDES/clion-2020.3.1/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/cmake-build-debug

# Include any dependencies generated for this target.
include googletest-build/googlemock/CMakeFiles/gmock.dir/depend.make

# Include the progress variables for this target.
include googletest-build/googlemock/CMakeFiles/gmock.dir/progress.make

# Include the compile flags for this target's objects.
include googletest-build/googlemock/CMakeFiles/gmock.dir/flags.make

googletest-build/googlemock/CMakeFiles/gmock.dir/src/gmock-all.cc.o: googletest-build/googlemock/CMakeFiles/gmock.dir/flags.make
googletest-build/googlemock/CMakeFiles/gmock.dir/src/gmock-all.cc.o: googletest-src/googlemock/src/gmock-all.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object googletest-build/googlemock/CMakeFiles/gmock.dir/src/gmock-all.cc.o"
	cd /home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/cmake-build-debug/googletest-build/googlemock && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/gmock.dir/src/gmock-all.cc.o -c /home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/cmake-build-debug/googletest-src/googlemock/src/gmock-all.cc

googletest-build/googlemock/CMakeFiles/gmock.dir/src/gmock-all.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gmock.dir/src/gmock-all.cc.i"
	cd /home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/cmake-build-debug/googletest-build/googlemock && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/cmake-build-debug/googletest-src/googlemock/src/gmock-all.cc > CMakeFiles/gmock.dir/src/gmock-all.cc.i

googletest-build/googlemock/CMakeFiles/gmock.dir/src/gmock-all.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gmock.dir/src/gmock-all.cc.s"
	cd /home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/cmake-build-debug/googletest-build/googlemock && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/cmake-build-debug/googletest-src/googlemock/src/gmock-all.cc -o CMakeFiles/gmock.dir/src/gmock-all.cc.s

# Object files for target gmock
gmock_OBJECTS = \
"CMakeFiles/gmock.dir/src/gmock-all.cc.o"

# External object files for target gmock
gmock_EXTERNAL_OBJECTS =

lib/libgmockd.a: googletest-build/googlemock/CMakeFiles/gmock.dir/src/gmock-all.cc.o
lib/libgmockd.a: googletest-build/googlemock/CMakeFiles/gmock.dir/build.make
lib/libgmockd.a: googletest-build/googlemock/CMakeFiles/gmock.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library ../../lib/libgmockd.a"
	cd /home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/cmake-build-debug/googletest-build/googlemock && $(CMAKE_COMMAND) -P CMakeFiles/gmock.dir/cmake_clean_target.cmake
	cd /home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/cmake-build-debug/googletest-build/googlemock && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gmock.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
googletest-build/googlemock/CMakeFiles/gmock.dir/build: lib/libgmockd.a

.PHONY : googletest-build/googlemock/CMakeFiles/gmock.dir/build

googletest-build/googlemock/CMakeFiles/gmock.dir/clean:
	cd /home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/cmake-build-debug/googletest-build/googlemock && $(CMAKE_COMMAND) -P CMakeFiles/gmock.dir/cmake_clean.cmake
.PHONY : googletest-build/googlemock/CMakeFiles/gmock.dir/clean

googletest-build/googlemock/CMakeFiles/gmock.dir/depend:
	cd /home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2 /home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/cmake-build-debug/googletest-src/googlemock /home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/cmake-build-debug /home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/cmake-build-debug/googletest-build/googlemock /home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/cmake-build-debug/googletest-build/googlemock/CMakeFiles/gmock.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : googletest-build/googlemock/CMakeFiles/gmock.dir/depend

