//
//  App.swift
//  SdlDemo
//
//  Created by Maria Zaitseva on 21.12.2023.
//

import SDL

class App {
    let renderer: Renderer

    init(renderer: Renderer) {
        self.renderer = renderer
    }

    func run(scene: Scene) {
        var quit = false
        var event = SDL_Event()

        while !quit {
            scene.update(0.05)

            while SDL_PollEvent(&event) > 0 {
                Log.info("event", event.type, event.key.keysym.sym)
                if event.type == SDL_QUIT.rawValue {
                    quit = true
                }
            }

            scene.draw()
            renderer.present()

            SDL_Delay(50)
        }

        SDL_Quit()
    }
}
