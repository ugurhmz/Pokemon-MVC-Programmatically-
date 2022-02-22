
import UIKit

private let reuseId = "PokemonCell"


class PokemonController: UICollectionViewController {
    
    var pokemonList = [PokemonModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
        fetchPokeDatas()
    }
    
    
    let infoView: InfoView = {
        let view = InfoView()
        view.layer.cornerRadius = 5
        return view
    }()
    
    
    let visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blurEffect)
        return view
    }()
    
    
    
    
    
    
    // Selectors - searchFunc
   @objc func searchFunc(){
        print(15131231)
    }
    
    //
    @objc func handleDismissal(){
        dismissInfoView(pokemonModel: nil)
    }
    
    
    
    // MARK - Helper Func
    func configureViewComponents(){
        
        
        if #available(iOS 13.0, *) {
                let navBarAppearance = UINavigationBarAppearance()
                //navBarAppearance.configureWithOpaqueBackground()
            
                navBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                    NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: 28.0)!  ]
                navBarAppearance.backgroundColor = .mainColor()
                navigationController?.navigationBar.barStyle = .black
                navigationController?.navigationBar.standardAppearance = navBarAppearance
                navigationController?.navigationBar.compactAppearance = navBarAppearance
                navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance

                navigationController?.navigationBar.prefersLargeTitles = false
                navigationItem.title = "Pok∑mon®"

            }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchFunc))
        navigationItem.rightBarButtonItem?.tintColor = .white
        
        
        // cell register
        collectionView.register(PokemonCell.self, forCellWithReuseIdentifier: reuseId)
        view.addSubview(visualEffectView)
        visualEffectView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        visualEffectView.alpha = 0
        
        let gesture = UITapGestureRecognizer(target:self, action: #selector(handleDismissal))
        visualEffectView.addGestureRecognizer(gesture)
    }
    
}





// collectionView
extension PokemonController {
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pokemonList.count // bu miktarda hücre olsun demek.
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for:indexPath) as! PokemonCell
        
        cell.backgroundColor = .mainColor()   // Her hücrenin içi
        cell.pokemon = pokemonList[indexPath.item]
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = PokemonInfoController()
        controller.pokemon = pokemonList[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
}




// UICollectionViewDelegateFlowLayout
extension PokemonController:UICollectionViewDelegateFlowLayout {
    
    
    //Hücrenin kenar boşlukları
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 32, left: 8, bottom: 8, right: 8)
    }
    
    
    
    //Bir karenin  w,h'si
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = (view.frame.width - 36) / 3
        return CGSize(width: cellWidth, height: cellWidth)
    }
}





// API CALL
extension PokemonController {
    
    func fetchPokeDatas(){
        WebService.shared.getDatas{ (pokemonArr) in
          
            DispatchQueue.main.async {
                self.pokemonList = pokemonArr
                self.collectionView.reloadData()
            }
        }
    }
    
    
}



extension PokemonController: PokemonCellDelegate {
    
    func presentInfoView(withPokemon pokemonModel: PokemonModel) {
        view.addSubview(infoView)
        infoView.configureViewComponents()
        infoView.delegate = self
        infoView.pokemonModel = pokemonModel
        infoView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width - 64, height: 350)
   
        infoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -44).isActive = true
        
        infoView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        infoView.alpha = 0
        
        UIView.animate(withDuration: 0.5) {
            self.visualEffectView.alpha = 1
            self.infoView.alpha = 1
            self.infoView.transform = .identity
        }
    }
    
}







// InfoViewDelegate
extension PokemonController: InfoViewDelegate {
    
    
    
    func dismissInfoView(pokemonModel: PokemonModel?) {
        UIView.animate(withDuration: 0.5, animations: {
            self.visualEffectView.alpha = 0
            self.infoView.alpha = 0
            self.infoView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            
        }) { (_) in
            self.infoView.removeFromSuperview()
        }
    
    
    }
    
    
    func dismissInfoView(withPokemon pokemonModel: PokemonModel?) {
        dismissInfoView(pokemonModel: pokemonModel)
    }
}

