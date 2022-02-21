

import UIKit


class PokemonCell : UICollectionViewCell {
    
    

    // UIView
    lazy var  nameContainerView : UIView = {
       let view = UIView()
        view.backgroundColor = .mainColor()
        
        view.addSubview(nameLabel)
        view.center(inView: view)
        return view
    }()
    
    
    
    
    
    // UIImageView
    let imageView : UIImageView = {
        let imgView =  UIImageView()
        imgView.backgroundColor = .tertiarySystemGroupedBackground
        imgView.contentMode = .scaleAspectFit
        
        return imgView
    }()
    
    
    // UILabel
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
        
        self.layer.cornerRadius = 10
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init coder implement err!!")
    }
    
    
}



