//
//  ViewController.swift
//  Card Shark iOS
//
//  Created by Brandon on 4/9/18.
//  Copyright © 2018 Brandon. All rights reserved.
//

import UIKit

class InitialController: UIViewController {
    
    var card: Card!
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBAction func shuffleCards(_ sender: Any) {
        
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
        
        ServerRequest.getDeckOfCards { (response, data) in
            
            if response.statusCode == 200{
                
                self.activityIndicator.stopAnimating()
                
                do {
                    
                    self.activityIndicator.startAnimating()
                    
                    let deckOfCards = try JSONDecoder().decode(DeckOfCards.self, from: data)
                    
                    ServerRequest.shuffleDeck(deckOfCards.deck_id, completion: { (response, data) in
                        
                        if response.statusCode == 200{
                            
                            self.activityIndicator.stopAnimating()
                            
                            do{
                                
                                self.activityIndicator.startAnimating()
                                
                                let shuffleDeck = try JSONDecoder().decode(DeckOfCards.self, from: data)
                                
                                if (shuffleDeck.shuffled == true){
                                    
                                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                    let collectionOfCardsShuffled = storyboard.instantiateViewController(withIdentifier: "SecondController") as! SecondController
                                    
                                    collectionOfCardsShuffled.deckID = shuffleDeck.deck_id
                                    
                                    ServerRequest.getShuffledDeck(shuffleDeck.deck_id) { (response, data) in
                                        
                                        if response.statusCode == 200{
                                            
                                            self.activityIndicator.stopAnimating()
                                            
                                            do{
                                                let shuffledDeck = try JSONDecoder().decode(ShuffledDeck.self, from: data)
                                                
                                                collectionOfCardsShuffled.loadedShuffleDeck = shuffledDeck
                                                collectionOfCardsShuffled.cards = shuffledDeck.cards
                                                collectionOfCardsShuffled.deckCount = shuffledDeck.cards.count
                                                self.navigationController?.pushViewController(collectionOfCardsShuffled, animated: false)
                                                
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
                    
                }catch{
                    print("Problem retrieving deck of cards.")
                }
                
            }
            
        }
        
    }
    
}





