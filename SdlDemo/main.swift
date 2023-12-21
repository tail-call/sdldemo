//
//  main.swift
//  SdlDemo
//
//  Created by Maria Zaitseva on 21.12.2023.
//

import SDL

let display = Display(title: "Recty's Adventure", height: 600, width: 800)

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
        }
    )
)


