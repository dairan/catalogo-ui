import UIKit

protocol PrincipalPresenterLogic {
    func presenterSuccess(_ response: [PrincipalUseCases.Response.MenuData])
    func presenterError()
}

final class PrincipalPresenter {
    init() {
    }

    weak var viewController: PrincipalDisplayLogic?
}

// MARK: PrincipalPresenterLogic
extension PrincipalPresenter: PrincipalPresenterLogic {
    func presenterSuccess(_ response: [PrincipalUseCases.Response.MenuData]) {
        let menu = response
            .map {
                PrincipalUseCases.ViewModel
                    .Menu(titulo: $0.menu.titulo, icone: $0.menu.icone, descricao: $0.menu.descricao)
            }
        let viewModel = PrincipalUseCases.ViewModel(menu: menu)
        viewController?.displayMenu(viewModel)
    }

    func presenterError() {
    }
}
