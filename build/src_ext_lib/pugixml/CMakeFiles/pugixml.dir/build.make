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
include src_ext_lib/pugixml/CMakeFiles/pugixml.dir/depend.make

# Include the progress variables for this target.
include src_ext_lib/pugixml/CMakeFiles/pugixml.dir/progress.make

# Include the compile flags for this target's objects.
include src_ext_lib/pugixml/CMakeFiles/pugixml.dir/flags.make

src_ext_lib/pugixml/CMakeFiles/pugixml.dir/src/pugixml.cpp.o: src_ext_lib/pugixml/CMakeFiles/pugixml.dir/flags.make
src_ext_lib/pugixml/CMakeFiles/pugixml.dir/src/pugixml.cpp.o: /afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/src/Linux-Debug/src_ext_lib/pugixml/src/pugixml.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src_ext_lib/pugixml/CMakeFiles/pugixml.dir/src/pugixml.cpp.o"
	cd /afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/build/src_ext_lib/pugixml && /opt/crc/g/gcc/7.1.0/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pugixml.dir/src/pugixml.cpp.o -c /afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/src/Linux-Debug/src_ext_lib/pugixml/src/pugixml.cpp

src_ext_lib/pugixml/CMakeFiles/pugixml.dir/src/pugixml.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pugixml.dir/src/pugixml.cpp.i"
	cd /afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/build/src_ext_lib/pugixml && /opt/crc/g/gcc/7.1.0/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/src/Linux-Debug/src_ext_lib/pugixml/src/pugixml.cpp > CMakeFiles/pugixml.dir/src/pugixml.cpp.i

src_ext_lib/pugixml/CMakeFiles/pugixml.dir/src/pugixml.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pugixml.dir/src/pugixml.cpp.s"
	cd /afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/build/src_ext_lib/pugixml && /opt/crc/g/gcc/7.1.0/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/src/Linux-Debug/src_ext_lib/pugixml/src/pugixml.cpp -o CMakeFiles/pugixml.dir/src/pugixml.cpp.s

# Object files for target pugixml
pugixml_OBJECTS = \
"CMakeFiles/pugixml.dir/src/pugixml.cpp.o"

# External object files for target pugixml
pugixml_EXTERNAL_OBJECTS =

src_ext_lib/pugixml/libpugixml.a: src_ext_lib/pugixml/CMakeFiles/pugixml.dir/src/pugixml.cpp.o
src_ext_lib/pugixml/libpugixml.a: src_ext_lib/pugixml/CMakeFiles/pugixml.dir/build.make
src_ext_lib/pugixml/libpugixml.a: src_ext_lib/pugixml/CMakeFiles/pugixml.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libpugixml.a"
	cd /afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/build/src_ext_lib/pugixml && $(CMAKE_COMMAND) -P CMakeFiles/pugixml.dir/cmake_clean_target.cmake
	cd /afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/build/src_ext_lib/pugixml && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pugixml.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src_ext_lib/pugixml/CMakeFiles/pugixml.dir/build: src_ext_lib/pugixml/libpugixml.a

.PHONY : src_ext_lib/pugixml/CMakeFiles/pugixml.dir/build

src_ext_lib/pugixml/CMakeFiles/pugixml.dir/clean:
	cd /afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/build/src_ext_lib/pugixml && $(CMAKE_COMMAND) -P CMakeFiles/pugixml.dir/cmake_clean.cmake
.PHONY : src_ext_lib/pugixml/CMakeFiles/pugixml.dir/clean

src_ext_lib/pugixml/CMakeFiles/pugixml.dir/depend:
	cd /afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/src/Linux-Debug /afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/src/Linux-Debug/src_ext_lib/pugixml /afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/build /afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/build/src_ext_lib/pugixml /afs/crc.nd.edu/user/s/sbritto2/temp/FibrinPlatelet/build/src_ext_lib/pugixml/CMakeFiles/pugixml.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src_ext_lib/pugixml/CMakeFiles/pugixml.dir/depend
