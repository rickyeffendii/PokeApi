//
//  SessionHandler.swift
//  PokeApi
//
//  Created by Akhmad Muzaki on 01/06/24.
//

import Foundation

class SessionHandler: SessionHandlerProtocol {
    static let shared: SessionHandler = SessionHandler()
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }

}
