import UIKit

class DiscographyViewController: UIViewController {

    @IBOutlet weak var discographyTableView: UITableView!

    var band: BandModel?
    private var viewModel: DiscographyTableViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let band else { return }
        viewModel = DiscographyTableViewModel(band: band)
        title = viewModel.getNavigationTitle()
        setUpTableView(discographyTableView)
    }

    private func setUpTableView(_ tableView: UITableView) {
        let nib = UINib(nibName: "DiscographyTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: DiscographyTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 64
        tableView.tableFooterView = UIView()
    }


}

extension DiscographyViewController: UITableViewDataSource {
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
            withIdentifier: DiscographyTableViewCell.reuseIdentifier,
            for: indexPath
        ) as? DiscographyTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: viewModel.getSong(index: indexPath))
        return cell
    }
}

extension DiscographyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let details = viewModel.getSongDetails(index: indexPath)
        let songDetails = SongDetailsViewController()
        songDetails.band = details.band
        songDetails.album = details.album
        songDetails.song = details.song
        navigationController?.pushViewController(songDetails, animated: true)
    }
}
