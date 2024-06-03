//
//  PartyPokemonView.swift
//  PokeApi
//
//  Created by Akhmad Muzaki on 02/06/24.
//

import UIKit

class PartyPokemonView: UIView {
    
    private let partyPokemon: [OwnedPokemon]
    private let viewModel: PartyPokemonViewModel
    
    private let partyTable = UITableView()
    
    init(viewModel: PartyPokemonViewModel) {
        self.viewModel = viewModel
        self.partyPokemon = viewModel.getOwnedPokemon()
        
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTable() {
        partyTable.delegate = self
        partyTable.dataSource = self
        partyTable.sizeToFit()
    }
}

extension PartyPokemonView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        partyPokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PartyPokemonCell(pokemon: partyPokemon[indexPath.row])
        return cell
    }
    
    
}
