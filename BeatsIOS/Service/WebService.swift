//
//  WebService.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 18/03/22.
//
import Foundation

class Webservice {
    
    var errorString: String = "Error no decode getFones"
    
    func getFones(url: URL, completion: @escaping ([Beat]?) -> ()) {
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {

            let fonesList = try? JSONDecoder().decode(FonesModel.self, from: data)

            if let fonesList = fonesList {
                completion(fonesList.fones)
            }

                print(fonesList?.fones ?? self.errorString)

        }

    }.resume()

        
    }
    
}
