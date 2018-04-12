//
//  CardCell.swift
//  Card Shark iOS
//
//  Created by Brandon on 4/9/18.
//  Copyright © 2018 Brandon. All rights reserved.
//

import UIKit

var imageCache = [URL: UIImage]()

class CardCell: UICollectionViewCell {
    
    var value: String = ""
    var code: String = ""
    var suit: String = ""
    

//    var imageUrl: URL!
//
//    var image: UIImage?{
//        didSet{
//            cardView.image = nil
//
//            if let cardImageUrl = imageUrl{
//
//                if let image = imageCache[cardImageUrl]{
//                    cardView.image = image
//                }else{
//
//                    URLSession.shared.dataTask(with: cardImageUrl) { (data, reponse, error) in
//                        if error != nil{
//                            print("error")
//                        }
//
//                        let image = UIImage(data: data!)
//                        imageCache[cardImageUrl] = image
//
//                        DispatchQueue.main.async {
//                            self.cardView.image = image
//                        }
//
//                    }
//                }
//            }
//        }
//    }

    
    @IBOutlet weak var cardView: UIImageView!
    
}
