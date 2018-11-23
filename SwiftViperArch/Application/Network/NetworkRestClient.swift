//
//  NetworkRestClient.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import Alamofire
import RxAlamofire
import RxSwift

class NetworkRestClient {
    
    static let shared = NetworkRestClient()
    private let sessionManager: SessionManager = {
        var headers = SessionManager.defaultHTTPHeaders
        headers.updateValue("application/json;charset=UTF-8", forKey: "Content-Type")
        headers.updateValue("no-cache", forKey: "Cache-Control")
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = headers
        configuration.timeoutIntervalForRequest = 45
        configuration.timeoutIntervalForResource = 45
        return SessionManager(configuration: configuration)
    }()
    
    var restClient: RxSwift.Reactive<SessionManager>
    
    private init() {
        self.restClient = sessionManager.rx
    }
    
}

extension ObservableType where Self.E == Alamofire.DataRequest {
    
    func validateBody() -> RxSwift.Observable<Self.E> {
        
        return validate { request,response,data in
            do {
                
                if response.statusCode == 204 && data!.count == 0 {
                    return .success
                }else {
                    let decoder = JSONDecoder()
                    let bodyInfo = try decoder.decode(NetworkHeaderDataOut.self, from: data!)
                    if let returnCode = bodyInfo.returnCode, returnCode != "0000" && returnCode != "0" {
                        return .failure(NetworkError(returnCode, returnMessage: bodyInfo.returnMessage, returnType: bodyInfo.returnType))
                    }else {
                        return .success
                    }
                }
            } catch let error {
                return .failure(error)
            }
        }
    }
}

