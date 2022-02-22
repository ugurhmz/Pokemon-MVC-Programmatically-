
import UIKit




final class WebService {
    
        static let shared = WebService()
        let BASE_URL =  "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    
    
    func getDatas(completion: @escaping ([PokemonModel]) -> ()){
           
            var pokemonArr = [PokemonModel]()
        
            guard let url = URL(string: BASE_URL) else {
                print(" ERR URL")
                return
            }
    
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                                                     
                guard let data = data, error == nil else {
                    return
                }
                
                do {
                    guard let resultArr = try JSONSerialization.jsonObject(with: data, options: []) as? [AnyObject] else { return }

                    
                    for (key, item) in resultArr.enumerated() {
                        
                        if let dict = item as? [String:AnyObject]  {
                            let pokemonObj = PokemonModel(id: key, dictionary: dict)
                            
                            guard let imageUrl = pokemonObj.imageUrl else { return }
                            
                            self.fetchImage(withUrlString: imageUrl) { (image) in
                                pokemonObj.image = image    // O modelin image'sine -> benim fetch'lediğim imageyi ver.
                                pokemonArr.append(pokemonObj)
                                
                                pokemonArr.sort { (poke1, poke2) ->Bool in
                                    return poke1.id! < poke2.id!
                                }
                                
                                completion(pokemonArr)
                            }
                        }
                    }
                    
                } catch{
                    print("err", error.localizedDescription)
                }
                
            }.resume()
            
        }
    
    
    
    // Fetch Image
    private func fetchImage(withUrlString urlString: String, completion: @escaping(UIImage) -> ()) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error  = error {
                print("error", error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            guard let image = UIImage(data:  data) else { return }
            
            completion(image)
        }.resume()
    }
    
}





