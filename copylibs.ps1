$bindir = ((pkgconf --variable exec_prefix sdl2).Trim() + "/bin")
$libdir = (pkgconf --variable libdir sdl2).Trim()
foreach ($config in "debug", "release") {
    $binpath = (swift build --configuration $config --show-bin-path)
    mkdir -Force $binpath
    if (Test-Path -Path $binpath) {
        foreach($lib in "SDL2", "SDL2_gfx", "SDL2_image", "libpng16", "zlib1") {
            Copy-Item ($bindir + "/$lib.dll") $binpath
            $libpath = ($libdir + "/$lib.lib")
            if (Test-Path -Path $libpath) {
                Copy-Item $libpath $binpath
            }
        }
    }
}
