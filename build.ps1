./genshim
./copylibs
foreach($config in "debug", "release") {
    swift build --configuration $config
    swift test --configuration $config
}