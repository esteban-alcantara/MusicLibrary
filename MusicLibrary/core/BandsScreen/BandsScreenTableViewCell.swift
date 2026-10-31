//
//  BandsScreenTableViewCell.swift
//  MusicLibrary
//

import UIKit

class BandsScreenTableViewCell: UITableViewCell {

    static let reuseIdentifier = "BandCell"

    @IBOutlet weak var bandImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        accessoryType = .disclosureIndicator
        bandImageView.contentMode = .scaleAspectFill
        bandImageView.clipsToBounds = true
        nameLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.textColor = .secondaryLabel
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        bandImageView.layer.cornerRadius = bandImageView.bounds.width / 2
    }

    func configuration(with band: BandModel) {
        bandImageView.image = UIImage(named: band.image)
        nameLabel.text = band.name
        descriptionLabel.text = "\(band.country) · \(band.formationYear)"
    }
}
