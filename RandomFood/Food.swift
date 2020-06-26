//
//  Food.swift
//  RandomFood
//
//  Created by Aries Yang on 2020/6/24.
//  Copyright © 2020 Aries Yang. All rights reserved.
//

import Foundation

struct Food {
    let name: String
    let spicy: Bool
    let type: FoodType
    let level: Level
}

enum FoodType {
    case jp, thai, kr, ch, us, undefined
}

enum Level {
    case expensive, cheap, highCP, normal
}
