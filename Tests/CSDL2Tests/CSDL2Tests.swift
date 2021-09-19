//
//  CSDL2Tests.swift
//
//
//  Created by Christian Treffs on 03.11.19.
//

import XCTest
import CSDL2

extension RawRepresentable where RawValue : BinaryInteger {
    #if os(Windows)
    typealias FlagsValue = UInt32
    #else
    typealias FlagsValue = Int32
    #endif

    /// Returns platform specific flags values, which doesn't always match RawValue.
    var flagsValue : FlagsValue {
        FlagsValue(rawValue)
    }
}

final class CSDL2Tests: XCTestCase {

    func testVersion() {
        var compiled = SDL_version()
        compiled.major = Uint8(SDL_MAJOR_VERSION)
        compiled.minor = Uint8(SDL_MINOR_VERSION)
        compiled.patch = Uint8(SDL_PATCHLEVEL)

        var linked = SDL_version()
        SDL_GetVersion(&linked)

        XCTAssertEqual(compiled.major, 2)
        XCTAssertEqual(compiled.minor, 0)
        
        XCTAssertEqual(linked.major, 2)
        XCTAssertEqual(linked.minor, 0)
    }
    
    func testKeyCodeAvailability() {
        XCTAssertNotNil(SDL_KeyCode.self)
    }

    func testImage() {
        let rv = IMG_Init(IMG_INIT_PNG.flagsValue)
        XCTAssertEqual(rv, 0)
        IMG_Quit()
    }
}
