

import UIKit


protocol InfoViewDelegate{
    func dismissInfoView(withPokemon pokemonModel: PokemonModel?)
}


class InfoView: UIView {
    
    var delegate:InfoViewDelegate
    
    
    
    // imageView
    let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        
        return imgView
    }()
    
    
    // nameContainerView
    lazy var nameContainerView: UIView = {
       let view = UIView()
        view.backgroundColor = .mainColor()
        view.addSubview(nameLabel)
        view.layer.cornerRadius = 5
        nameLabel.center(inView: view)
        return view
    }()
    
    
    
    
}



