//
//  File.swift
//  TapTalk
//
//  Created by Pat on 30/10/2567 BE.
//

import Foundation

struct LessonData: Identifiable {
    let id = UUID()
    var name: String
    var letters: [String]
    var words: [String]
    
    init(name: String, letters: [String], words: [String]) {
        self.name = name
        self.letters = letters
        self.words = words
    }
}

let lessons: [LessonData] = [
    LessonData(name: "E & T - The Shortest Ones", letters: ["e", "t"], words: ["tee", "teet", "etet", "tet", "ette"]),
    LessonData(name: "A & N - Building Basics", letters: ["a", "n"], words: ["an", "at", "ant", "ten", "tan", "net"]),
    LessonData(name: "I & M - Adding to the Mix", letters: ["i", "m"], words: ["aim", "me", "it", "met", "man", "in", "main"]),
    LessonData(name: "S & O - Expanding Sounds", letters: ["s", "o"], words: ["so", "to", "sit", "son", "not", "ton", "on"]),
    LessonData(name: "H & R - Forming New Patterns", letters: ["h", "r"], words: ["her", "hot", "rat", "hat", "art", "star"]),
    LessonData(name: "D & K - Taking Shape", letters: ["d", "k"], words: ["did", "kit", "hit", "red", "dark", "had", "rank"]),
    LessonData(name: "U & G - A Step Further", letters: ["u", "g"], words: ["gut", "tag", "rug", "dug", "hug", "tug", "gun"]),
    LessonData(name: "V & W - Expanding Vocabulary", letters: ["v", "w"], words: ["wav", "vat", "wet", "vet", "wait", "view", "war"]),
    LessonData(name: "F & L - Getting Complex", letters: ["f", "l"], words: ["left", "let", "lit", "felt", "lift", "fit", "flat"]),
    LessonData(name: "P & J - Almost There", letters: ["p", "j"], words: ["jump", "jet", "pet", "tap", "pat", "jam", "jar"]),
    LessonData(name: "B & X - Rounding Out", letters: ["b", "x"], words: ["box", "bee", "bet", "be", "axe", "tax", "bat"]),
    LessonData(name: "C & Y - Nearing Completion", letters: ["c", "y"], words: ["cry", "city", "cat", "act", "yet", "coy"]),
    LessonData(name: "Z & Q - Final Letters", letters: ["z", "q"], words: ["zip", "quiz", "quit", "zoo", "queen"])
]
