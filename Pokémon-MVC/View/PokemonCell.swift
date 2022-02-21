

import UIKit


class PokemonCell : UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 10
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init coder implement err!!")
    }
    
    
}



