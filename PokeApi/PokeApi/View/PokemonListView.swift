//
//  PokemonListView.swift
//  PokeApi
//
//  Created by Akhmad Muzaki on 02/06/24.
//

import UIKit

class PokemonListView: UIView {

    private let prevButton: UIButton = UIButton()
    private let nextButton: UIButton = UIButton()
    private let listTable: UITableView = UITableView()
    private let titleLabel: UILabel = UILabel()
    private let pageLabel: UILabel = UILabel()
    
    private let viewModel: PokemonListViewModel
    private var page: Int = 1
    private let maxPage: Int
    private var pokemonList: [Pokemon]
    
    var onOpenPokemonDetail: ((Pokemon) -> Void)?
    
    init(viewModel: PokemonListViewModel) {
        self.viewModel = viewModel
        self.maxPage = viewModel.getMaxPage()
        self.pokemonList = viewModel.getPokemonFor(page: page)
        super.init()
        
        configureLayout()
        copnfigureLabel()
        configureListTable()
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout() {
        let constraints = [
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            listTable.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            listTable.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            pageLabel.topAnchor.constraint(equalTo: listTable.bottomAnchor, constant: 12),
            pageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            prevButton.topAnchor.constraint(equalTo: pageLabel.topAnchor),
            prevButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            nextButton.topAnchor.constraint(equalTo: pageLabel.topAnchor),
            nextButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 12)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func copnfigureLabel() {
        titleLabel.text = "Pokemon List"
        titleLabel.font = .systemFont(ofSize: 24)
        titleLabel.textColor = .black
        titleLabel.sizeToFit()
        
        pageLabel.text = "Page \(page)"
        pageLabel.font = .systemFont(ofSize: 16)
        pageLabel.textColor = .black
        pageLabel.sizeToFit()
    }
    
    private func configureListTable() {
        listTable.delegate = self
        listTable.dataSource = self
        
        listTable.sizeToFit()
    }
    
    private func configureButton() {
        prevButton.setTitle("Prev", for: .normal)
        prevButton.addTarget(self, action: #selector(prevPressed), for: .touchUpInside)
        prevButton.sizeToFit()
        
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)
        nextButton.sizeToFit()
    }
    
    private func reloadPokemon() {
        self.pokemonList = viewModel.getPokemonFor(page: page)
        self.listTable.reloadData()
    }
    
    @objc func prevPressed() {
        if page > 0 {
            if page == 1 {
                prevButton.isHidden = true
            } else if page == maxPage {
                nextButton.isHidden = false
            }
            page -= 1
            reloadPokemon()
        }
    }
    
    @objc func nextPressed() {
        if page < maxPage {
            if page == 0 {
                prevButton.isHidden = false
            } else if page == maxPage - 1 {
                nextButton.isHidden = true
            }
            page += 1
            reloadPokemon()
        }
    }
}

extension PokemonListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.pokemonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PokemonListCell(pokemon: self.pokemonList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.onOpenPokemonDetail?(self.pokemonList[indexPath.row])
    }
    
}
