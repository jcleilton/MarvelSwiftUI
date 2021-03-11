//
//  ConnectionSessionManager.swift
//  MarvelSwiftUI (iOS)
//
//  Created by Jose Cleilton Feitosa on 16/02/21.
//

import UIKit

struct ConnectionSessionManager {
    typealias Callback<T: Any, E: Any> = (T, E) -> Void
    var session = URLSession.shared
    
    func invoke(url: String, withArgs args: Dictionary<String, Any>, httpMethod: ConnectionSessionHttpMethod, completion: Callback<Any?, ErrorKind?>?){
        URLCache.shared.removeAllCachedResponses()
        guard let url = URL(string: url) else{
            completion?(nil, ErrorKind.invalidURL)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.description()
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if args.count > 0 {
            do{
                request.httpBody = try JSONSerialization.data(withJSONObject: args, options: .prettyPrinted)
            }catch{
                completion?(nil, ErrorKind.requestError)
            }
        }
        
        self.session.dataTask(with: request, completionHandler: { (data, response, error) in
            guard let _ = error else{
                guard let data = data else {
                    completion?(nil, ErrorKind.noData)
                    return
                }
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: [.allowFragments, .mutableLeaves])
                    completion?(json, nil)
                    return
                }catch{
                    completion?(nil, ErrorKind.noData)
                    return
                }
            }
            completion?(nil, ErrorKind.requestError)
        }).resume()
    }
    
    func downloadImage(from url: URL, completion: @escaping Callback<UIImage?, Error?>){
        URLCache.shared.removeAllCachedResponses()
        self.session.dataTask(with: url, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                guard let error = error else{
                    guard let data = data else{
                        return completion(nil, nil)
                    }
                    let image = UIImage(data: data)
                    return completion(image, nil)
                }
                completion(nil, error)
            }
        }).resume()
    }
    
    
    func simulateRequest(completion: @escaping() -> Void) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: completion)
    }
}

enum ConnectionSessionHttpMethod{
    case post, get
    func description() -> String{
        switch self {
        case .post: return "POST"
        case .get: return "GET"
        }
    }
}

enum Compression {
    /// Fast compression
    case lz4
    
    /// Balanced between speed and compression
    case zlib
    
    /// High compression
    case lzma
    
    /// Apple-specific high performance compression. Faster and better compression than ZLIB, but slower than LZ4 and does not compress as well as LZMA.
    case lzfse
}

enum ConnectionSessionError: Error{
    case invalidUrl, notFound, pushNotificationtokenNotFound, invalidLogin, invalidJSON, userNotLogged, unzipFailed, authTokenNotFound, noResponse
    var localizedDescription: String{
        switch self {
        case .invalidUrl:
            return "URL Inválida"
        case .notFound:
            return "Nenhuma Resposta Encontrada"
        case .pushNotificationtokenNotFound:
            return "Token da Notificação Push não encontrado."
        case .invalidLogin:
            return "Usuário e/ou Senha inválidos."
        case .invalidJSON:
            return "O objeto JSON não pôde ser lido."
        case .userNotLogged:
            return "Usuário deve estar logado."
        case .unzipFailed:
            return "Falha ao realizar o unzip."
        case .authTokenNotFound:
            return "Token de autenticação não encontrado."
        case .noResponse:
            return "Sem resposta do servidor."
        }
    }
    
    func description() -> String{
        switch self {
        case .invalidUrl:
            return "URL Inválida"
        case .notFound:
            return "Nenhuma Resposta Encontrada"
        case .pushNotificationtokenNotFound:
            return "Token da Notificação Push não encontrado."
        case .invalidLogin:
            return "Usuário e/ou Senha inválidos."
        case .invalidJSON:
            return "O objeto JSON não pôde ser lido."
        case .userNotLogged:
            return "Usuário deve estar logado."
        case .unzipFailed:
            return "Falha ao realizar o unzip."
        case .authTokenNotFound:
            return "Token de autenticação não encontrado."
        case .noResponse:
            return "Sem resposta do servidor."
        }
    }
}

enum ErrorKind: Error {
    case noData
    case requestError
    case invalidURL
    case noInternet
    case unauthorizate
    
    var localizedDescription: String {
        switch self {
        case .noData:
            return "Sem dados"
        case .requestError:
            return "Erro na requisição"
        case .invalidURL:
            return "URL inválida"
        case .noInternet:
            return "Sem internet"
        case .unauthorizate:
            return "Acesso negado"
        }
    }
}


