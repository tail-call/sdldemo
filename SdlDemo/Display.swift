//
//  Display.swift
//  SdlDemo
//
//  Created by Maria Zaitseva on 21.12.2023.
//

import SDL

struct Rect {
    let x: Double
    let y: Double
    let w: Double
    let h: Double
}

private func sdlRectFrom(rect: Rect) -> SDL_Rect {
    SDL_Rect(
        x: Int32(rect.x),
        y: Int32(rect.y),
        w: Int32(rect.w),
        h: Int32(rect.h)
    )
}

class Display {
    let title: String
    let height: Int
    let width: Int

    /// SDL2 window
    lazy var window: OpaquePointer = {
        SDL_CreateWindow(
            title,
            Int32(SDL_WINDOWPOS_CENTERED_MASK), Int32(SDL_WINDOWPOS_CENTERED_MASK),
            Int32(width), Int32(height),
            UInt32(SDL_WINDOW_SHOWN.rawValue)
        )
    }()

    /// SDL2 renderer
    lazy var renderer: OpaquePointer = {
        SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED.rawValue)
    }()

    struct Context {
        /// SDL2 renderer
        let renderer: OpaquePointer

        func setClearColor(
            red: Double,
            green: Double,
            blue: Double,
            alpha: Double
        ) {
            SDL_SetRenderDrawColor(
                renderer,
                Uint8(floor(red * 255)),
                Uint8(floor(green * 255)),
                Uint8(floor(blue * 255)),
                Uint8(floor(alpha * 255))
            )
        }

        func clear() {
            SDL_RenderClear(renderer)
        }

        func setDrawColor(
            red: Double,
            green: Double,
            blue: Double,
            alpha: Double
        ) {
            SDL_SetRenderDrawColor(
                renderer,
                Uint8(floor(red * 255)),
                Uint8(floor(green * 255)),
                Uint8(floor(blue * 255)),
                Uint8(floor(alpha * 255))
            )
        }

        func fill(rect: Rect) {
            var sdlRect = sdlRectFrom(rect: rect)
            SDL_RenderFillRect(renderer, &sdlRect)
        }
    }

    init(
        title: String,
        height: Int,
        width: Int
    ) {
        guard SDL_Init(SDL_INIT_VIDEO) == 0 else {
            fatalError("SDL could not initialize! SDL_Error: \(String(cString: SDL_GetError()))")
        }

        self.title = title
        self.height = height
        self.width = width
    }

    deinit {
        SDL_DestroyWindow(window)
    }

    func draw(_ callback: (Context) -> Void) {
        callback(Context(renderer: renderer))
        SDL_RenderPresent(renderer)
    }
}
