-- scaffold geniefile for pthread-win32

pthread-win32_script = path.getabsolute(path.getdirectory(_SCRIPT))
pthread-win32_root = path.join(pthread-win32_script, "pthread-win32")

pthread-win32_includedirs = {
	path.join(pthread-win32_script, "config"),
	pthread-win32_root,
}

pthread-win32_libdirs = {}
pthread-win32_links = {}
pthread-win32_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { pthread-win32_includedirs }
	end,

	_add_defines = function()
		defines { pthread-win32_defines }
	end,

	_add_libdirs = function()
		libdirs { pthread-win32_libdirs }
	end,

	_add_external_links = function()
		links { pthread-win32_links }
	end,

	_add_self_links = function()
		links { "pthread-win32" }
	end,

	_create_projects = function()

project "pthread-win32"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		pthread-win32_includedirs,
	}

	defines {}

	files {
		path.join(pthread-win32_script, "config", "**.h"),
		path.join(pthread-win32_root, "**.h"),
		path.join(pthread-win32_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
