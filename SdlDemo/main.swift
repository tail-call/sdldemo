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

let width = 64
let height = 64
let surface = Surface(width: width, height: height)
let pixels = surface.sdlSurface.pointee.pixels!
for x in 0 ..< width {
    let byte: UInt8 = 128
    pixels.storeBytes(of: byte, toByteOffset: 4 * x, as: UInt8.self)
    pixels.storeBytes(of: byte, toByteOffset: 4 * x + 1, as: UInt8.self)
    pixels.storeBytes(of: byte, toByteOffset: 4 * x + 2, as: UInt8.self)
    pixels.storeBytes(of: byte, toByteOffset: 4 * x + 3, as: UInt8.self)
}

app.run(
    scene: Scene(
        update: { dt in
            if y + 20 <= screenHeight - floorHeight {
                y += 100 * dt
            }
        },
        draw: { context in
            context.setClearColor(red: 1, green: 1, blue: 1, alpha: 1)
            context.clear()

            context.setDrawColor(red: 0, green: 0, blue: 0, alpha: 1)
            context.fill(rect: Rect(x: screenWidth / 2 - 10, y: y, w: 20, h: 20))

            context.setDrawColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
            context.fill(rect: Rect(x: 0, y: screenHeight - floorHeight, w: screenWidth, h: floorHeight))
        }
    )
)


