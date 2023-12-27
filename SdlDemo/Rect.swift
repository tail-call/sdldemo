//
//  Rect.swift
//  SdlDemo
//
//  Created by Maria Zaitseva on 27.12.2023.
//

import SDL2

struct Rect {
    let x: Double
    let y: Double
    let w: Double
    let h: Double

    func offsetBy(dx: Double, dy: Double) -> Rect {
        Rect(x: x + dx, y: y + dy, w: w, h: h)
    }
}

func sdlRectFrom(rect: Rect) -> SDL_Rect {
    SDL_Rect(
        x: Int32(rect.x),
        y: Int32(rect.y),
        w: Int32(rect.w),
        h: Int32(rect.h)
    )
}
