//
//  MediaManager.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 19.10.2024.
//

import Foundation
import AVFAudio

// MARK: - Final Class MediaManager
final class MediaManager {
    static let shared = MediaManager()
    
    private init() {}
    
    func playMeditation(with url: URL) {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.fetchMeditation(from: url)
        }
    }
    
    private func fetchMeditation(from url: URL) {
        var mediaPlayer: AVAudioPlayer?
        
        do {
            mediaPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: "mp3")
            mediaPlayer?.prepareToPlay()
        } catch { return }
        
        DispatchQueue.main.async { mediaPlayer?.play() }
    }
}
