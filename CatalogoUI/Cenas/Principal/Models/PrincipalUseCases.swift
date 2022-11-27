import Foundation

enum PrincipalUseCases {
    struct Request {
    }

    enum Response {
        struct MenuData: Decodable {
            let menu: Menu
        }

        struct Menu: Decodable {
            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodeKeys.self)
                titulo = try container.decode(String.self, forKey: .titulo)
                descricao = try container.decode(String.self, forKey: .descricao)
                icone = try container.decode(String.self, forKey: .icone)
                cor = try container.decode(String.self, forKey: .cor)
                backgroundColor = try container.decode(String.self, forKey: .backgroundColor)
                destaque = try container.decode(Bool.self, forKey: .destaque)
                if let resultado = try container.decodeIfPresent(URL.self, forKey: .url) {
                    let caminho = "ui\(titulo)"
                    url = resultado.appendingPathComponent(caminho)
                } else {
                    url = nil
                }
            }

            let titulo: String
            let descricao: String
            let icone: String
            let cor: String
            let backgroundColor: String
            let destaque: Bool
            let url: URL?

            private enum CodeKeys: String, CodingKey {
                case titulo
                case descricao
                case icone
                case cor
                case backgroundColor
                case destaque
                case url
            }
        }
    }

    struct ViewModel {
        struct Menu {
            let titulo: String
            let icone: String
            let descricao: String
        }

        let menu: [Menu]
    }
}
