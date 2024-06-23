//
//  MusicHelper.swift
//  AR_Doushouqi
//
//  Created by Thomas Chazot on 23/06/2024.
//

import Foundation
import AVFoundation

public class MusicHelper : ObservableObject{
    private var audioPlayer: AVAudioPlayer?
    
    private static var musicHelper = MusicHelper()

    private init(){
        
    }
    
    static func getMusicHelper() -> MusicHelper {
        return self.musicHelper
    }

    
    
    func stopSound(){
        audioPlayer?.stop()
    }
    
    func playSound(filePath: String) {
        guard let path = Bundle.main.path(forResource: filePath, ofType: "mp3") else {
            return
        }
        let url = URL(fileURLWithPath: path)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
        }
    }
}

