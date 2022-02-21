
import Foundation




final class WebService {
    
        func getDatas(){
             let url = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
            URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {
                data, response, error in
    
                guard let data = data, error == nil else {
                    return
                }
    
    
                do {
                 
                    guard let resultArray = try JSONSerialization.jsonObject(with: data, options: []) as? [AnyObject]   else      {
                        print("err")
                        return
                    }
                    
                    print(resultArray)
                    
                    
                } catch(let error) {
                    print("err", error.localizedDescription)
                }
    
    
            }).resume()
        }
    
   
    
//    func fetchDatas(url: URL, completion: @escaping(WelcomeClass?) -> ()) {
//
//        URLSession.shared.dataTask(with : url) { data, response ,error in
//
//                guard let data = data, error == nil else {
//                    print("err",error!.localizedDescription)
//                    return
//                }
//
//                do{
//                    let  pokeList = try JSONDecoder().decode(WelcomeClass.self, from: data)
//
//                    print(pokeList)
//                    completion(pokeList)
//
//                } catch {
//                    print("HATA",error.localizedDescription)
//                }
//
//        }.resume()
//
//    }
    
}
