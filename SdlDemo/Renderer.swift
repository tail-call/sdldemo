//
//  Renderer.swift
//  SdlDemo
//
//  Created by Maria Zaitseva on 27.12.2023.
//

import SDL2

class Renderer {
    let window: Window

    init(window: Window) {
        self.window = window
    }

    /// SDL2 renderer
    lazy var sdlRenderer: OpaquePointer = {
        SDL_CreateRenderer(
            window.sdlWindow,
            -1, // Initialize first renderer that is supported
            SDL_RENDERER_ACCELERATED.rawValue
        )
    }()

    func present() {
        SDL_RenderPresent(sdlRenderer)
    }

    func setClearColor(
        red: Double,
        green: Double,
        blue: Double,
        alpha: Double
    ) {
        SDL_SetRenderDrawColor(
            sdlRenderer,
            Uint8(floor(red * 255)),
            Uint8(floor(green * 255)),
            Uint8(floor(blue * 255)),
            Uint8(floor(alpha * 255))
        )
    }

    func clear() {
        SDL_RenderClear(sdlRenderer)
    }

    func setDrawColor(
        red: Double,
        green: Double,
        blue: Double,
        alpha: Double
    ) {
        SDL_SetRenderDrawColor(
            sdlRenderer,
            Uint8(floor(red * 255)),
            Uint8(floor(green * 255)),
            Uint8(floor(blue * 255)),
            Uint8(floor(alpha * 255))
        )
    }

    func fill(rect: Rect) {
        var sdlRect = sdlRectFrom(rect: rect)
        SDL_RenderFillRect(sdlRenderer, &sdlRect)
    }
}
