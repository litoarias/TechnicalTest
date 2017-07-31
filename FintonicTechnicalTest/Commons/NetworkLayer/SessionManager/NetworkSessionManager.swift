//
//  NetworkSessionManager.swift
//  FintonicTechnicalTest
//
//  Created by Hipolito Arias on 31/7/17.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import Alamofire
import SVProgressHUD

class NetworkSessionManager: SessionManager {
    
    static let sharedInstance : NetworkSessionManager = {
        let instance = NetworkSessionManager()
        return instance
    }()
    
    
    var sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 30
        
        return SessionManager(configuration: configuration)
    }()
    
    
    func request(params: URLRequestConvertible, hud: Bool, completion:@escaping (_ result: String?,_ error: NSError?) -> Void) {
        
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.show()
        
        sessionManager.request(params)
            .debugLog()
            .validate(statusCode: 200..<300)
            .responseJSON {
                
                switch $0.result {
                    
                case .success:
                    
                    guard let data = $0.data else {
                        completion(nil, NSError.parseError())
                        self.dismissHUD(hud)
                        return
                    }
                    
                    if let json = String(data: data, encoding: String.Encoding.utf8) {
                        completion(json, nil)
                    } else {
                        completion(nil, NSError.parseError())
                    }
                    self.dismissHUD(hud)
                    
                case .failure(let error):
                    print("\(error)")
                    self.dismissHUD(hud)
                }
        }
    }
    
    func dismissHUD (_ hud: Bool) {
        if hud {
            SVProgressHUD.dismiss()
        }
    }
    
}

extension Request {
    public func debugLog() -> Self {
        debugPrint(self)
        return self
    }
}

