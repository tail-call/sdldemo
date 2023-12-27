//
//  main.swift
//  SdlDemo
//
//  Created by Maria Zaitseva on 21.12.2023.
//

import SDL2

let screenWidth: Double = 800
let screenHeight: Double = 600
let floorHeight: Double = 100

guard SDL_Init(SDL_INIT_VIDEO) == 0 else {
    fatalError("SDL could not initialize! SDL_Error: \(String(cString: SDL_GetError()))")
}

let window = Window(
    title: "Great fall of Recty",
    height: Int(screenHeight),
    width: Int(screenWidth)
)

let renderer = Renderer(window: window)
let app = App(renderer: renderer)

var y: Double = 0

let width = 128
let surface = Surface(width: width, height: width)
let pixels = surface.sdlSurface.pointee.pixels!
for x in 0 ..< width * 2 {
    let byte: UInt8 = 128
    pixels.storeBytes(of: byte, toByteOffset: 4 * 3 * x, as: UInt8.self)
    pixels.storeBytes(of: byte, toByteOffset: 4 * 3 * x + 1, as: UInt8.self)
    pixels.storeBytes(of: byte, toByteOffset: 4 * 3 * x + 2, as: UInt8.self)
    pixels.storeBytes(of: byte, toByteOffset: 4 * 3 * x + 3, as: UInt8.self)
}

let texture = Texture(renderer: renderer, surface: surface)

app.run(
    scene: Scene(
        update: { dt in
            if y + 20 <= screenHeight - floorHeight {
                y += 100 * dt
            }
        },
        draw: {
            renderer.setClearColor(red: 1, green: 1, blue: 1, alpha: 1)
            renderer.clear()

            renderer.setDrawColor(red: 0, green: 0, blue: 0, alpha: 1)
            renderer.fill(rect: Rect(x: screenWidth / 2 - 10, y: y, w: 20, h: 20))

            renderer.setDrawColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
            renderer.fill(rect: Rect(x: 0, y: screenHeight - floorHeight, w: screenWidth, h: floorHeight))

            texture.render(at: texture.fullRect.offsetBy(dx: 20, dy: 20))
        }
    )
)


