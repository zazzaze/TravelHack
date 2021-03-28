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
    
    func postRequest(request: ServiceRequest, completion: @escaping (_ isSuccess: Bool) -> ()) {
        AF.request("\(Endpoints.book.url.absoluteString)\(request.serviceProviderHeader.bookingId)", method: .post).response { response in
            if response.error != nil {
                completion(false)
            } else {
                completion(true)
            }
        }
    }
    
    public func registerService(request: ServiceRequest, completion: @escaping (_ isSuccess: Bool) -> ()) {
        AF.request("\(Endpoints.book.url.absoluteString)/\(request.serviceProviderHeader.bookingId)", method: .put).response { response in
            completion(response.error == nil)
        }
    }
    
    
}
