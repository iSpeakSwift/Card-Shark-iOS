//
//  ServerRequest.swift
//  Card Shark iOS
//
//  Created by Brandon on 4/9/18.
//  Copyright © 2018 Brandon. All rights reserved.
//

import Foundation

struct ServerRequest{
    
    typealias FetchResult = (HTTPURLResponse, Data) -> Void
    
    static let defaultSession = URLSession(configuration: .default)
    static var dataTask: URLSessionDataTask? = nil
    
    
    //MARK: API (GET) Deck of Cards Request /////////
    /////////////////////////////////////////////////
    
    
    static func getDeckOfCards(completion: @escaping FetchResult){
        
        dataTask?.cancel()
        
        var GetURL =  URL(string: "https://deckofcardsapi.com/api/deck/new/")
        
        var request = URLRequest(url: GetURL!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        dataTask = defaultSession.dataTask(with: request){(data, response, error) in
            
            defer {self.dataTask = nil}

            guard let data = data else {return}
            
            DispatchQueue.main.async {
                completion(response as! HTTPURLResponse, data)
            }
            
        }
        
        dataTask?.resume()
    }
    
    
    //MARK: API (GET) Shuffle Deck Request //////////
    /////////////////////////////////////////////////
    
    
    static func shuffleDeck(_ deckID: String, completion: @escaping FetchResult){
        
        dataTask?.cancel()
        
        var GetURL =  URL(string: "https://deckofcardsapi.com/api/deck/" + deckID + "/shuffle/")
        
        var request = URLRequest(url: GetURL!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        dataTask = defaultSession.dataTask(with: request){(data, response, error) in
            
            defer {self.dataTask = nil}
            
            guard let data = data else {return}
            
            DispatchQueue.main.async {
                completion(response as! HTTPURLResponse, data)
            }
            
        }

        dataTask?.resume()
        
    }
    
    
    //MARK: API (GET) Shuffled Deck Request /////////
    /////////////////////////////////////////////////
    
    
    static func getShuffledDeck(_ deckID: String, completion: @escaping FetchResult){
        
        dataTask?.cancel()
        
        var GetURL =  URL(string: "https://deckofcardsapi.com/api/deck/" + deckID + "/draw/?count=52")
        
        var request = URLRequest(url: GetURL!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        dataTask = defaultSession.dataTask(with: request){(data, response, error) in
            
            defer {self.dataTask = nil}
            
            guard let data = data else {return}
            
            DispatchQueue.main.async {
                completion(response as! HTTPURLResponse, data)
            }
            
        }
        
        dataTask?.resume()
        
    }
 
    
}


