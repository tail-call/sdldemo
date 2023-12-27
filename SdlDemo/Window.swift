//
//  Window.swift
//  SdlDemo
//
//  Created by Maria Zaitseva on 27.12.2023.
//

import SDL2

class Window {
    let title: String
    let height: Int
    let width: Int

    lazy var sdlWindow: OpaquePointer = {
        SDL_CreateWindow(
            title,
            Int32(SDL_WINDOWPOS_CENTERED_MASK), Int32(SDL_WINDOWPOS_CENTERED_MASK),
            Int32(width), Int32(height),
            UInt32(SDL_WINDOW_SHOWN.rawValue)
        )
    }()

    init(title: String, height: Int, width: Int) {
        self.title = title
        self.height = height
        self.width = width
    }

    deinit {
        SDL_DestroyWindow(sdlWindow)
    }
}
