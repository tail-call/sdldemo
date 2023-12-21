//
//  App.swift
//  SdlDemo
//
//  Created by Maria Zaitseva on 21.12.2023.
//

import SDL

struct Scene {
    let update: (_ dt: Double) -> Void
    let draw: (Display.Context) -> Void
}

class App {
    let display: Display

    init(display: Display) {
        self.display = display
    }

    func run(scene: Scene) {
        var quit = false
        var event = SDL_Event()

        while !quit {
            scene.update(0.1)

            while SDL_PollEvent(&event) > 0 {
                Log.info("event", event.type)
                if event.type == SDL_QUIT.rawValue {
                    quit = true
                }
            }

            display.draw { context in
                scene.draw(context)
            }

            SDL_Delay(100)
        }

        SDL_Quit()
    }
}
