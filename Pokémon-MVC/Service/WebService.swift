
import Foundation




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
                            let pokemonArray = PokemonModel(id: key, dictionary: dict)
                            
                            pokemonArr.append(pokemonArray)
                        
                        }
                        
                        completion(pokemonArr)
                    }
                    
                    
                            
                } catch{
                    print("err", error.localizedDescription)
                }
                
            }.resume()
            
        }
    

    
}
