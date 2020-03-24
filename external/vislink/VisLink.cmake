macro (useVisLink)
	add_external(vislink
		GIT_REPOSITORY https://github.com/dtorban/VisLink.git
		LIB_NAME VisLink
	)

	set(DEP_LINK_DIRS ${DEP_LINK_DIRS} ${external_dir}/vislink/install/lib)
	set(DEP_INCLUDES ${DEP_INCLUDES} ${external_dir}/vislink/src/src)

	set(vislink_external_dir ${external_dir}/vislink/src/cmake/framework/external)

	set(DEP_LINK_DIRS ${DEP_LINK_DIRS} 
	  ${vislink_external_dir}/SandBox/build/install/lib
	)
	message(${vislink_external_dir}/SandBox/src/src)
	set(DEP_INCLUDES ${DEP_INCLUDES} 
	  ${vislink_external_dir}/SandBox/src/src
	  ${vislink_external_dir}/SandBox/cmake/framework/external/glm/src
	)

	set(DEP_LINK_DIRS ${DEP_LINK_DIRS} 
	  ${vislink_external_dir}/SandBox/src/cmake/framework/external/glfw3/build/install/lib
	)
	set(DEP_INCLUDES ${DEP_INCLUDES} 
	  ${vislink_external_dir}/SandBox/src/cmake/framework/external/glfw3/build/install/include
	)

	if(MSVC)
	  set(DEP_LIBS ${DEP_LIBS} optimized glfw3.lib debug glfw3d.lib PARENT_SCOPE)
	  set(DEP_LIBS ${DEP_LIBS} optimized sandbox.lib debug sandboxd.lib PARENT_SCOPE)
	else()
	  set(DEP_LIBS ${DEP_LIBS} optimized libglfw3.a debug libglfw3d.a PARENT_SCOPE)
	  set(DEP_LIBS ${DEP_LIBS} optimized libsandbox.a debug libsandboxd.a PARENT_SCOPE)
	endif()

	set(DEP_LIBS ${DEP_LIBS} sandbox glfw3)

	find_package(Vulkan REQUIRED)
	message("vk Found" ${Vulkan_FOUND} ${Vulkan_INCLUDE_DIRS} ${Vulkan_LIBRARIES})
	include_directories(${Vulkan_INCLUDE_DIRS})
	set(DEP_LIBS ${DEP_LIBS} ${Vulkan_LIBRARIES})

endmacro()
