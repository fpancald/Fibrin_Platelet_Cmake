# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


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
CMAKE_COMMAND = /afs/crc.nd.edu/x86_64_linux/c/cmake/3.13.2/bin/cmake

# The command to remove a file.
RM = /afs/crc.nd.edu/x86_64_linux/c/cmake/3.13.2/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/src/Linux-Debug

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/build

# Include any dependencies generated for this target.
include CMakeFiles/pugixmlLib.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/pugixmlLib.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/pugixmlLib.dir/flags.make

CMakeFiles/pugixmlLib.dir/src_ext_lib/pugixml/src/pugixml.cpp.o: CMakeFiles/pugixmlLib.dir/flags.make
CMakeFiles/pugixmlLib.dir/src_ext_lib/pugixml/src/pugixml.cpp.o: /afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/src/Linux-Debug/src_ext_lib/pugixml/src/pugixml.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/pugixmlLib.dir/src_ext_lib/pugixml/src/pugixml.cpp.o"
	/opt/crc/g/gcc/7.1.0/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pugixmlLib.dir/src_ext_lib/pugixml/src/pugixml.cpp.o -c /afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/src/Linux-Debug/src_ext_lib/pugixml/src/pugixml.cpp

CMakeFiles/pugixmlLib.dir/src_ext_lib/pugixml/src/pugixml.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pugixmlLib.dir/src_ext_lib/pugixml/src/pugixml.cpp.i"
	/opt/crc/g/gcc/7.1.0/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/src/Linux-Debug/src_ext_lib/pugixml/src/pugixml.cpp > CMakeFiles/pugixmlLib.dir/src_ext_lib/pugixml/src/pugixml.cpp.i

CMakeFiles/pugixmlLib.dir/src_ext_lib/pugixml/src/pugixml.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pugixmlLib.dir/src_ext_lib/pugixml/src/pugixml.cpp.s"
	/opt/crc/g/gcc/7.1.0/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/src/Linux-Debug/src_ext_lib/pugixml/src/pugixml.cpp -o CMakeFiles/pugixmlLib.dir/src_ext_lib/pugixml/src/pugixml.cpp.s

# Object files for target pugixmlLib
pugixmlLib_OBJECTS = \
"CMakeFiles/pugixmlLib.dir/src_ext_lib/pugixml/src/pugixml.cpp.o"

# External object files for target pugixmlLib
pugixmlLib_EXTERNAL_OBJECTS =

libpugixmlLib.a: CMakeFiles/pugixmlLib.dir/src_ext_lib/pugixml/src/pugixml.cpp.o
libpugixmlLib.a: CMakeFiles/pugixmlLib.dir/build.make
libpugixmlLib.a: CMakeFiles/pugixmlLib.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libpugixmlLib.a"
	$(CMAKE_COMMAND) -P CMakeFiles/pugixmlLib.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pugixmlLib.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/pugixmlLib.dir/build: libpugixmlLib.a

.PHONY : CMakeFiles/pugixmlLib.dir/build

CMakeFiles/pugixmlLib.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/pugixmlLib.dir/cmake_clean.cmake
.PHONY : CMakeFiles/pugixmlLib.dir/clean

CMakeFiles/pugixmlLib.dir/depend:
	cd /afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/src/Linux-Debug /afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/src/Linux-Debug /afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/build /afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/build /afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/build/CMakeFiles/pugixmlLib.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/pugixmlLib.dir/depend
