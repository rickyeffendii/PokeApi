//
//  SessionHandlerProtocol.swift
//  PokeApi
//
//  Created by Akhmad Muzaki on 01/06/24.
//

import Foundation

protocol SessionHandlerProtocol {
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ())
}
