
import Foundation




final class WebService {
    
        static let shared = WebService()
        let BASE_URL =  "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    
    
        func getDatas(){
           
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

                        print(resultArr)
                            
                } catch
                {
                    print("err", error.localizedDescription)
                }
                
            }.resume()
            
        }
    

    
}
