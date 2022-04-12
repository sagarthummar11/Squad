//
//  Launcher.swift
//  Squad
//
//  Created by Sagar Thummar on 11/04/2022.
//

import Foundation

struct Launcher {
    
    static func launch(coordinator: MainAppCoordinator) {
        coordinator.navigate(to: .splashScreen)
    }
}
