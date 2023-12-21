//
//  main.swift
//  SdlDemo
//
//  Created by Maria Zaitseva on 21.12.2023.
//

import SDL

let screenWidth: Double = 800
let screenHeight: Double = 600

let floorHeight: Double = 100
let display = Display(
    title: "Recty's Adventure",
    height: Int(screenHeight),
    width: Int(screenWidth)
)

let app = App(display: display)

var x: Double = 0

app.run(
    scene: Scene(
        update: { dt in
            x += 10 * dt
        },
        draw: { context in
            context.setClearColor(red: 1, green: 1, blue: 1, alpha: 1)
            context.clear()

            context.setDrawColor(red: 0, green: 0, blue: 0, alpha: 1)
            context.fill(rect: Rect(x: x, y: x, w: 20, h: 20))

            context.setDrawColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
            context.fill(rect: Rect(x: 0, y: screenHeight - floorHeight, w: screenWidth, h: floorHeight))
        }
    )
)


