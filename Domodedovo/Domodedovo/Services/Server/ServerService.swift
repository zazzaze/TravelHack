//
//  ServerService.swift
//  Domodedovo
//
//  Created by Егор on 27.03.2021.
//

import Foundation
import Alamofire

class ServerService {
    func loadFormPage(completion: @escaping (_ formPage: ServiceRequest?) -> ()) {
        let contentTypeHeader = HTTPHeader(name: "Content-Type", value: "application/json")
        AF.request(Endpoints.getService.url, method: .get, headers: [contentTypeHeader]).response { response in
            guard let data = response.data,
                  let json = try? JSONDecoder().decode(ServiceRequest.self, from: data)
            else {
                completion(nil)
                return
            }
            completion(json)
        }
    }
}
