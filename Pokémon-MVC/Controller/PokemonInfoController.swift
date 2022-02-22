


import UIKit


class PokemonInfoController: UIViewController {
    
    
    var pokemon: PokemonModel?
    
    
    
    // imageView
    let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    
}
