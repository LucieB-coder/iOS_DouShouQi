//
//  MusicHelper.swift
//  DouShouQi
//
//  Created by Thomas Chazot on 14/06/2024.
//

import Foundation
import AVFoundation

public class MusicHelper : ObservableObject{
    private var backgroundAudioPlayer: AVAudioPlayer?
    private var audioPlayer: AVAudioPlayer?
    
    private static var musicHelper = MusicHelper()
    
    @Published public var backgroundMusic: Bool = false{
        didSet{
            if (backgroundMusic){
                self.playBackgroundMusic()
            }
            else{
                self.stopBackgroundMusic()
            }
        }
    }
    @Published public var soundEffects: Bool = true

    private init(){
        
    }
    
    static func getMusicHelper() -> MusicHelper {
        return self.musicHelper
    }
    
    func playBackgroundMusic() {
        guard backgroundMusic else{
            return
        }
        
        let aSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "backgroundMusic", ofType: "mp3")!)
        do {
            backgroundAudioPlayer = try AVAudioPlayer(contentsOf:aSound as URL)
            backgroundAudioPlayer!.numberOfLoops = -1
            backgroundAudioPlayer!.prepareToPlay()
            backgroundAudioPlayer!.play()
        } catch {
            
        }
    }
    
    func playLaunchAppMusic() {
        guard soundEffects else{
            return
        }
        let aSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "launchAppMusic", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf:aSound as URL)
            audioPlayer!.numberOfLoops = 0
            audioPlayer!.prepareToPlay()
            audioPlayer!.play()
        } catch {
            
        }
    }
    
    func stopBackgroundMusic(){
        backgroundAudioPlayer?.stop()
    }
    
    func stopSound(){
        audioPlayer?.stop()
    }
    
    func playSound(filePath: String) {
        guard soundEffects else{
            return
        }
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
