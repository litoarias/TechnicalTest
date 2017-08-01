
import Alamofire

enum HeroRouter: URLRequestConvertible {
    
    case getItems()
    
    var method: HTTPMethod {
        switch self {
        case .getItems:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getItems:
            return APIConstants.URL.hero
        }
    }
    
    // MARK: URLRequestConvertible    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = try makeurlRequest()
        switch self {
        case .getItems(_):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
        }
        return urlRequest
    }
    
    func makeurlRequest() throws -> URLRequest {
        let url = try APIConstants.URL.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}
