$includedir = (pkgconf --variable includedir sdl2).Trim()
$outputpath = "Sources/CSDL2/windows_generated.h"
Write-Output ('#include "' + $includedir + '/SDL2/SDL.h"') > $outputpath
Write-Output ('#include "' + $includedir + '/SDL2/SDL_vulkan.h"') >> $outputpath
foreach($header in "SDL_image.h", "SDL2_framerate.h", "SDL2_gfxPrimitives.h", "SDL2_imageFilter.h", "SDL2_rotozoom.h") {
    $path = "$includedir/SDL2/$header" 
    Write-Output ('#if __has_include("' + $path + '")') >> $outputpath
    Write-Output ('#include "' + $path + '"') >> $outputpath
    Write-Output '#endif' >> $outputpath
    #endif
}
