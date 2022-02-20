
import UIKit



class PokemonController: UICollectionViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewComponents()
    }
    
    
    
    
    // MARK - Helper Func
    func configureViewComponents(){
        collectionView.backgroundColor = UIColor.orange
    }
}

