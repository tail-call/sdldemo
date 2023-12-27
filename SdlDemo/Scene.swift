//
//  Scene.swift
//  SdlDemo
//
//  Created by Maria Zaitseva on 27.12.2023.
//

import Foundation

struct Scene {
    let update: (_ dt: Double) -> Void
    let draw: () -> Void
}
