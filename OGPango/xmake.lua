add_rules("mode.debug", "mode.release")

add_requires {
    "objfw",
    "ogobject",
    "pango"
}

target("OGPango")
    set_kind(is_kind("shared") and "shared" or "static")
    add_files("src/**.m")
    add_includedirs("include/", { public = true })
    add_includedirs("include/OGPango", { private = true })
    add_headerfiles("include/(OGPango/**.h)")
    add_mflags("-fno-objc-arc", "-fno-objc-arc-exceptions")
    set_warnings("none")
    add_packages("objfw", "ogobject", "pango")

