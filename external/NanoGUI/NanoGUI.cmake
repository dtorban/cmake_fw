macro (useNanoGUI)

	set(NanoGUIArgs -DNANOGUI_BUILD_SHARED=OFF -DNANOGUI_BUILD_PYTHON=OFF -DNANOGUI_BUILD_EXAMPLE=OFF -DCMAKE_C_FLAGS=-fPIC -DCMAKE_CXX_FLAGS=-fPIC  -DCMAKE_DEBUG_POSTFIX=d -DCMAKE_CONFIGURATION_TYPES='Debug Release MinSizeRel RelWithDebInfo')
	add_external(NanoGUI 
		GIT_REPOSITORY https://github.com/wjakob/nanogui.git
		CMAKE_ARGS NanoGUIArgs
		LIB_NAME nanogui
	)

	include_directories(
		${external_dir}/NanoGUI/build/install/include
		${external_dir}/NanoGUI/src/ext/eigen
		${external_dir}/NanoGUI/src/ext/glfw/include
		${external_dir}/NanoGUI/src/ext/nanovg/src
	)

endmacro()
