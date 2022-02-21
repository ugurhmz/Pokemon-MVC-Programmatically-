
import UIKit

private let reuseId = "PokemonCell"


class PokemonController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
    }
    
    // searching
   @objc func searchFunc(){
        print(15131231)
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
    }
    
}





// collectionView
extension PokemonController {
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10 // bu miktarda hücre olsun demek.
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for:indexPath) as! PokemonCell
        
        cell.backgroundColor = .gray   // Her hücrenin içi
        return cell
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



