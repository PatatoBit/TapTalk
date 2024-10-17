//
//  File.swift
//  TouchTalk
//
//  Created by Pat on 17/10/2567 BE.
//

let morseCodeDict: [String: String] = [
    "._": "A", "_...": "B", "_._.": "C", "_..": "D", ".": "E",
    ".._.": "F", "__.": "G", "....": "H", "..": "I", ".___": "J",
    "_._": "K", "._..": "L", "__": "M", "_.": "N", "___": "O",
    ".__.": "P", "__._": "Q", "._.": "R", "...": "S", "_": "T",
    ".._": "U", "..._": "V", ".__": "W", "_.._": "X", "_.__": "Y",
    "__..": "Z", "_____": "0", ".____": "1", "..___": "2", "...__": "3",
    "...._": "4", ".....": "5", "_....": "6", "__...": "7", "___..": "8", "____.": "9"
]

func translateMorseToLetter(_ morseString: String) -> String {
    return morseCodeDict[morseString] ?? "?" // Return "?" if not found
}
