//
//  Pomodoro.swift
//  Pompom
//
//  Created by Rachit Mishra on 22/12/19.
//  Copyright © 2019 ceeq. All rights reserved.
//

import SwiftUI

struct Pomodoro: Identifiable {
    var id = UUID()
    var title: String
    var startTime: Date? = nil
    var endTime: Date? = nil
    var didInterrupt: Bool = false

    func start() {

    }

    func getHeightRatio() {
        
    }
}

struct PomodoroCategory: Identifiable {
    var id = UUID()
    var title: String
    var count: Int = 0
}
