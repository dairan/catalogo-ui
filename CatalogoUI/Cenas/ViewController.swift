import UIKit
protocol ViewCode {
    func configurarView()
    func adicionarSubViews()
    func configurarConstraits()
    func construirLayout()
}

extension ViewCode {
    func construirLayout() {
        configurarView()
        adicionarSubViews()
        configurarConstraits()
    }

    func configurarView() {
    }
}

class ViewController: UIViewController, ViewCode {
    override func viewDidLoad() {
        super.viewDidLoad()
        construirLayout()
    }

    func adicionarSubViews() {

    }

    func configurarConstraits() {
        
    }
}
