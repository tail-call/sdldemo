//
//  main.swift
//  SdlDemo
//
//  Created by Maria Zaitseva on 21.12.2023.
//

import Foundation

let screenWidth: Double = 800
let screenHeight: Double = 600

let floorHeight: Double = 100
let display = Display(
    title: "Great fall of Recty",
    height: Int(screenHeight),
    width: Int(screenWidth)
)

let app = App(display: display)

var y: Double = 0

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


