//
//  Texture.swift
//  SdlDemo
//
//  Created by Maria Zaitseva on 27.12.2023.
//

import SDL2

class Texture {
    let renderer: OpaquePointer
    let surface: Surface

    init(renderer: OpaquePointer, surface: Surface) {
        self.renderer = renderer
        self.surface = surface
    }
}
