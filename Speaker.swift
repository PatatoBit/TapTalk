//
//  Speaker.swift
//  TapTalk
//
//  Created by Pat on 26/10/2567 BE.
//

import Foundation
import AVKit
import NaturalLanguage

func speak(text: String, language: String = "en-US") {
    let speechSynthesizer = AVSpeechSynthesizer()
    let utterance = AVSpeechUtterance(string: text)
    utterance.voice = AVSpeechSynthesisVoice(language: language)

    do {
        try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
        try AVAudioSession.sharedInstance().setActive(true)
    } catch {
        print(error.localizedDescription)
    }

    speechSynthesizer.speak(utterance)
}

