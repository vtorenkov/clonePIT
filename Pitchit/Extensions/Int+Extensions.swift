//
//  Int+Extensions.swift
//  Pitchit
//
//  Created by Alex on 8/25/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import Foundation

extension Int {
    func secondsToHoursMinutesSeconds () -> (Int, Int, Int) {
        return (self / 3600, (self % 3600) / 60, (self % 3600) % 60)
    }
}
