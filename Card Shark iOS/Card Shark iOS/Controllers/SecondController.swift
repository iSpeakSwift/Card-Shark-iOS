//
//  SecondController.swift
//  Card Shark iOS
//
//  Created by Brandon on 4/9/18.
//  Copyright © 2018 Brandon. All rights reserved.
//

import UIKit

class SecondController: UIViewController, UICollectionViewDelegate{
    
    var deckID = ""
    var deckCount: Int!
    var cards: [Card]!
    var loadedShuffleDeck: ShuffledDeck!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    let reuseIdentifier = "CardCell"
    let sectionInsets = UIEdgeInsets(top: 50.0, left: 10.0, bottom: 50.0, right: 10.0)
    let itemsPerRow: CGFloat = 4
    
    @IBAction func arrange(_ sender: Any) {
        
        let positionOrders = ["CLUBS", "HEARTS", "SPADES", "DIAMONDS"]
      
        let sorted = cards.sorted{ positionOrders.index(of: $0.suit)! < positionOrders.index(of: $1.suit)! }
        cards = sorted

        collectionView.reloadData()
        
    }
    
    @IBAction func reShuffle(_ sender: Any) {
        
        ServerRequest.shuffleDeck(deckID, completion: { (response, data) in
            
            if response.statusCode == 200{
                
                do{
                    let shuffleDeck = try JSONDecoder().decode(DeckOfCards.self, from: data)
                    
                    if (shuffleDeck.shuffled == true){
                        
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let collectionOfCardsShuffled = storyboard.instantiateViewController(withIdentifier: "SecondController") as! SecondController
                        
                        collectionOfCardsShuffled.deckID = shuffleDeck.deck_id
                        
                        ServerRequest.getShuffledDeck(shuffleDeck.deck_id) { (response, data) in
                            
                            if response.statusCode == 200{
                                
                                do{
                                    let shuffledDeck = try JSONDecoder().decode(ShuffledDeck.self, from: data)
                                    
                                    self.loadedShuffleDeck = shuffledDeck
                                    self.cards = shuffledDeck.cards
                                    self.deckCount = shuffledDeck.cards.count
                                    self.collectionView.reloadData()
                                    
                                }catch{
                                    
                                    print("Problem getting shuffled deck of cards.")
                                    
                                }
                                
                            }
                        }
                        
                    }
                    
                }catch{
                    print("Problem shuffling deck of cards.")
                }
            }
            
        })
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
    }
    
}

extension SecondController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

extension SecondController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return deckCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell",
                                                      for: indexPath) as! CardCell
        
        
        let url = URL(string: self.cards[indexPath.item].image)
      
        
        do{
        
            let imageData = try NSData(contentsOf: url!, options: NSData.ReadingOptions.dataReadingMapped)
            let cellImage = UIImage(data: imageData as Data)

            cell.cardView.image = cellImage

            cell.code = self.cards[indexPath.item].code
            cell.suit = self.cards[indexPath.item].suit
            cell.value = self.cards[indexPath.item].value
            
        }catch{
            print("Error")
        }
        
        
        return cell
    }
    

}


