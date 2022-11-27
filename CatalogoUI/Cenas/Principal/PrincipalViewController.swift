import UIKit

protocol PrincipalDisplayLogic: AnyObject {
    func displayMenu(_ viewModel: PrincipalUseCases.ViewModel)
}

final class PrincipalViewController: ViewController {
    private lazy var principalView = PrincipalView()

    override func loadView() {
        view = principalView
    }

    init(_ interactor: PrincipalBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        interactor.getData()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private let interactor: PrincipalBusinessLogic
}

extension PrincipalViewController: PrincipalDisplayLogic {
    func displayMenu(_ viewModel: PrincipalUseCases.ViewModel) {
        principalView.config(viewModel)
        title = "UIKit Catalog"
    }
}
