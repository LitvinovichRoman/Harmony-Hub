//
//  MeditationsCell.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 19.10.2024.
//

import UIKit
import AVFoundation

// MARK: - Final Class MeditationCell
final class MeditationCell: UITableViewCell {
    static let reuseIdentifier = "MeditationCell"
    private var player: AVPlayer?
    private var isPlaying = false
    
    private var nameLabel: UILabel = {
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.snp.makeConstraints { $0.width.equalTo(270) }
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    private lazy var mediaButton: CommonButton = {
        $0.snp.makeConstraints { $0.size.equalTo(40) }
        $0.contentMode = .scaleAspectFill
        $0.setImage(Resources.Icons.Buttons.playButton, for: .normal)
        return $0
    }(CommonButton { [ weak self ] in self?.toggleMedia() })
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with meditation: Meditation) {
        let nameWithoutExtension = meditation.name.replacingOccurrences(of: "\\.mp3$", with: "", options: .regularExpression)
        nameLabel.text = nameWithoutExtension
        player = AVPlayer(url: meditation.url)
    }
}

// MARK: - Configure
private extension MeditationCell {
    func configureLayout() {
        backgroundColor = .white.withAlphaComponent(0.3)
        contentView.addSubviews(mediaButton)
        contentView.addSubviews(nameLabel)
        
        mediaButton.snp.makeConstraints {
            $0.centerY.equalTo(contentView)
            $0.leading.equalTo(contentView).inset(8)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.bottom.equalTo(contentView).inset(8)
            $0.leading.equalTo(mediaButton.snp.trailing).offset(8)
            $0.trailing.equalTo(contentView).inset(8)
            $0.centerY.equalTo(contentView)
        }
    }
}

// MARK: - Action
private extension MeditationCell {
    func toggleMedia() {
        switch isPlaying {
        case true: stopAction()
        case false: playAction()
        }
        
        isPlaying.toggle()
        updateMediaButtonImage()
    }

    func playAction() {
        player?.play()
    }

    func stopAction() {
        player?.pause()
        player?.seek(to: .zero)
    }

    func updateMediaButtonImage() {
        let buttonImage = isPlaying ? Resources.Icons.Buttons.stopButton : Resources.Icons.Buttons.playButton
        mediaButton.setImage(buttonImage, for: .normal)
    }
}
