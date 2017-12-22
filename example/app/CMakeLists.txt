project (ExampleApp)

include(${CMAKE_SOURCE_DIR}/cmake/project/project.cmake)

# --------------------- Source -----------------------

set (SOURCEFILES
  src/main.cpp
)

set (HEADERFILES
)

# --------------------- Executable -----------------------

addStandardExecutable()

