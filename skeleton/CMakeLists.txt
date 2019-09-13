# Sets the minimum required version of cmake
cmake_minimum_required(VERSION 3.10.2)

# Root src dir is set to: COLMEIA_SOURCE_DIR.
# Root binary dir is set to: COLMEIA_BINARY_DIR
project(colmeia)

# Generate compilation database for clang
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Generate header files out of .ui files
# Generated files will be placed at <dir>/<target-name>_autogen
set(CMAKE_AUTOUIC ON)

# Set search path for ui autogen of cmake
set(CMAKE_AUTOUIC_SEARCH_PATHS ./ui)

# Locate the libraries and header files shipped with Qt
find_package(Qt5 COMPONENTS Widgets REQUIRED)

# Set dir of files to be included at compilation
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/inc)

# Subdirectories for CMake to scan
#add_subdirectory(src)
#add_subdirectory(ui)

# Add source files for executable
add_executable(colmeia src/main.cpp ui/main.ui)

target_link_libraries(colmeia Qt5::Widgets)
