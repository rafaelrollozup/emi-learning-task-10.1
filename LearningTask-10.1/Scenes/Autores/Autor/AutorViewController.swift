//
//  AutorViewController.swift
//  LearningTask-10.1
//
//  Created by rafael.rollo on 03/08/2022.
//

import UIKit

class AutorViewController: UITableViewController {
    
    var livrosAPI: LivrosAPI?
    
    var autor: Autor!
    
    var livrosDoAutor: [Livro] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        // Do any additional setup after loading the view.
        
        setupViews()
        carregaLivrosDoAutor()
    }

    private func setupViews() {
        tableView.tableHeaderView = AutorTableHeaderView.constroi(para: autor)
        
        tableView.register(TableSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: TableSectionHeaderView.reuseId)
        tableView.sectionHeaderHeight = TableSectionHeaderView.alturaBase
        tableView.sectionHeaderTopPadding = 0
    }
    
    private func carregaLivrosDoAutor() {
        guard let livrosAPI = livrosAPI else { return }
        livrosDoAutor = livrosAPI.carregaLivros(por: autor)
    }
    
}

// MARK: - UITableViewDataSource Implementations
extension AutorViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return livrosDoAutor.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LivroDoAutorViewCell", for: indexPath) as? LivroDoAutorTableViewCell else {
            fatalError("Não foi possível recuperar célula para livro do autor")
        }
        
        cell.livro = livrosDoAutor[indexPath.row]
        return cell
    }
    
}

// MARK: - UITableViewDelegate Implementations
extension AutorViewController {
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableSectionHeaderView.reuseId) as? TableSectionHeaderView else {
            fatalError("Não foi possível recuperar a view de header para a lista de livros do autor")
        }
        
        headerView.titulo = "Livros publicados"
        return headerView
    }
    
}
