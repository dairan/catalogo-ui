import Foundation
import UIKit

protocol PrincipalServicing {
    func fetchAll(completion: (Result<[PrincipalUseCases.Response.MenuData], PrincipalServiceError>) -> Void)
}

enum PrincipalServiceError: Error {
    case erroNaDecodificacao
}

final class PrincipalService {
}

// MARK: PrincipalServicing
extension PrincipalService: PrincipalServicing {
    func fetchAll(completion: (Result<[PrincipalUseCases.Response.MenuData], PrincipalServiceError>) -> Void) {
        guard let urlPath = Bundle.main.url(forResource: "principal-data", withExtension: "json") else { return }
        guard let data = try? Data(contentsOf: urlPath) else { return }

        let decoder = JSONDecoder()
        do {
            let resultado = try decoder.decode([PrincipalUseCases.Response.MenuData].self, from: data)
            completion(.success(resultado))
        } catch  {
            print("———1628: error", error)
            completion(.failure(.erroNaDecodificacao))
        }
    }
}


struct Principal {
    let menu: String
}
