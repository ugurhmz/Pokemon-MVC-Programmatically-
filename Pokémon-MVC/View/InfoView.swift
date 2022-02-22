

import UIKit


protocol InfoViewDelegate{
    func dismissInfoView(withPokemon pokemonModel: PokemonModel?)
}


class InfoView: UIView {
    
    var delegate:InfoViewDelegate?
    
    var pokemonModel: PokemonModel?
    
    
    
    
    var pokemon: PokemonModel? {
        didSet {
            guard let pokemon = self.pokemonModel else { return }
            guard let type = pokemon.type else { return }
            guard let defense = pokemon.defense else { return }
            guard let attack = pokemon.attack else { return }
            guard let id = pokemon.id else { return }
            guard let height = pokemon.height else { return }
            guard let weight = pokemon.weight else { return }
            
            imageView.image = pokemon.image
            nameLabel.text = pokemon.name?.capitalized
            
            configureLabel(label: typeLabel, title: "Type", details: type)
            configureLabel(label: defenseLabel, title: "Defense", details: "\(defense)")
            configureLabel(label: heightLabel, title: "Height", details: "\(height)")
            configureLabel(label: weightLabel, title: "Weight", details: "\(weight)")
            configureLabel(label: pokedexIdLabel, title: "Pokedex Id", details: "\(id)")
            configureLabel(label: attackLabel, title: "Base Attack", details: "\(attack)")
        }
    }
    
    
    
    
    
    
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
    
    
    // nameLabel
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Test Balbasr"
        return label
    }()
    
    
    
    // typeLabel
    let typeLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    
    // defenseLabel
    let defenseLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    
    
    // heightLabel
    let heightLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    
    
    // pokedexIdLabel
    let pokedexIdLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    
    
    // attackLabel
    let attackLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    // weightLabel
    let weightLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    
    // infoButton
    let infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .mainColor()
        button.setTitle("Details", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleViewDetail), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        
        return button
    }()
    
    
    
    // INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("Upss!!")
    }
    
    
    // handleWiwDetail
    @objc func handleViewDetail(){
        guard let pokemon = self.pokemonModel else { return }
        delegate?.dismissInfoView(withPokemon: pokemon)
    }
    
    
}



// CONFIGURATIONS
extension InfoView {
    
    
    func configureLabel(label: UILabel, title: String, details: String) {
        
        let attributedText = NSMutableAttributedString(
            attributedString: NSAttributedString(string: "\(title): ",
            attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17),
                         NSAttributedString.Key.foregroundColor: UIColor.mainColor()]))
            
        attributedText.append(NSAttributedString(
            string: "\(details)",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17),
                         NSAttributedString.Key.foregroundColor: UIColor.gray
                        ]))
        
        label.attributedText = attributedText
    }
    
    
    func configureViewForInfoController() {
        addSubview(typeLabel)
        typeLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(defenseLabel)
        defenseLabel.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        let separatorView = UIView()
        separatorView.backgroundColor = .groupTableViewBackground
        addSubview(separatorView)
        separatorView.anchor(top: typeLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 4, paddingBottom: 0, paddingRight: 4, width: 0, height: 1)
        
        addSubview(heightLabel)
        heightLabel.anchor(top: separatorView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(weightLabel)
        weightLabel.anchor(top: heightLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(pokedexIdLabel)
        pokedexIdLabel.anchor(top: separatorView.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        addSubview(attackLabel)
        attackLabel.anchor(top: pokedexIdLabel.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
    }
    
    
    
    func configureViewComponents(){
        backgroundColor = .white
        self.layer.masksToBounds = true
        
        
        addSubview(nameContainerView)
        nameContainerView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        addSubview(imageView)
        imageView.anchor(top: nameContainerView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 24, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 100, height: 60)
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(typeLabel)
        typeLabel.anchor(top: imageView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(defenseLabel)
        defenseLabel.anchor(top: imageView.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        let separatorView = UIView()
        separatorView.backgroundColor = .groupTableViewBackground
        addSubview(separatorView)
        separatorView.anchor(top: typeLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 4, paddingBottom: 0, paddingRight: 4, width: 0, height: 1)
        
        addSubview(heightLabel)
        heightLabel.anchor(top: separatorView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(weightLabel)
        weightLabel.anchor(top: heightLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(pokedexIdLabel)
        pokedexIdLabel.anchor(top: separatorView.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        addSubview(attackLabel)
        attackLabel.anchor(top: pokedexIdLabel.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        addSubview(infoButton)
        infoButton.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 12, paddingBottom: 12, paddingRight: 12, width: 0, height: 50)
        
        
        
    }
    
    
    
}


