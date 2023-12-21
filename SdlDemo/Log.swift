//
//  Log.swift
//  SdlDemo
//
//  Created by Maria Zaitseva on 21.12.2023.
//

import Foundation

enum Log {
    static func info(_ xs: Any...) {
        print("ℹ️ ", terminator: "")
        for (i, x) in xs.enumerated() {
            print(x, terminator: "")

            if i < xs.endIndex - 1 {
                print(" ", terminator: "")
            }
        }
        print("")
    }
}
