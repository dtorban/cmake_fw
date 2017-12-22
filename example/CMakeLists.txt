project(ExampleProject)

cmake_minimum_required(VERSION 2.8)

if(NOT EXISTS ${PROJECT_SOURCE_DIR}/cmake)
execute_process(
		COMMAND git clone ${PROJECT_SOURCE_DIR}/.. ${PROJECT_SOURCE_DIR}/cmake
)
endif()

set(CMAKE_FRAMEWORK_DIR ${CMAKE_SOURCE_DIR}/cmake)
include(${CMAKE_FRAMEWORK_DIR}/project/MainProject.cmake)

add_subdirectory(app)