
import Alamofire
import ObjectMapper

class HeroProvider {
    
    let manager = NetworkSessionManager.sharedInstance
    
    func obtainItems(params: Parameters, success:@escaping (NTWHero) -> Void, failure:@escaping (NSError) -> Void)  {
        
        manager.request(params: HeroRouter.getItems(), hud: true) { response in
            
            if(response.1 == nil) {
                guard let resp = response.0 else {
                    failure(NSError.parseError())
                    return
                }
                if let response = Mapper<NTWHero>().map(JSONString: resp) {
                    success(response)
                }
            } else {
                failure(response.1!)
            }
        }
    }
}
