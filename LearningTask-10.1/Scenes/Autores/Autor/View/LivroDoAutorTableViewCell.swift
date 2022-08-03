//
//  LivroDoAutorTableViewCell.swift
//  LearningTask-10.1
//
//  Created by rafael.rollo on 03/08/2022.
//

import UIKit

class LivroDoAutorTableViewCell: UITableViewCell {

    @IBOutlet private weak var tituloLabel: UILabel!
    @IBOutlet private weak var capaImageView: UIImageView!
    
    var livro: Livro? {
        didSet {
            guard let livro = livro else {
                return
            }

            tituloLabel.text = livro.titulo
            capaImageView.image = UIImage.init(livro.imagemDeCapaURI,
                                               aspectFillIn: capaImageView.frame)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = .texasRose.withAlphaComponent(0.3)
        selectedBackgroundView = bgColorView
    }
    
}

