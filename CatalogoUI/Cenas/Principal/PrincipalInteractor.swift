protocol PrincipalBusinessLogic {
    func getData()
}

final class PrincipalInteractor {
    init(_ service: PrincipalServicing, _ presenter: PrincipalPresenterLogic) {
        self.service = service
        self.presenter = presenter
    }

    private let service: PrincipalServicing
    private let presenter: PrincipalPresenterLogic
}

// MARK: PrincipalBusinessLogic
extension PrincipalInteractor: PrincipalBusinessLogic {
    func getData() {
        service.fetchAll { result in
            switch result {
            case .success(let response):
                self.presenter.presenterSuccess(response)
            case .failure(let erro):
                print("———2611: erro", erro)
                self.presenter.presenterError()
            }
        }
    }
}
