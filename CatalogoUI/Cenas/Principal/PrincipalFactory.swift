import UIKit
enum PrincipalFactory {
    static func make() -> UIViewController {
        let service = PrincipalService()
        let presenter = PrincipalPresenter()
        let interactor = PrincipalInteractor(service, presenter)
        let viewController = PrincipalViewController(interactor)

        presenter.viewController = viewController

        return viewController
    }
}
