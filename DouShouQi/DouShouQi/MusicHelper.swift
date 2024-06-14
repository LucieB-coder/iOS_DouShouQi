//
//  MusicHelper.swift
//  DouShouQi
//
//  Created by Thomas Chazot on 14/06/2024.
//

import Foundation
import AVFoundation

class MusicHelper {
    static var backgroundAudioPlayer: AVAudioPlayer?
    static var audioPlayer: AVAudioPlayer?
    
    static func playBackgroundMusic() {
        let aSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "backgroundMusic", ofType: "mp3")!)
        do {
            backgroundAudioPlayer = try AVAudioPlayer(contentsOf:aSound as URL)
            backgroundAudioPlayer!.numberOfLoops = -1
            backgroundAudioPlayer!.prepareToPlay()
            backgroundAudioPlayer!.play()
        } catch {
            
        }
    }
    
    static func playLaunchAppMusic() {
        let aSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "launchAppMusic", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf:aSound as URL)
            audioPlayer!.numberOfLoops = 0
            audioPlayer!.prepareToPlay()
            audioPlayer!.play()
        } catch {
            
        }
    }
    
    static func stopBackgroundMusic(){
        backgroundAudioPlayer?.stop()
    }
    
    static func stopSound(){
        audioPlayer?.stop()
    }
    
    static func playSound(filePath: String) {
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
