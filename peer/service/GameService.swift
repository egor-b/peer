//
//  GameService.swift
//  peer
//
//  Created by Bryzgalov, Egor (A.) on 5/16/23.
//

import Foundation


class GameService: ObservableObject {
        
    @Published var time: Float = 30.0
    @Published var team = ["","",""]
    
    var timer: Timer!


    func startTimer() {
        timer =  Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if time == 0.0 {
            timer.invalidate()
            time = 0.0
        } else {
            time -= 1.0
        }
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        //     let hours: Int = totalSeconds / 3600
        return String(format: "%02d:%02d", minutes, seconds)
    }

    func resetTimer() {
        timer.invalidate()
        time = 30.0
        startTimer()
    }
    
    func removeTimer() {
        timer.invalidate()
    }
    
    func getQuestions(for game: GameType) -> [Card] {
        var cards = [Card]()
        switch game {
        case .hobbies:
            cards.append(Card(id: 0, text: "What is your favorite hobby outside of work and why?"))
            cards.append(Card(id: 1, text: "If you could turn your hobby into a full-time job, would you do it? Why or why not?"))
            cards.append(Card(id: 2, text: "Have you ever participated in any competitions or events related to your hobby? Tell me about your experience."))
            cards.append(Card(id: 3, text: "What inspired you to start pursuing your current hobby?"))
            cards.append(Card(id: 4, text: "Do you have any funny or interesting stories related to your hobby that you'd like to share?"))
            cards.append(Card(id: 5, text: "If you had unlimited time and resources, what new hobby or activity would you like to try?"))
            cards.append(Card(id: 6, text: "Have you ever taught someone else how to do your hobby? How did that experience go?"))
            cards.append(Card(id: 7, text: "How does your hobby influence or enhance your life outside of work?"))
            cards.append(Card(id: 8, text: "If you could meet any famous person who shares your hobby, who would it be and why?"))
            cards.append(Card(id: 9, text: "Are there any specific goals or milestones you'd like to achieve with your hobby in the future?"))
        case .joke:
            cards.append(Card(id: 0, text: "Why don't scientists trust atoms? Because they make up everything!"))
            cards.append(Card(id: 1, text: "Why don't skeletons fight each other? They don't have the guts!"))
            cards.append(Card(id: 2, text: "What do you call a fake noodle? An impasta!"))
            cards.append(Card(id: 3, text: "Why did the bicycle fall over? Because it was two-tired!"))
            cards.append(Card(id: 4, text: "What do you call a snowman with a six-pack? An abdominal snowman!"))
            cards.append(Card(id: 5, text: "What did one wall say to the other wall? I'll meet you at the corner!"))
            cards.append(Card(id: 6, text: "Why did the scarecrow win an award? Because he was outstanding in his field!"))
            cards.append(Card(id: 7, text: "Why don't scientists trust stairs? Because they're always up to something!"))
            cards.append(Card(id: 8, text: "What's orange and sounds like a parrot? A carrot!"))
            cards.append(Card(id: 9, text: "Why don't oysters donate to charity? Because they are shellfish!"))
        case .petPeeves:
            cards.append(Card(id: 0, text: "Lack of communication"))
            cards.append(Card(id: 1, text: "Micromanagement"))
            cards.append(Card(id: 2, text: "Office politics"))
            cards.append(Card(id: 3, text: "Unreliable colleagues"))
            cards.append(Card(id: 4, text: "Poor work-life balance"))
            cards.append(Card(id: 5, text: "Lack of recognition"))
            cards.append(Card(id: 6, text: "Inefficient processes"))
            cards.append(Card(id: 7, text: "Lack of growth opportunities"))
        case.ideas:
            cards.append(Card(id: 0, text: "Team-building activities"))
            cards.append(Card(id: 1, text: "Cross-departmental projects"))
            cards.append(Card(id: 2, text: "Employee recognition programs"))
            cards.append(Card(id: 3, text: "Mentorship programs"))
            cards.append(Card(id: 4, text: "Social events"))
            cards.append(Card(id: 5, text: "Employee resource groups"))
            cards.append(Card(id: 6, text: "Lunch or coffee buddy program"))
            cards.append(Card(id: 7, text: "Open office spaces or shared work areas"))
            cards.append(Card(id: 8, text: "Virtual collaboration tools"))
            cards.append(Card(id: 9, text: "Employee feedback sessions"))
        }

        return cards
    }
    
    func getRandomeName() -> String {
        return team.randomElement() ?? "name"
    }
    
    func appendElement(_ element: String) {
        team.append(element)
    }
    
    func changeElemnt(at index: Int, element: String) {
        team[index] = element
    }
    
    func changeAmountElements(new amount: Int) {
        if team.count < amount {
            while amount >= team.count - 1 {
                appendElement("")
            }
        } else {
            var i = team.count - 1
            while amount < team.count {
                team.remove(at: i)
                i -= 1
            }
        }
    }
}

    
