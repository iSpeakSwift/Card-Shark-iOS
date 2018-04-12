//
//  DeckOfCard.swift
//  Card Shark iOS
//
//  Created by Brandon on 4/9/18.
//  Copyright © 2018 Brandon. All rights reserved.
//

import Foundation

struct DeckOfCards: Decodable{
    
    let shuffled: Bool
    let remaining: Int
    let deck_id: String
    let success: Bool
    
}
