//
//  Texture.swift
//  SdlDemo
//
//  Created by Maria Zaitseva on 27.12.2023.
//

import SDL2

class Texture {
    let renderer: Renderer
    let surface: Surface

    init(renderer: Renderer, surface: Surface) {
        self.renderer = renderer
        self.surface = surface
    }

    lazy var sdlTexture: OpaquePointer = {
        SDL_CreateTextureFromSurface(
            renderer.sdlRenderer,
            surface.sdlSurface
        )!
    }()

    lazy var fullRect: Rect = {
        Rect(
            x: 0,
            y: 0,
            w: Double(surface.width),
            h: Double(surface.height)
        )
    }()

    func render(at rect: Rect) {
        var dstRect = sdlRectFrom(rect: rect)
        var srcRect = sdlRectFrom(rect: fullRect)

        SDL_RenderCopy(
            renderer.sdlRenderer,
            sdlTexture,
            &srcRect,
            &dstRect
        )
    }
}
