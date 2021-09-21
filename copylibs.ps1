$bindir = ((pkgconf --variable exec_prefix sdl2).Trim() + "/bin")
$libdir = (pkgconf --variable libdir sdl2).Trim()
foreach ($config in "debug", "release") {
    $path = ".build/$config"
    if (Test-Path -Path $path) {
        foreach($lib in "SDL2", "SDL2_gfx", "SDL2_image", "libpng16", "zlib1") {
            Copy-Item ($bindir + "/$lib.dll") $path
            $libpath = ($libdir + "/$lib.lib")
            if (Test-Path -Path $libpath) {
                Copy-Item $libpath $path
            }
        }
    }
}
