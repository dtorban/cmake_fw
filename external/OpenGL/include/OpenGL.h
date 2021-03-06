/*
 * Copyright Regents of the University of Minnesota, 2017.  This software is released under the following license: http://opensource.org/licenses/
 * Source code originally developed at the University of Minnesota Interactive Visualization Lab (http://ivlab.cs.umn.edu).
 *
 * Code author(s):
 * 		Dan Orban (dtorban)
 */

#ifndef OPENGLHEADERS_H_
#define OPENGLHEADERS_H_

#if defined(USE_GLAD)
#if defined(LIBRARY_SHARED) && !defined(GLAD_GLAPI_EXPORT)
#define GLAD_GLAPI_EXPORT
#endif
#ifndef __gl_h_
#include <glad/glad.h>
#else
typedef void* (* GLADloadproc)(const char *name);
GLAPI int gladLoadGLLoader(GLADloadproc);
#endif
#endif

#if defined(USE_GLEW)
#include "GL/glew.h"
#ifdef _WIN32
#include "GL/wglew.h"
#elif (!defined(__APPLE__))
#include "GL/glxew.h"
#endif
#endif

#if defined(WIN32)
#define NOMINMAX
#include <windows.h>
#include <GL/gl.h>
#elif defined(__APPLE__)
#define GLFW_INCLUDE_GLCOREARB
#include <OpenGL/OpenGL.h>
#else
#define GL_GLEXT_PROTOTYPES
#include <GL/gl.h>
#endif

#include <iostream>

#if defined(USE_GLAD)
#include <GLFW/glfw3.h>
#endif

inline void initializeGLExtentions() {
#if defined(USE_GLEW)
	glewExperimental = GL_TRUE;
	GLenum err = glewInit();
	if (GLEW_OK != err) {
		std::cout << "Error initializing GLEW." << std::endl;
	}
#endif

#if defined(USE_GLAD)
    if (!gladLoadGLLoader((GLADloadproc) glfwGetProcAddress))
        throw std::runtime_error("Could not initialize GLAD!");
    glGetError(); // pull and ignore unhandled errors like GL_INVALID_ENUM
#endif
}

#endif /* OPENGLHEADERS_H_ */
