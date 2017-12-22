project(ExampleProject)

cmake_minimum_required(VERSION 2.8)

if(NOT EXISTS ${PROJECT_SOURCE_DIR}/cmake)
execute_process(
		COMMAND git clone ${PROJECT_SOURCE_DIR}/.. ${PROJECT_SOURCE_DIR}/cmake
)
endif()

include(${PROJECT_SOURCE_DIR}/cmake/project/MainProject.cmake)