


import UIKit


class PokemonDetailsController: UIViewController {
    
    
    // Ön taraftan geldiğinde ve değiştiğinde..
    var pokemon: PokemonModel? {
        didSet {
            navigationItem.title = pokemon?.name?.capitalized
            imageView.image = pokemon?.image
            infoLabel.text = pokemon?.description
            infoView.pokemonModel = pokemon
            evoLabel.text = "qwew"
        
            
            if let evoArr = pokemon?.evoArr {
                
                evoArr.forEach { item in
                    print(item.name)
                }
                
               
                if evoArr.count > 1 {
                    firstEvoImageView.image = evoArr[0].image
                    secondEvoImageView.image = evoArr[1].image
                } else {
                    firstEvoImageView.image = evoArr[0].image
                }
            }
            
        }
    }
    
    
    // imageView
    let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    
    // infoLabel
    let infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        
        return label
    }()
    
    
    // MARK: -  infoView         // Burası -> Detay sayfası info bilgilerinin göründüğü kısım.
    let infoView: DialogInfoView = {
        let view = DialogInfoView()
        view.configureViewForInfoController()
        return view
    }()
    
    
    
    // MARK: - evolutionView    // Burası -> NextEvolotion div center
    lazy var evolutionView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        
        view.addSubview(evoLabel)
        evoLabel.translatesAutoresizingMaskIntoConstraints = false
        evoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        evoLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        return view
    }()
    
    
    
    // evoLabel
    let evoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Next Evolotion: TESTT" // div center texti.
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
    
    
    
    // firstEvoImageView // Detay sayfası -> Alt 1. resim ayarı
    let firstEvoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        
        return iv
    }()
    
    
    // secondEvoImageView  // Detay sayfası -> Alt 2. resim ayarı 
    let secondEvoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
    
        return iv
    }()
    
    
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        configureViewComponents()
    }
    
}




// MARK: -  Burası Detail sayfası, tüm ayarlar.
extension PokemonDetailsController {
    
   
    func configureViewComponents(){
        view.backgroundColor = .white       // Ekran bg
        navigationController?.navigationBar.tintColor = .white  // navigation color
       
        
        view.addSubview(imageView)
        imageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 144, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        
        view.addSubview(infoLabel)
        infoLabel.anchor(top: nil, left: imageView.rightAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 44, paddingLeft: 16, paddingBottom: 0, paddingRight: 4, width: 0, height: 0)
        infoLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        
        view.addSubview(infoView)
        infoView.anchor(top: infoLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 150)
        
        view.addSubview(evolutionView)
        evolutionView.anchor(top: infoView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 48, paddingLeft: 0, paddingBottom: 20, paddingRight: 0, width: 0, height: 35)
        
        view.addSubview(firstEvoImageView)
        firstEvoImageView.anchor(top: evolutionView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 32, paddingBottom: 0, paddingRight: 0, width: 120, height: 120)
        
        view.addSubview(secondEvoImageView)
        secondEvoImageView.anchor(top: evolutionView.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 32, width: 120, height: 120)
        
    }
    
}
