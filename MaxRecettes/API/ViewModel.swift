import SwiftUI
import SwiftyJSON

class ViewModel: ObservableObject {
    
    @Published var recettes: [Recette] = []
    @Published var categories: [Categorie] = []
    @Published var recettesByCat: [Recette] = []

    func getRecettes() {
        guard let url = URL(string: "https://cooking-recipe2.p.rapidapi.com/") else {
            fatalError("Invalid URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("cooking-recipe2.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        request.setValue("d22746903fmsh28f236afc7e9779p1d0b66jsn84fd8ffef5f5", forHTTPHeaderField: "x-rapidapi-key")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            //let result = try? JSONDecoder().decode([Recette].self, from: data)
            do{
                let result = try JSONDecoder().decode([Recette].self, from: data)
                    DispatchQueue.main.async {
                        self.recettes = result
                    }
            } catch {
                print("cassé")
            }

        }.resume()
    }
    
    func getCategories() {

        guard let url = URL(string: "https://cooking-recipe2.p.rapidapi.com/category") else {
            fatalError("Invalid URL")
        }
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("cooking-recipe2.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        request.setValue("d22746903fmsh28f236afc7e9779p1d0b66jsn84fd8ffef5f5", forHTTPHeaderField: "x-rapidapi-key")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            let result = try? JSONDecoder().decode([Categorie].self, from: data)
            if let result = result {
                DispatchQueue.main.async {
                    self.categories = result
                }
            }
        }.resume()
    }
    
    func getRecettesByCat(cat: String) {
        
        let originalString = "https://cooking-recipe2.p.rapidapi.com/getbycat/\(cat)"
        let urlString = originalString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)

        guard let url = URL(string: urlString!) else {
            fatalError("Invalid URL")
        }
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("cooking-recipe2.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        request.setValue("d22746903fmsh28f236afc7e9779p1d0b66jsn84fd8ffef5f5", forHTTPHeaderField: "x-rapidapi-key")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            let result = try? JSONDecoder().decode([Recette].self, from: data)
            if let result = result {
                DispatchQueue.main.async {
                    self.recettesByCat = result
                }
            }
        }.resume()
    }
}
