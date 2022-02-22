

import UIKit



protocol PokemonCellDelegate {
    func presentInfoView(withPokemon pokemonModel: PokemonModel)
}


class PokemonCell : UICollectionViewCell {
    
    
    var delegate: PokemonCellDelegate?
    
    
    var pokemon: PokemonModel? {
        didSet {
            nameLabel.text = pokemon?.name?.capitalized
            imageView.image = pokemon?.image
        }
    }
    

    // nameContainerView
    lazy var  nameContainerView : UIView = {
       let view = UIView()
        view.backgroundColor = .mainColor()
        
        view.addSubview(nameLabel)
        nameLabel.center(inView: view)
        return view
    }()
    
    
    
    
    
    // imageView
    let imageView : UIImageView = {
        let imgView =  UIImageView()
        imgView.backgroundColor = .lightGray
        imgView.contentMode = .scaleAspectFit
        
        return imgView
    }()
    
    
    // nameLabel
    let nameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "Testqwe"
        
        return label
    }()
    
    
    
    
    // Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViewComponents()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init coder implement err!!")
    }
    
    
    
    
    // Selector -
    @objc func handleLongPress(sender: UILongPressGestureRecognizer){
        if sender.state == .began {
            guard let pokemon = self.pokemon else { return }
            print("Long press..",pokemon.name!)
            delegate?.presentInfoView(withPokemon: pokemon)
        }
    }
    
    
    // Helper func
    
    func configureViewComponents(){
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
        
        
        //addSubview -> imageView
        addSubview(imageView)
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: self.frame.height - 32)
        
        
        
        //addSubview -> nameContainerView
        addSubview(nameContainerView)
        nameContainerView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 35)
        
        
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        
        
        self.addGestureRecognizer(longPressGestureRecognizer)
    
    
    
    
    }
    
    
    
}



