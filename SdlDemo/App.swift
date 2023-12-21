//
//  App.swift
//  SdlDemo
//
//  Created by Maria Zaitseva on 21.12.2023.
//

import SDL

class App {
    let display: Display

    init(display: Display) {
        self.display = display
    }

    func run() {
        var quit = false
        var event = SDL_Event()

        while !quit {
            while SDL_PollEvent(&event) > 0 {
                Log.info("event", event.type)
                if event.type == SDL_QUIT.rawValue {
                    quit = true
                }
            }

            display.draw { context in
                context.setClearColor(red: 1, green: 1, blue: 1, alpha: 1)
                context.clear()

                context.setDrawColor(red: 0, green: 0, blue: 0, alpha: 1)
                context.fill(rect: Rect(x: 20, y: 20, w: 20, h: 20))
            }

            SDL_Delay(100)
        }

        SDL_Quit()
    }
}
