


import UIKit


class PokemonInfoController: UIViewController {
    
    
    // Ön taraftan geldiğinde ve değiştiğinde..
    var pokemon: PokemonModel? {
        didSet {
            navigationItem.title = pokemon?.name?.capitalized
            
        }
    }
    
    
    // imageView
    let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()

    
    override func viewDidLoad(){
        super.viewDidLoad()
        configureViewComponents()
    }
    
}




// MARK: - configureViewComponents   // Burası Detail sayfası  açılınca, navigationBar altı
extension PokemonInfoController {
    
    
    func configureViewComponents(){
        view.backgroundColor = .white       // Ekran bg
        navigationController?.navigationBar.tintColor = .white  // navigation color
       
        
        view.addSubview(imageView)
        imageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 144, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        
       
        
    }
    
}
