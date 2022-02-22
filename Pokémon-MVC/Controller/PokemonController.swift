
import UIKit

private let reuseId = "PokemonCell"


class PokemonController: UICollectionViewController {
    
    var pokemonList = [PokemonModel]()
    var filteredPokiList = [PokemonModel]()
    var searchMode = false
    var seachBar: UISearchBar!
   
    
    
// MARK: - Dialog window
    let infoView: DialogInfoView = {
        let view = DialogInfoView()
        view.layer.cornerRadius = 10
        return view
    }()
    
    let visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark) // blur bg color
        let view = UIVisualEffectView(effect: blurEffect)
        return view
    }()
    
    
    // INIT
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
        fetchPokeDatas()
        
    }
    
    // MARK: - Selectors
    
    @objc func searchingFunc(shouldShow: Bool){
      
        if shouldShow {
            let searchBar = UISearchBar()
            searchBar.delegate = self
            searchBar.sizeToFit()
            searchBar.showsCancelButton = true
            searchBar.becomeFirstResponder() // Icona tıklayınca, searchbar focus yapıyor.
            searchBar.tintColor = .black
            searchBar.searchTextField.backgroundColor = .white
            searchBar.searchTextField.textColor = .black
            
            navigationItem.rightBarButtonItem = nil
            navigationItem.titleView = searchBar
        } else {
            
            navigationItem.titleView = nil
            configureSearchBarButton()
            searchMode = false
            collectionView.reloadData()
        }
    }
    
    
    @objc func showSearchBar(){
        searchingFunc(shouldShow: true)
    }
    
    @objc func handleDismissal(){
        dismissInfoView(pokemonModel: nil)
    }
    
    
    
    // MARK: - Helper Func
    
    func showPokemonDetailsController(withPokemon pokemon: PokemonModel) {
        let destinationVC = PokemonDetailsController()
        destinationVC.pokemon = pokemon
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    
    
    
    
    
    func configureSearchBarButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchBar))
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    
    
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
        
        self.configureSearchBarButton()
        
        
        // cell register
        collectionView.register(PokemonCell.self, forCellWithReuseIdentifier: reuseId)
        view.addSubview(visualEffectView)
        visualEffectView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        visualEffectView.alpha = 0
        
        
       
        
        let gesture = UITapGestureRecognizer(target:self, action: #selector(handleDismissal))
        visualEffectView.addGestureRecognizer(gesture)
    }
    
}





// MARK: - collectionView
extension PokemonController {
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchMode ?  filteredPokiList.count : pokemonList.count // bu miktarda hücre olsun demek.
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for:indexPath) as! PokemonCell
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.shadowRadius = 2.5
        cell.layer.shadowOpacity = 1
        cell.layer.masksToBounds = false 
        
        cell.backgroundColor = .mainColor()   // Her hücrenin içi
        cell.pokemon = searchMode ?  filteredPokiList[indexPath.row] : pokemonList[indexPath.row]
        
        cell.delegate = self
        return cell
    }
    
    
    // TODO  SEÇİLDİKTEN SONRA GİDİLECEK VC
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let poke = searchMode ? filteredPokiList[indexPath.row] : pokemonList[indexPath.row]
        
        var pokemonEvoArray = [PokemonModel]()
        
        guard let evoChain = poke.evolutionChain else { return }
        let evolutionChain = EvolutionChain(evolutionArray: evoChain)
        let evoIds = evolutionChain.evolutionIds
        
        evoIds.forEach { (id) in
            
            print("pokemonList[id]", pokemonList[id].name)
            pokemonEvoArray.append(pokemonList[id - 1])
        }
        
        poke.evoArr = pokemonEvoArray    
        showPokemonDetailsController(withPokemon: poke)
    }
}




// MARK: - UICollectionViewDelegateFlowLayout
extension PokemonController:UICollectionViewDelegateFlowLayout {
    
    
    //Hücrenin kenar boşlukları
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 32, left: 8, bottom: 8, right: 8)
    }
    
    
    
    //Bir karenin  w,h'si
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = (view.frame.width - 36) / 3
        return CGSize(width: cellWidth, height: cellWidth + 60)
    }
}





// MARK: - API CALL
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


// MARK: - PokemonCellDelegate //  BURASI Gesture'den Sonra çıkan dialog window için.
extension PokemonController: PokemonCellDelegate {
    
    func presentInfoView(withPokemon pokemonModel: PokemonModel) {
        
        searchingFunc(shouldShow: false)
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        view.addSubview(infoView)
        infoView.configureViewComponents()
        infoView.delegate = self
        infoView.pokemonModel = pokemonModel
        infoView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width - 35, height: 400)
   
        infoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -44).isActive = true
        
        infoView.transform = CGAffineTransform(scaleX: 2.1, y: 1.3)
        infoView.alpha = 0
        
        UIView.animate(withDuration: 0.5) {
            self.visualEffectView.alpha = 1
            self.infoView.alpha = 1
            self.infoView.transform = .identity
        }
    }
    
}







// MARK: - InfoViewDelegate //  BURASI Dialog penceresi ekrandan kaybolurken olanlar.
extension PokemonController: InfoViewDelegate {
    
    
    
    func dismissInfoView(pokemonModel: PokemonModel?) {
        UIView.animate(withDuration: 0.7, animations: {   // Dialog penceresi kaybolma time.
            self.visualEffectView.alpha = 0
            self.infoView.alpha = 0.4
            self.infoView.transform = CGAffineTransform(scaleX: 1.2 , y: 1.2)
            
        }) { (_) in
            self.infoView.removeFromSuperview()
            self.navigationItem.rightBarButtonItem?.isEnabled = true
            guard let pokemonModel = pokemonModel else {
                return
            }
                
            self.showPokemonDetailsController(withPokemon: pokemonModel)
          

        }
    
    
    }
    
    
    func dismissInfoView(withPokemon pokemonModel: PokemonModel?) {
        dismissInfoView(pokemonModel: pokemonModel)
    }
}



// MARK: - UISearchBarDelegate
extension PokemonController: UISearchBarDelegate {
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchingFunc(shouldShow: false)
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty || searchBar.text == nil {
             searchMode = false
             collectionView.reloadData()
             view.endEditing(true)
            
        } else {    // Search mode ON
            searchMode = true
            filteredPokiList = pokemonList.filter( {
                
                $0.name?.range(of: searchText.lowercased()) != nil
                
            })
            
            collectionView.reloadData()
        }
    }
    
}
