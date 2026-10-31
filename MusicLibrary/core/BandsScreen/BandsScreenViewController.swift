//
//  BandsScreenViewController.swift
//  MusicLibrary
//

import UIKit

class BandsScreenViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let viewModel = BandTableViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Bands"
        setUpTableView()
    }

    private func setUpTableView() {
        let nib = UINib(nibName: "BandsScreenTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: BandsScreenTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        tableView.tableFooterView = UIView()
    }
}

extension BandsScreenViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.getNumberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getNumberOfRows(section: section)
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        viewModel.getTitle(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: BandsScreenTableViewCell.reuseIdentifier,
            for: indexPath
        ) as? BandsScreenTableViewCell else {
            return UITableViewCell()
        }
        cell.configuration(with: viewModel.getBand(index: indexPath))
        return cell
    }
}

extension BandsScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let band = viewModel.getBand(index: indexPath)
        let DiscographyViewController = DiscographyViewController(
            nibName: "DiscographyViewController", bundle: nil
        )
        DiscographyViewController.band = band
        navigationController?.pushViewController(DiscographyViewController, animated: true)
    }
}
