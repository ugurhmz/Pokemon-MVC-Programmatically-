
import UIKit



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
                navBarAppearance.configureWithOpaqueBackground()
            
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
        
    }
    
    
}

