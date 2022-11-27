import UIKit

final class PrincipalView: UIView {
    init() {
        super.init(frame: .zero)
        backgroundColor = .systemPink

        addSubview(conteudoTableView)

        NSLayoutConstraint.activate([
            conteudoTableView.topAnchor.constraint(equalTo: topAnchor),
            conteudoTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            conteudoTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            conteudoTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func config(_ viewModel: PrincipalUseCases.ViewModel) {
        self.viewModel = viewModel
    }

    private lazy var conteudoTableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        view.dataSource = self
        view.separatorStyle = .none
        return view
    }()

    private var viewModel: PrincipalUseCases.ViewModel = .init(menu: []) {
        didSet {
            conteudoTableView.reloadData()
        }
    }
}

// MARK: UITableViewDataSource
extension PrincipalView: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        viewModel.count
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        viewModel[section].secao
//    }
//
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        viewModel[section].secao
//    }
//
//    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//        viewModel.map { $0.secao }
//    }
//
//    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
//        index
//    }
//
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.menu.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.menu[indexPath.row]

        var config = UIListContentConfiguration.cell()
        config.text = item.titulo
        config.secondaryText = item.descricao
        config.image = UIImage(systemName: item.icone)

        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.contentConfiguration = config
        return cell
    }
}
