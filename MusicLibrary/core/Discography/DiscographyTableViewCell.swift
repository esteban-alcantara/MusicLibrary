import UIKit

class DiscographyTableViewCell: UITableViewCell {

    static let reuseIdentifier = "SongCell"

    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        accessoryType = .disclosureIndicator
        songTitleLabel.adjustsFontForContentSizeCategory = true
        durationLabel.adjustsFontForContentSizeCategory = true
        durationLabel.textColor = .secondaryLabel
    }

    func configure(with song: SongModel) {
        songTitleLabel.text = song.title
        durationLabel.text = song.formattedDuration
    }
}
