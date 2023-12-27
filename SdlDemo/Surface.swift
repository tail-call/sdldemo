//
//  Surface.swift
//  SdlDemo
//
//  Created by Maria Zaitseva on 27.12.2023.
//

import SDL2

class Surface {
    let width: Int
    let height: Int

    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }

    lazy var sdlSurface: UnsafeMutablePointer<SDL_Surface> = {
        SDL_CreateRGBSurfaceWithFormat(
            0, // SDL2 wiki says I should set this to 0
            Int32(width),
            Int32(height),
            8, // Pixel depth
            SDL_PIXELFORMAT_RGBA8888.rawValue
        )!
    }()

    deinit {
        SDL_FreeSurface(sdlSurface)
    }
}
