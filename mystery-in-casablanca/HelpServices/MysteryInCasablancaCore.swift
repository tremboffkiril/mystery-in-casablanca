import SwiftUI
import StoreKit

let bgColor = Color("mystery_bg_color")
let actionColor = Color("mystery_black_color")
let textColor = Color("mystery_text_color")
let goldColor = Color("mystery_gold_color")

struct MysteryInCasablancaRateService {
    func rateMysteryInCasablanca() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                SKStoreReviewController.requestReview(in: scene)
            }
        }
    }
}

enum MysteryInCasablancaFont: String {
    case light = "Atma-Light"
    case regular = "Atma-Regular"
    case medium = "Atma-Medium"
    case bold = "Atma-Bold"
    
    func font(with size: CGFloat) -> Font {
        return Font.custom(self.rawValue, size: size)
    }
}

struct MysteryInCasablancaTab: Hashable {
    var mysteryInCasablancaTabName: String
    var mysteryInCasablancaTabIcon: String
    var mysteryInCasablancaTabIconSelected: String
    var mysteryInCasablancaTabTag: String
}

enum MysteryInCasablancaMenu: String {
    case go = "Go"
    case yourLevel = "Your level"
    case mysteryStories = "Mystery's talk"
    case rateUs = "Rate us"
}

let mysteryInCasablancaAbout = "Mystery in Casablanca Quiz is an exciting trivia game that combines detective noir storytelling with golf-themed rewards. Players can test their knowledge by answering challenging questions about mysteries, conspiracies, and the secrets of Casablanca. As they progress through different levels, they unlock unique golf clubs, each with its own distinct design and abilities. The game offers an immersive experience with stunning visuals, engaging gameplay, and a captivating atmosphere that blends classic mystery-solving with the thrill of collecting exclusive golfing gear. Whether you're a trivia master or a golf enthusiast, Mystery in Casablanca Quiz offers endless fun and discovery!"

let mysteryInCasablancaRecords: [String] = ["Moly: 114", "Luty: 110", "Boby: 100", "Zare: 98", "Kuki: 86", "Xio: 80", "Cody: 75", "Aero: 54"]
let mysteryInCasablancaMenuArray: [MysteryInCasablancaMenu] = [.go, .yourLevel, .mysteryStories, .rateUs]

var mysteryInCasablancaTabs = [MysteryInCasablancaTab(mysteryInCasablancaTabName: "Home",
                                                      mysteryInCasablancaTabIcon: "mysteryInCasablancaTab1",
                                                      mysteryInCasablancaTabIconSelected: "mysteryInCasablancaTab1_select",
                                                      mysteryInCasablancaTabTag: "1"),
                               MysteryInCasablancaTab(mysteryInCasablancaTabName: "Records",
                                                      mysteryInCasablancaTabIcon: "mysteryInCasablancaTab3",
                                                      mysteryInCasablancaTabIconSelected: "mysteryInCasablancaTab3_select",
                                                      mysteryInCasablancaTabTag: "2"),
                               MysteryInCasablancaTab(mysteryInCasablancaTabName: "Golf sticks",
                                                      mysteryInCasablancaTabIcon: "mysteryInCasablancaTab2",
                                                      mysteryInCasablancaTabIconSelected: "mysteryInCasablancaTab2_select",
                                                      mysteryInCasablancaTabTag: "3"),
                               MysteryInCasablancaTab(mysteryInCasablancaTabName: "My Mystery",
                                                      mysteryInCasablancaTabIcon: "mysteryInCasablancaTab4",
                                                      mysteryInCasablancaTabIconSelected: "mysteryInCasablancaTab4_select",
                                                      mysteryInCasablancaTabTag: "4")]


class CasablancaAnswer {
    let text: String
    let isCorrect: Bool
    
    init(text: String, isCorrect: Bool) {
        self.text = text
        self.isCorrect = isCorrect
    }
}

class CasablancaQuestion {
    let question: String
    let answers: [CasablancaAnswer]
    
    init(question: String, answers: [CasablancaAnswer]) {
        self.question = question
        self.answers = answers
    }
}

let casablancaHardQuiz: [CasablancaQuestion] = [
    CasablancaQuestion(
        question: "What strange symbol is found etched into a café table?",
        answers: [
            CasablancaAnswer(text: "A crescent moon", isCorrect: false),
            CasablancaAnswer(text: "A snake wrapped around a dagger", isCorrect: true),
            CasablancaAnswer(text: "A coded set of numbers", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
        question: "What unusual weather event coincides with the crime?",
        answers: [
            CasablancaAnswer(text: "A sudden sandstorm", isCorrect: true),
            CasablancaAnswer(text: "An unexpected heatwave", isCorrect: false),
            CasablancaAnswer(text: "A heavy downpour", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
        question: "Which item does the detective find hidden inside a street lamp?",
        answers: [
            CasablancaAnswer(text: "A small key", isCorrect: true),
            CasablancaAnswer(text: "A torn photograph", isCorrect: false),
            CasablancaAnswer(text: "A coded message", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
        question: "Where does the detective find a crucial informant?",
        answers: [
            CasablancaAnswer(text: "At the city’s oldest bathhouse", isCorrect: true),
            CasablancaAnswer(text: "At the docks", isCorrect: false),
            CasablancaAnswer(text: "Inside a hidden speakeasy", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
        question: "What coded phrase is whispered before a suspect vanishes?",
        answers: [
            CasablancaAnswer(text: "The nightingale sings at dawn", isCorrect: false),
            CasablancaAnswer(text: "Shadows do not sleep", isCorrect: true),
            CasablancaAnswer(text: "The wind carries secrets", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
        question: "Which item does the villain try to destroy before capture?",
        answers: [
            CasablancaAnswer(text: "A hidden ledger of transactions", isCorrect: true),
            CasablancaAnswer(text: "An old photograph", isCorrect: false),
            CasablancaAnswer(text: "A map of the city", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
        question: "Who betrays the detective unexpectedly?",
        answers: [
            CasablancaAnswer(text: "His closest ally", isCorrect: true),
            CasablancaAnswer(text: "A local merchant", isCorrect: false),
            CasablancaAnswer(text: "A corrupt official", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
        question: "What surprising location is tied to the mystery?",
        answers: [
            CasablancaAnswer(text: "A forgotten train car", isCorrect: true),
            CasablancaAnswer(text: "A closed-down movie theater", isCorrect: false),
            CasablancaAnswer(text: "An abandoned ship", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
        question: "What sound alerts the detective to an intruder?",
        answers: [
            CasablancaAnswer(text: "A ticking clock", isCorrect: false),
            CasablancaAnswer(text: "A glass breaking in the dark", isCorrect: true),
            CasablancaAnswer(text: "A whisper from an unseen source", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
        question: "What unexpected twist changes the course of the investigation?",
        answers: [
            CasablancaAnswer(text: "The prime suspect is found dead", isCorrect: true),
            CasablancaAnswer(text: "A new witness appears with fresh evidence", isCorrect: false),
            CasablancaAnswer(text: "The detective discovers he has been followed", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
            question: "What secret message is found carved into an old wooden desk?",
            answers: [
                CasablancaAnswer(text: "Trust no one", isCorrect: false),
                CasablancaAnswer(text: "Meet me at midnight", isCorrect: true),
                CasablancaAnswer(text: "The key is hidden", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Which mysterious figure is seen watching the detective?",
            answers: [
                CasablancaAnswer(text: "A man in a gray suit", isCorrect: false),
                CasablancaAnswer(text: "A woman in a red dress", isCorrect: true),
                CasablancaAnswer(text: "A street performer with a violin", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What unexpected object is found inside the suspect’s coat pocket?",
            answers: [
                CasablancaAnswer(text: "A torn movie ticket", isCorrect: true),
                CasablancaAnswer(text: "A small bag of sand", isCorrect: false),
                CasablancaAnswer(text: "A silver keychain", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Where does the detective find a crucial hidden clue?",
            answers: [
                CasablancaAnswer(text: "Inside a broken clock", isCorrect: true),
                CasablancaAnswer(text: "Beneath the café’s floorboards", isCorrect: false),
                CasablancaAnswer(text: "In a hollowed-out book", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Which seemingly unimportant detail helps solve the case?",
            answers: [
                CasablancaAnswer(text: "A misplaced newspaper", isCorrect: true),
                CasablancaAnswer(text: "A burnt matchstick", isCorrect: false),
                CasablancaAnswer(text: "A spilled cup of tea", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What phrase does the villain say before escaping?",
            answers: [
                CasablancaAnswer(text: "You’ll never find the truth", isCorrect: false),
                CasablancaAnswer(text: "This isn’t over yet", isCorrect: true),
                CasablancaAnswer(text: "You’re too late, detective", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Who delivers a mysterious package to the detective’s office?",
            answers: [
                CasablancaAnswer(text: "A young newspaper boy", isCorrect: false),
                CasablancaAnswer(text: "A masked stranger", isCorrect: true),
                CasablancaAnswer(text: "A café waiter", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What is discovered inside the abandoned warehouse?",
            answers: [
                CasablancaAnswer(text: "A stash of stolen documents", isCorrect: true),
                CasablancaAnswer(text: "A hidden underground tunnel", isCorrect: false),
                CasablancaAnswer(text: "A locked suitcase", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What famous landmark plays a role in the final clue?",
            answers: [
                CasablancaAnswer(text: "The grand fountain in the city square", isCorrect: false),
                CasablancaAnswer(text: "The old lighthouse by the coast", isCorrect: true),
                CasablancaAnswer(text: "The abandoned railway station", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "How does the detective finally corner the villain?",
            answers: [
                CasablancaAnswer(text: "By setting a trap at the café", isCorrect: false),
                CasablancaAnswer(text: "By using a false lead to lure them out", isCorrect: true),
                CasablancaAnswer(text: "By chasing them through the city", isCorrect: false)
            ]
        ),
    CasablancaQuestion(
            question: "What hidden compartment is found inside the victim’s suitcase?",
            answers: [
                CasablancaAnswer(text: "A secret letter", isCorrect: true),
                CasablancaAnswer(text: "A bundle of foreign currency", isCorrect: false),
                CasablancaAnswer(text: "A stolen passport", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Which unusual scent lingers at the crime scene?",
            answers: [
                CasablancaAnswer(text: "Lavender and tobacco", isCorrect: true),
                CasablancaAnswer(text: "Burnt paper", isCorrect: false),
                CasablancaAnswer(text: "Freshly brewed coffee", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Who is the unexpected witness that provides key information?",
            answers: [
                CasablancaAnswer(text: "A street magician", isCorrect: false),
                CasablancaAnswer(text: "A blind beggar", isCorrect: true),
                CasablancaAnswer(text: "A disgruntled waiter", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What newspaper headline catches the detective’s attention?",
            answers: [
                CasablancaAnswer(text: "Foreign Diplomat Mysteriously Disappears", isCorrect: true),
                CasablancaAnswer(text: "Fire Breaks Out Near the Train Station", isCorrect: false),
                CasablancaAnswer(text: "Rare Gemstone Stolen from Local Museum", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What object does the villain always carry?",
            answers: [
                CasablancaAnswer(text: "A silver cigarette case", isCorrect: true),
                CasablancaAnswer(text: "A monogrammed handkerchief", isCorrect: false),
                CasablancaAnswer(text: "A gold pocket watch", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What distraction helps the detective gain access to a restricted area?",
            answers: [
                CasablancaAnswer(text: "A staged argument", isCorrect: true),
                CasablancaAnswer(text: "A power outage", isCorrect: false),
                CasablancaAnswer(text: "A fire alarm", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What code is hidden inside a book at the detective’s office?",
            answers: [
                CasablancaAnswer(text: "A list of secret meeting locations", isCorrect: true),
                CasablancaAnswer(text: "A love letter from the past", isCorrect: false),
                CasablancaAnswer(text: "A set of instructions for a heist", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "How does the detective realize they have been followed?",
            answers: [
                CasablancaAnswer(text: "A reflection in a shop window", isCorrect: true),
                CasablancaAnswer(text: "A shadow moving in the alley", isCorrect: false),
                CasablancaAnswer(text: "A sudden whisper in their ear", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Where does the final confrontation with the villain take place?",
            answers: [
                CasablancaAnswer(text: "On a moving train", isCorrect: true),
                CasablancaAnswer(text: "Inside a burning warehouse", isCorrect: false),
                CasablancaAnswer(text: "At the city’s grand ballroom", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What unexpected event reveals the truth about the case?",
            answers: [
                CasablancaAnswer(text: "A forgotten letter surfaces", isCorrect: true),
                CasablancaAnswer(text: "A suspect confesses under pressure", isCorrect: false),
                CasablancaAnswer(text: "A hidden camera captures the crime", isCorrect: false)
            ]
        ),
    CasablancaQuestion(
            question: "What mysterious phrase is scribbled on a café napkin?",
            answers: [
                CasablancaAnswer(text: "Midnight at the docks", isCorrect: true),
                CasablancaAnswer(text: "Beware the silent man", isCorrect: false),
                CasablancaAnswer(text: "Follow the stars", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What unexpected clue is found inside a violin case?",
            answers: [
                CasablancaAnswer(text: "A hidden revolver", isCorrect: false),
                CasablancaAnswer(text: "A bundle of secret documents", isCorrect: true),
                CasablancaAnswer(text: "A coded telegram", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Who is the mysterious figure in the photograph found at the crime scene?",
            answers: [
                CasablancaAnswer(text: "A missing diplomat", isCorrect: true),
                CasablancaAnswer(text: "The café owner", isCorrect: false),
                CasablancaAnswer(text: "An unknown woman", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What peculiar sound is heard moments before the crime?",
            answers: [
                CasablancaAnswer(text: "A shattering mirror", isCorrect: false),
                CasablancaAnswer(text: "A distant whistle", isCorrect: true),
                CasablancaAnswer(text: "A ringing bell", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Where does the detective uncover a hidden stash of counterfeit money?",
            answers: [
                CasablancaAnswer(text: "Inside a hollowed-out book", isCorrect: true),
                CasablancaAnswer(text: "Underneath a loose floor tile", isCorrect: false),
                CasablancaAnswer(text: "Taped inside a suitcase", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "How does the detective identify the informant in disguise?",
            answers: [
                CasablancaAnswer(text: "By a tattoo on their wrist", isCorrect: true),
                CasablancaAnswer(text: "By their distinctive perfume", isCorrect: false),
                CasablancaAnswer(text: "By their unusual accent", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What unexpected object falls out of the suspect’s pocket during a chase?",
            answers: [
                CasablancaAnswer(text: "A key with strange markings", isCorrect: true),
                CasablancaAnswer(text: "A train ticket to Madrid", isCorrect: false),
                CasablancaAnswer(text: "A folded letter", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What is the final move that exposes the villain’s plan?",
            answers: [
                CasablancaAnswer(text: "A forged signature is discovered", isCorrect: true),
                CasablancaAnswer(text: "A hidden recording is played", isCorrect: false),
                CasablancaAnswer(text: "A secret witness testifies", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Where is the villain’s secret hideout located?",
            answers: [
                CasablancaAnswer(text: "Behind a hidden wall in an art gallery", isCorrect: true),
                CasablancaAnswer(text: "Inside a luxurious mansion", isCorrect: false),
                CasablancaAnswer(text: "Underneath the city’s main bridge", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What famous quote does the detective say after solving the case?",
            answers: [
                CasablancaAnswer(text: "In Casablanca, nothing is ever what it seems.", isCorrect: true),
                CasablancaAnswer(text: "Some mysteries are better left unsolved.", isCorrect: false),
                CasablancaAnswer(text: "A crime is only a puzzle waiting for the right answer.", isCorrect: false)
            ]
        ),
    CasablancaQuestion(
            question: "What mysterious letter is found in the detective’s mailbox?",
            answers: [
                CasablancaAnswer(text: "An unsigned farewell letter", isCorrect: false),
                CasablancaAnswer(text: "A death threat in red ink", isCorrect: true),
                CasablancaAnswer(text: "A cryptic invitation to a masquerade ball", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Which unusual item is found inside the villain’s coat pocket?",
            answers: [
                CasablancaAnswer(text: "A casino chip from an unknown establishment", isCorrect: false),
                CasablancaAnswer(text: "A train schedule with certain stops circled", isCorrect: true),
                CasablancaAnswer(text: "A lock of hair tied with a red ribbon", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Who unexpectedly helps the detective crack the case?",
            answers: [
                CasablancaAnswer(text: "A taxi driver who overheard a conversation", isCorrect: true),
                CasablancaAnswer(text: "A rival detective with a grudge", isCorrect: false),
                CasablancaAnswer(text: "A street artist who sketches the crime scene", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What clue does the detective find in the fireplace ashes?",
            answers: [
                CasablancaAnswer(text: "A burned passport", isCorrect: false),
                CasablancaAnswer(text: "Half of a torn photograph", isCorrect: true),
                CasablancaAnswer(text: "A piece of silk with an embroidered name", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What unexpected event interrupts the detective’s interrogation?",
            answers: [
                CasablancaAnswer(text: "A blackout sweeps the city", isCorrect: true),
                CasablancaAnswer(text: "A fire alarm goes off in the hotel", isCorrect: false),
                CasablancaAnswer(text: "A mysterious gunshot is heard nearby", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Which unexpected location hides a crucial piece of evidence?",
            answers: [
                CasablancaAnswer(text: "The lining of an old suitcase", isCorrect: true),
                CasablancaAnswer(text: "The base of a streetlamp", isCorrect: false),
                CasablancaAnswer(text: "A locked drawer in a public library", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "How does the detective realize they are being followed?",
            answers: [
                CasablancaAnswer(text: "A shadow moving in every alleyway", isCorrect: false),
                CasablancaAnswer(text: "The same car parked near every stop", isCorrect: true),
                CasablancaAnswer(text: "A recurring whisper in the crowd", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What object does the detective use to unlock a hidden door?",
            answers: [
                CasablancaAnswer(text: "A hairpin left by the victim", isCorrect: false),
                CasablancaAnswer(text: "A custom-made key hidden in a hat", isCorrect: true),
                CasablancaAnswer(text: "A flick of a candle holder revealing a mechanism", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Where does the detective finally catch the villain?",
            answers: [
                CasablancaAnswer(text: "At the train station moments before departure", isCorrect: true),
                CasablancaAnswer(text: "Inside a hidden underground tunnel", isCorrect: false),
                CasablancaAnswer(text: "At a rooftop restaurant overlooking the city", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What poetic phrase does the detective whisper as the case closes?",
            answers: [
                CasablancaAnswer(text: "Casablanca keeps its secrets, but not from me.", isCorrect: true),
                CasablancaAnswer(text: "The night always knows the truth.", isCorrect: false),
                CasablancaAnswer(text: "Another puzzle solved, another shadow cast.", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What mysterious book does the detective find in the suspect’s apartment?",
            answers: [
                CasablancaAnswer(text: "A journal filled with coded entries", isCorrect: true),
                CasablancaAnswer(text: "A novel with a torn cover", isCorrect: false),
                CasablancaAnswer(text: "A guide to rare gemstones", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Which strange message appears on a torn piece of newspaper?",
            answers: [
                CasablancaAnswer(text: "A date circled in red ink", isCorrect: false),
                CasablancaAnswer(text: "A single word: ‘RUN’", isCorrect: true),
                CasablancaAnswer(text: "A list of phone numbers", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What hidden trap does the detective narrowly avoid?",
            answers: [
                CasablancaAnswer(text: "A poisoned drink at the café", isCorrect: false),
                CasablancaAnswer(text: "A rigged step in an old staircase", isCorrect: true),
                CasablancaAnswer(text: "A falling chandelier in a ballroom", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Where does the detective find a missing witness?",
            answers: [
                CasablancaAnswer(text: "Locked inside a warehouse crate", isCorrect: true),
                CasablancaAnswer(text: "Hiding in the church bell tower", isCorrect: false),
                CasablancaAnswer(text: "Disguised as a street performer", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What unusual piece of evidence is found inside an old clock?",
            answers: [
                CasablancaAnswer(text: "A hidden compartment with a key", isCorrect: true),
                CasablancaAnswer(text: "A blood-stained note", isCorrect: false),
                CasablancaAnswer(text: "A rolled-up map", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "How does the detective confirm the suspect’s alibi is false?",
            answers: [
                CasablancaAnswer(text: "A train ticket timestamp proves they were elsewhere", isCorrect: true),
                CasablancaAnswer(text: "A waiter at the café contradicts their story", isCorrect: false),
                CasablancaAnswer(text: "A missing photograph reveals the truth", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What mysterious sound haunts the crime scene every night?",
            answers: [
                CasablancaAnswer(text: "A whispering voice with no source", isCorrect: false),
                CasablancaAnswer(text: "A single knock on a locked door", isCorrect: false),
                CasablancaAnswer(text: "The sound of a clock ticking at the wrong time", isCorrect: true)
            ]
        ),
        CasablancaQuestion(
            question: "What disguise does the villain use to escape?",
            answers: [
                CasablancaAnswer(text: "A street vendor selling newspapers", isCorrect: false),
                CasablancaAnswer(text: "A chauffeur driving a getaway car", isCorrect: false),
                CasablancaAnswer(text: "A priest leading a funeral procession", isCorrect: true)
            ]
        ),
        CasablancaQuestion(
            question: "What unexpected clue does the detective find in an old photograph?",
            answers: [
                CasablancaAnswer(text: "The reflection of the real suspect in a mirror", isCorrect: true),
                CasablancaAnswer(text: "A coded message hidden in the background", isCorrect: false),
                CasablancaAnswer(text: "A familiar shadow standing in the distance", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What chilling message does the detective receive at the end of the case?",
            answers: [
                CasablancaAnswer(text: "You’ve only solved half the mystery", isCorrect: true),
                CasablancaAnswer(text: "The past never stays buried", isCorrect: false),
                CasablancaAnswer(text: "We will meet again, detective", isCorrect: false)
            ]
        )
]


let casablancaMediumQuiz: [CasablancaQuestion] = [
    CasablancaQuestion(
        question: "Who was the last person seen with the missing diplomat?",
        answers: [
            CasablancaAnswer(text: "A local journalist", isCorrect: false),
            CasablancaAnswer(text: "A mysterious woman in red", isCorrect: true),
            CasablancaAnswer(text: "The owner of the café", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
        question: "What item was found at the crime scene?",
        answers: [
            CasablancaAnswer(text: "A blood-stained glove", isCorrect: false),
            CasablancaAnswer(text: "A torn movie ticket", isCorrect: true),
            CasablancaAnswer(text: "An old wristwatch", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
        question: "What was written on the secret note discovered in the detective’s office?",
        answers: [
            CasablancaAnswer(text: "Meet me at the docks at midnight", isCorrect: true),
            CasablancaAnswer(text: "The key is under the statue", isCorrect: false),
            CasablancaAnswer(text: "Beware the man in the gray hat", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
        question: "Which location was the detective’s first stop in the investigation?",
        answers: [
            CasablancaAnswer(text: "A hidden speakeasy", isCorrect: false),
            CasablancaAnswer(text: "The grand hotel", isCorrect: true),
            CasablancaAnswer(text: "The city’s abandoned train station", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
        question: "Who sent the detective an anonymous letter?",
        answers: [
            CasablancaAnswer(text: "A government official", isCorrect: false),
            CasablancaAnswer(text: "A mysterious informant", isCorrect: true),
            CasablancaAnswer(text: "The main suspect", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
        question: "Where does the detective find an important clue?",
        answers: [
            CasablancaAnswer(text: "Inside an old book", isCorrect: true),
            CasablancaAnswer(text: "In a broken streetlamp", isCorrect: false),
            CasablancaAnswer(text: "Hidden in a piano", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
        question: "What mode of transport does the suspect use to escape?",
        answers: [
            CasablancaAnswer(text: "A stolen bicycle", isCorrect: false),
            CasablancaAnswer(text: "A black vintage car", isCorrect: true),
            CasablancaAnswer(text: "A train departing at midnight", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
        question: "What secret organization is involved in the case?",
        answers: [
            CasablancaAnswer(text: "The Crimson Circle", isCorrect: false),
            CasablancaAnswer(text: "The Silent Syndicate", isCorrect: true),
            CasablancaAnswer(text: "The Midnight Order", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
        question: "What does the detective find in the abandoned theater?",
        answers: [
            CasablancaAnswer(text: "A coded message in a film reel", isCorrect: true),
            CasablancaAnswer(text: "A hidden passage behind the stage", isCorrect: false),
            CasablancaAnswer(text: "A mysterious stranger waiting in the shadows", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
        question: "What is the final clue that helps solve the case?",
        answers: [
            CasablancaAnswer(text: "A hidden diary", isCorrect: false),
            CasablancaAnswer(text: "A missing pendant", isCorrect: true),
            CasablancaAnswer(text: "A torn newspaper article", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
        question: "Where is the villain finally confronted?",
        answers: [
            CasablancaAnswer(text: "On a foggy rooftop", isCorrect: true),
            CasablancaAnswer(text: "In a crowded marketplace", isCorrect: false),
            CasablancaAnswer(text: "Inside the city’s cathedral", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
            question: "What is the detective’s signature drink at the café?",
            answers: [
                CasablancaAnswer(text: "Black coffee", isCorrect: false),
                CasablancaAnswer(text: "Whiskey on the rocks", isCorrect: true),
                CasablancaAnswer(text: "Mint tea", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What peculiar sound was heard before the crime took place?",
            answers: [
                CasablancaAnswer(text: "A gunshot", isCorrect: false),
                CasablancaAnswer(text: "A broken glass shattering", isCorrect: false),
                CasablancaAnswer(text: "A whistle from an unknown source", isCorrect: true)
            ]
        ),
        CasablancaQuestion(
            question: "Which street is rumored to be the hub for smugglers in Casablanca?",
            answers: [
                CasablancaAnswer(text: "Rue de l'Oasis", isCorrect: false),
                CasablancaAnswer(text: "Rue des Ombres", isCorrect: true),
                CasablancaAnswer(text: "Avenue des Palmiers", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What does the detective always carry in his coat pocket?",
            answers: [
                CasablancaAnswer(text: "A silver cigarette case", isCorrect: true),
                CasablancaAnswer(text: "A lucky coin", isCorrect: false),
                CasablancaAnswer(text: "A small notebook", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Which landmark plays a crucial role in solving the mystery?",
            answers: [
                CasablancaAnswer(text: "The old lighthouse", isCorrect: true),
                CasablancaAnswer(text: "The grand library", isCorrect: false),
                CasablancaAnswer(text: "The city’s marketplace", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What unusual item is found in the suspect’s apartment?",
            answers: [
                CasablancaAnswer(text: "A single playing card", isCorrect: true),
                CasablancaAnswer(text: "A pair of torn gloves", isCorrect: false),
                CasablancaAnswer(text: "A mysterious photograph", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What name keeps appearing in the detective’s investigation?",
            answers: [
                CasablancaAnswer(text: "Lucien Moreau", isCorrect: true),
                CasablancaAnswer(text: "Jean Dupont", isCorrect: false),
                CasablancaAnswer(text: "Amir Ben Youssef", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What secret passage is discovered beneath the city?",
            answers: [
                CasablancaAnswer(text: "A forgotten smuggler’s tunnel", isCorrect: true),
                CasablancaAnswer(text: "An old underground train station", isCorrect: false),
                CasablancaAnswer(text: "A hidden wine cellar", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What is the final piece of evidence that incriminates the culprit?",
            answers: [
                CasablancaAnswer(text: "A handwritten confession", isCorrect: false),
                CasablancaAnswer(text: "A monogrammed handkerchief", isCorrect: false),
                CasablancaAnswer(text: "A pocket watch with the victim’s initials", isCorrect: true)
            ]
        ),
        CasablancaQuestion(
            question: "How does the detective escape a deadly trap set by the villain?",
            answers: [
                CasablancaAnswer(text: "By picking the lock on a hidden door", isCorrect: false),
                CasablancaAnswer(text: "By using a decoy to distract the villains", isCorrect: true),
                CasablancaAnswer(text: "By jumping out of a second-story window", isCorrect: false)
            ]
        ),
    CasablancaQuestion(
            question: "What is hidden inside the detective’s office safe?",
            answers: [
                CasablancaAnswer(text: "A stack of counterfeit money", isCorrect: false),
                CasablancaAnswer(text: "A secret file on a missing diplomat", isCorrect: true),
                CasablancaAnswer(text: "A locked diary with no key", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Which song is repeatedly played at the café?",
            answers: [
                CasablancaAnswer(text: "La Vie en Rose", isCorrect: false),
                CasablancaAnswer(text: "As Time Goes By", isCorrect: true),
                CasablancaAnswer(text: "Moonlight Serenade", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What cryptic message is found on a torn piece of paper?",
            answers: [
                CasablancaAnswer(text: "Meet me at midnight by the docks", isCorrect: true),
                CasablancaAnswer(text: "The key is under the clock", isCorrect: false),
                CasablancaAnswer(text: "Beware of the man in the gray suit", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Where does the detective chase the suspect?",
            answers: [
                CasablancaAnswer(text: "Through the marketplace", isCorrect: false),
                CasablancaAnswer(text: "Across the rooftops", isCorrect: true),
                CasablancaAnswer(text: "Into the abandoned warehouse", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What object is missing from the crime scene?",
            answers: [
                CasablancaAnswer(text: "A pearl necklace", isCorrect: false),
                CasablancaAnswer(text: "A revolver", isCorrect: false),
                CasablancaAnswer(text: "A leather-bound notebook", isCorrect: true)
            ]
        ),
        CasablancaQuestion(
            question: "Who warns the detective about an upcoming danger?",
            answers: [
                CasablancaAnswer(text: "A newspaper vendor", isCorrect: false),
                CasablancaAnswer(text: "A mysterious stranger in a trench coat", isCorrect: true),
                CasablancaAnswer(text: "A bartender at the café", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What unusual clue is left behind at the train station?",
            answers: [
                CasablancaAnswer(text: "A torn movie ticket", isCorrect: true),
                CasablancaAnswer(text: "A single glove", isCorrect: false),
                CasablancaAnswer(text: "A letter addressed to no one", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Where does the detective finally find the missing person?",
            answers: [
                CasablancaAnswer(text: "A hidden apartment above the café", isCorrect: true),
                CasablancaAnswer(text: "A fishing boat by the docks", isCorrect: false),
                CasablancaAnswer(text: "A locked room in the train station", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What is the name of the underground organization involved in the mystery?",
            answers: [
                CasablancaAnswer(text: "The Black Veil", isCorrect: false),
                CasablancaAnswer(text: "The Silent Syndicate", isCorrect: true),
                CasablancaAnswer(text: "The Crimson Order", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What final move does the villain make before being caught?",
            answers: [
                CasablancaAnswer(text: "Attempts to escape on a train", isCorrect: true),
                CasablancaAnswer(text: "Tries to bribe the detective", isCorrect: false),
                CasablancaAnswer(text: "Disguises themselves as a café waiter", isCorrect: false)
            ]
        ),
    CasablancaQuestion(
            question: "What unusual marking is found on the victim’s wrist?",
            answers: [
                CasablancaAnswer(text: "A crescent moon tattoo", isCorrect: true),
                CasablancaAnswer(text: "A scar shaped like a key", isCorrect: false),
                CasablancaAnswer(text: "A series of numbers", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What secret code is hidden in a book at the library?",
            answers: [
                CasablancaAnswer(text: "A ciphered map of the city", isCorrect: false),
                CasablancaAnswer(text: "The location of a hidden vault", isCorrect: true),
                CasablancaAnswer(text: "A warning about a double agent", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What is the detective’s biggest weakness?",
            answers: [
                CasablancaAnswer(text: "Trusting the wrong people", isCorrect: true),
                CasablancaAnswer(text: "A fear of heights", isCorrect: false),
                CasablancaAnswer(text: "His addiction to gambling", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Where does the villain hide before the final showdown?",
            answers: [
                CasablancaAnswer(text: "In an abandoned opera house", isCorrect: true),
                CasablancaAnswer(text: "Inside a moving train", isCorrect: false),
                CasablancaAnswer(text: "In the mayor’s estate", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What famous phrase does the detective repeat throughout the case?",
            answers: [
                CasablancaAnswer(text: "Every shadow hides a truth", isCorrect: true),
                CasablancaAnswer(text: "A clue is only as good as its seeker", isCorrect: false),
                CasablancaAnswer(text: "Casablanca never sleeps", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What item does the detective always carry for luck?",
            answers: [
                CasablancaAnswer(text: "A silver pocket watch", isCorrect: false),
                CasablancaAnswer(text: "A lucky playing card", isCorrect: true),
                CasablancaAnswer(text: "A piece of an old newspaper", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What role does the fortune teller play in the mystery?",
            answers: [
                CasablancaAnswer(text: "Provides a cryptic warning", isCorrect: true),
                CasablancaAnswer(text: "Reveals the villain’s identity", isCorrect: false),
                CasablancaAnswer(text: "Gives the detective a fake clue", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What secret lies beneath the café’s basement?",
            answers: [
                CasablancaAnswer(text: "A hidden tunnel leading to the docks", isCorrect: true),
                CasablancaAnswer(text: "A stash of stolen gold", isCorrect: false),
                CasablancaAnswer(text: "The remains of a lost heirloom", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What event triggers the start of the mystery?",
            answers: [
                CasablancaAnswer(text: "A masked figure is seen leaving the café", isCorrect: false),
                CasablancaAnswer(text: "A priceless artifact is stolen", isCorrect: true),
                CasablancaAnswer(text: "A strange letter arrives at the detective’s door", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "How does the detective finally uncover the villain’s secret identity?",
            answers: [
                CasablancaAnswer(text: "By matching their handwriting", isCorrect: false),
                CasablancaAnswer(text: "By recognizing a distinctive scar", isCorrect: true),
                CasablancaAnswer(text: "By decoding an old telegram", isCorrect: false)
            ]
        ),
    CasablancaQuestion(
            question: "What mysterious object is found in the detective’s mailbox?",
            answers: [
                CasablancaAnswer(text: "A playing card with a cryptic note", isCorrect: true),
                CasablancaAnswer(text: "A golden key with no label", isCorrect: false),
                CasablancaAnswer(text: "A photograph of the crime scene", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What clue is hidden inside the detective’s old case files?",
            answers: [
                CasablancaAnswer(text: "A missing person’s last letter", isCorrect: false),
                CasablancaAnswer(text: "A torn page from a confidential report", isCorrect: true),
                CasablancaAnswer(text: "A faded map of Casablanca", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What makes the detective suspect the café owner?",
            answers: [
                CasablancaAnswer(text: "They have a duplicate key to the victim’s apartment", isCorrect: true),
                CasablancaAnswer(text: "They left town unexpectedly", isCorrect: false),
                CasablancaAnswer(text: "Their alibi doesn’t match the timeline", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Where does the final piece of the puzzle lead the detective?",
            answers: [
                CasablancaAnswer(text: "An underground hideout", isCorrect: true),
                CasablancaAnswer(text: "The city’s grand theater", isCorrect: false),
                CasablancaAnswer(text: "A deserted train station", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What shocking truth does the detective uncover?",
            answers: [
                CasablancaAnswer(text: "The victim faked their own death", isCorrect: true),
                CasablancaAnswer(text: "The villain is actually an undercover agent", isCorrect: false),
                CasablancaAnswer(text: "The crime was an elaborate distraction", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What hidden room does the detective discover?",
            answers: [
                CasablancaAnswer(text: "A vault behind a bookshelf", isCorrect: true),
                CasablancaAnswer(text: "A secret cellar under the café", isCorrect: false),
                CasablancaAnswer(text: "A tunnel leading to the docks", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Who unexpectedly helps the detective solve the case?",
            answers: [
                CasablancaAnswer(text: "A street musician who saw something unusual", isCorrect: true),
                CasablancaAnswer(text: "A journalist writing about crime in the city", isCorrect: false),
                CasablancaAnswer(text: "A rival detective with their own theory", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What strange message does the detective receive over the phone?",
            answers: [
                CasablancaAnswer(text: "Follow the clock’s shadow", isCorrect: true),
                CasablancaAnswer(text: "The answer is in the past", isCorrect: false),
                CasablancaAnswer(text: "Beware the one who smiles too much", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What secret symbol connects all the clues?",
            answers: [
                CasablancaAnswer(text: "An engraved compass rose", isCorrect: true),
                CasablancaAnswer(text: "A crescent moon pendant", isCorrect: false),
                CasablancaAnswer(text: "A red wax seal", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "How does the detective finally bring the villain to justice?",
            answers: [
                CasablancaAnswer(text: "By revealing evidence in front of witnesses", isCorrect: true),
                CasablancaAnswer(text: "By tricking them into confessing", isCorrect: false),
                CasablancaAnswer(text: "By secretly recording their conversation", isCorrect: false)
            ]
        ),
    CasablancaQuestion(
            question: "What was the detective’s first clue in the case?",
            answers: [
                CasablancaAnswer(text: "A blood-stained handkerchief", isCorrect: false),
                CasablancaAnswer(text: "A mysterious note left at the café", isCorrect: true),
                CasablancaAnswer(text: "A missing watch from the victim’s belongings", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Which location does the detective visit for a secret meeting?",
            answers: [
                CasablancaAnswer(text: "The rooftop of a hotel", isCorrect: false),
                CasablancaAnswer(text: "A hidden courtyard behind the market", isCorrect: true),
                CasablancaAnswer(text: "The old train station", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Who sends the detective an anonymous tip?",
            answers: [
                CasablancaAnswer(text: "A former informant", isCorrect: true),
                CasablancaAnswer(text: "A rival detective", isCorrect: false),
                CasablancaAnswer(text: "A local bartender", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What object does the detective find hidden in the suspect’s room?",
            answers: [
                CasablancaAnswer(text: "A letter with coded instructions", isCorrect: true),
                CasablancaAnswer(text: "A train ticket to Paris", isCorrect: false),
                CasablancaAnswer(text: "A hidden gun under the bed", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "How does the detective identify the true culprit?",
            answers: [
                CasablancaAnswer(text: "By matching fingerprints on a glass", isCorrect: true),
                CasablancaAnswer(text: "By finding a hidden diary", isCorrect: false),
                CasablancaAnswer(text: "By interrogating the suspect", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What secret passage does the detective discover?",
            answers: [
                CasablancaAnswer(text: "A tunnel leading to the docks", isCorrect: true),
                CasablancaAnswer(text: "A hidden stairway behind a bookshelf", isCorrect: false),
                CasablancaAnswer(text: "A door leading to an underground club", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What was the motive behind the crime?",
            answers: [
                CasablancaAnswer(text: "A stolen family heirloom", isCorrect: false),
                CasablancaAnswer(text: "A secret document worth a fortune", isCorrect: true),
                CasablancaAnswer(text: "A revenge plot against an old enemy", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "How does the detective escape a trap set by the villain?",
            answers: [
                CasablancaAnswer(text: "By picking a hidden lock", isCorrect: true),
                CasablancaAnswer(text: "By using a smoke bomb", isCorrect: false),
                CasablancaAnswer(text: "By jumping out of a window", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What disguise does the detective use to infiltrate the enemy’s hideout?",
            answers: [
                CasablancaAnswer(text: "A waiter at the café", isCorrect: false),
                CasablancaAnswer(text: "A newspaper vendor", isCorrect: true),
                CasablancaAnswer(text: "A foreign diplomat", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What final piece of evidence convicts the villain?",
            answers: [
                CasablancaAnswer(text: "A hidden confession letter", isCorrect: true),
                CasablancaAnswer(text: "A photograph from the crime scene", isCorrect: false),
                CasablancaAnswer(text: "An old newspaper article", isCorrect: false)
            ]
        )
]


let casablancaQuiz: [CasablancaQuestion] = [
    CasablancaQuestion(
        question: "In which city does Mystery in Casablanca take place?",
        answers: [
            CasablancaAnswer(text: "Marrakech", isCorrect: false),
            CasablancaAnswer(text: "Casablanca", isCorrect: true),
            CasablancaAnswer(text: "Fez", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
        question: "What genre best describes Mystery in Casablanca?",
        answers: [
            CasablancaAnswer(text: "Fantasy", isCorrect: false),
            CasablancaAnswer(text: "Noir detective", isCorrect: true),
            CasablancaAnswer(text: "Comedy", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
        question: "What time period does the main story take place in?",
        answers: [
            CasablancaAnswer(text: "1920s", isCorrect: false),
            CasablancaAnswer(text: "1940s", isCorrect: true),
            CasablancaAnswer(text: "1960s", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
        question: "What artistic style influenced the visual atmosphere of the story?",
        answers: [
            CasablancaAnswer(text: "Art Deco", isCorrect: true),
            CasablancaAnswer(text: "Baroque", isCorrect: false),
            CasablancaAnswer(text: "Minimalism", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
        question: "What is a key location in the story?",
        answers: [
            CasablancaAnswer(text: "An underground", isCorrect: false),
            CasablancaAnswer(text: "An old café-bistro", isCorrect: true),
            CasablancaAnswer(text: "A book market", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
        question: "What is the name of the main protagonist?",
        answers: [
            CasablancaAnswer(text: "Victor Duval", isCorrect: true),
            CasablancaAnswer(text: "André Benoit", isCorrect: false),
            CasablancaAnswer(text: "Hassan El-Farouk", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
        question: "What is his profession?",
        answers: [
            CasablancaAnswer(text: "Reporter", isCorrect: false),
            CasablancaAnswer(text: "Private detective", isCorrect: true),
            CasablancaAnswer(text: "Bar owner", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
        question: "Who is the mysterious woman from the protagonist’s past?",
        answers: [
            CasablancaAnswer(text: "Isabelle Leroux", isCorrect: true),
            CasablancaAnswer(text: "Sophia Karim", isCorrect: false),
            CasablancaAnswer(text: "Margot Fontaine", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
        question: "What valuable item goes missing at the beginning of the story?",
        answers: [
            CasablancaAnswer(text: "A golden locket", isCorrect: false),
            CasablancaAnswer(text: "A set of secret documents", isCorrect: true),
            CasablancaAnswer(text: "A rare diamond", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
        question: "What clue leads the detective to a secret hideout?",
        answers: [
            CasablancaAnswer(text: "A matchbox with an address", isCorrect: true),
            CasablancaAnswer(text: "A torn photograph", isCorrect: false),
            CasablancaAnswer(text: "A coded letter", isCorrect: false)
        ]
    ),
    CasablancaQuestion(
            question: "What secret society is rumored to be behind the mystery?",
            answers: [
                CasablancaAnswer(text: "The Shadow Circle", isCorrect: true),
                CasablancaAnswer(text: "The Golden Hand", isCorrect: false),
                CasablancaAnswer(text: "The Whispering Masks", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What is the significance of the old café?",
            answers: [
                CasablancaAnswer(text: "It’s where a key witness was last seen", isCorrect: true),
                CasablancaAnswer(text: "It’s owned by the detective", isCorrect: false),
                CasablancaAnswer(text: "It hides an underground tunnel", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "How does the detective decipher a hidden message?",
            answers: [
                CasablancaAnswer(text: "Using a cipher wheel", isCorrect: true),
                CasablancaAnswer(text: "By holding it up to a candle", isCorrect: false),
                CasablancaAnswer(text: "By translating an old book", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Who betrays the detective?",
            answers: [
                CasablancaAnswer(text: "His informant", isCorrect: false),
                CasablancaAnswer(text: "His partner", isCorrect: true),
                CasablancaAnswer(text: "His landlord", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What object helps solve the case?",
            answers: [
                CasablancaAnswer(text: "A broken pocket watch", isCorrect: true),
                CasablancaAnswer(text: "A hidden camera", isCorrect: false),
                CasablancaAnswer(text: "A coded postcard", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What happens at the climax?",
            answers: [
                CasablancaAnswer(text: "A chase through the city", isCorrect: true),
                CasablancaAnswer(text: "A dramatic courtroom reveal", isCorrect: false),
                CasablancaAnswer(text: "A shootout in the desert", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "How does the detective expose the truth?",
            answers: [
                CasablancaAnswer(text: "By tricking the villain into a confession", isCorrect: true),
                CasablancaAnswer(text: "By secretly recording a conversation", isCorrect: false),
                CasablancaAnswer(text: "By finding a hidden diary", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What happens to the villain at the end?",
            answers: [
                CasablancaAnswer(text: "They are arrested", isCorrect: true),
                CasablancaAnswer(text: "They disappear forever", isCorrect: false),
                CasablancaAnswer(text: "They turn themselves in", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What is the final scene of the story?",
            answers: [
                CasablancaAnswer(text: "The detective walking into the mist", isCorrect: true),
                CasablancaAnswer(text: "A celebration at the café", isCorrect: false),
                CasablancaAnswer(text: "A dramatic farewell at the train station", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What poetic phrase does the detective say in the final scene?",
            answers: [
                CasablancaAnswer(text: "Casablanca never changes, but people do.", isCorrect: true),
                CasablancaAnswer(text: "The past is just a shadow in the sand.", isCorrect: false),
                CasablancaAnswer(text: "There’s always another mystery waiting.", isCorrect: false)
            
            ]
        ),
    CasablancaQuestion(
           question: "What lesson does the detective take from the case?",
           answers: [
               CasablancaAnswer(text: "Trust is the rarest currency in Casablanca.", isCorrect: true),
               CasablancaAnswer(text: "The truth always wins in the end.", isCorrect: false),
               CasablancaAnswer(text: "The past is better left forgotten.", isCorrect: false)
           ]
       ),
       CasablancaQuestion(
           question: "What famous Casablanca landmark plays a role in the mystery?",
           answers: [
               CasablancaAnswer(text: "Hassan II Mosque", isCorrect: true),
               CasablancaAnswer(text: "The Old Medina", isCorrect: false),
               CasablancaAnswer(text: "The Royal Palace", isCorrect: false)
           ]
       ),
       CasablancaQuestion(
           question: "What song is playing in the background as the final scene fades?",
           answers: [
               CasablancaAnswer(text: "A melancholic jazz tune", isCorrect: true),
               CasablancaAnswer(text: "A triumphant orchestral score", isCorrect: false),
               CasablancaAnswer(text: "A Moroccan folk melody", isCorrect: false)
           ]
       ),
    CasablancaQuestion(
            question: "What hidden location does the detective discover?",
            answers: [
                CasablancaAnswer(text: "An abandoned warehouse", isCorrect: true),
                CasablancaAnswer(text: "A secret underground bar", isCorrect: false),
                CasablancaAnswer(text: "A rooftop garden", isCorrect: false)
            ]
        ),
    CasablancaQuestion(
            question: "What unusual symbol appears throughout the mystery?",
            answers: [
                CasablancaAnswer(text: "A black raven", isCorrect: false),
                CasablancaAnswer(text: "A crescent moon", isCorrect: true),
                CasablancaAnswer(text: "A red rose", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What is found hidden inside an old book?",
            answers: [
                CasablancaAnswer(text: "A secret map", isCorrect: true),
                CasablancaAnswer(text: "A coded note", isCorrect: false),
                CasablancaAnswer(text: "A lock of hair", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Where does the detective find a missing witness?",
            answers: [
                CasablancaAnswer(text: "A hidden apartment", isCorrect: true),
                CasablancaAnswer(text: "A distant village", isCorrect: false),
                CasablancaAnswer(text: "A prison cell", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What clue leads the detective to a secret hideout?",
            answers: [
                CasablancaAnswer(text: "A matchbox with an address", isCorrect: true),
                CasablancaAnswer(text: "A torn photograph", isCorrect: false),
                CasablancaAnswer(text: "A coded letter", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Which character provides misleading information?",
            answers: [
                CasablancaAnswer(text: "The bartender", isCorrect: true),
                CasablancaAnswer(text: "The newspaper editor", isCorrect: false),
                CasablancaAnswer(text: "The street musician", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What happens at the marketplace during the investigation?",
            answers: [
                CasablancaAnswer(text: "A dramatic chase scene", isCorrect: true),
                CasablancaAnswer(text: "A sudden blackout", isCorrect: false),
                CasablancaAnswer(text: "A mysterious fire", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "How does the villain try to cover their tracks?",
            answers: [
                CasablancaAnswer(text: "By setting fire to a building", isCorrect: true),
                CasablancaAnswer(text: "By bribing the detective", isCorrect: false),
                CasablancaAnswer(text: "By faking their own death", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What unexpected truth about Isabelle is revealed?",
            answers: [
                CasablancaAnswer(text: "She was working for the police all along", isCorrect: true),
                CasablancaAnswer(text: "She was actually the mastermind", isCorrect: false),
                CasablancaAnswer(text: "She had nothing to do with the case", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What secret society is rumored to control Casablanca’s underworld?",
            answers: [
                CasablancaAnswer(text: "The Black Crescent", isCorrect: true),
                CasablancaAnswer(text: "The Golden Dagger", isCorrect: false),
                CasablancaAnswer(text: "The Silent Veil", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What happens during the final confrontation?",
            answers: [
                CasablancaAnswer(text: "A tense standoff at the docks", isCorrect: true),
                CasablancaAnswer(text: "A rooftop chase", isCorrect: false),
                CasablancaAnswer(text: "A courtroom battle", isCorrect: false)
            ]
        ),
    CasablancaQuestion(
            question: "What is the name of the detective in the story?",
            answers: [
                CasablancaAnswer(text: "Victor Duval", isCorrect: true),
                CasablancaAnswer(text: "Andre Benoit", isCorrect: false),
                CasablancaAnswer(text: "Louis Moreau", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What valuable item goes missing at the beginning of the story?",
            answers: [
                CasablancaAnswer(text: "A golden locket", isCorrect: false),
                CasablancaAnswer(text: "A set of secret documents", isCorrect: true),
                CasablancaAnswer(text: "A rare diamond", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Where was the item last seen?",
            answers: [
                CasablancaAnswer(text: "In a locked hotel room", isCorrect: false),
                CasablancaAnswer(text: "Inside a hidden vault", isCorrect: true),
                CasablancaAnswer(text: "At the train station", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What clue leads the detective to the antagonist?",
            answers: [
                CasablancaAnswer(text: "A mysterious key", isCorrect: false),
                CasablancaAnswer(text: "A coded letter", isCorrect: false),
                CasablancaAnswer(text: "A matchbox with an address", isCorrect: true)
            ]
        ),
        CasablancaQuestion(
            question: "What is the name of the detective’s closest ally?",
            answers: [
                CasablancaAnswer(text: "Karim Haddad", isCorrect: true),
                CasablancaAnswer(text: "Louis Moreau", isCorrect: false),
                CasablancaAnswer(text: "Pierre Dumas", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What secret is revealed about the detective’s past?",
            answers: [
                CasablancaAnswer(text: "He was once accused of a crime", isCorrect: false),
                CasablancaAnswer(text: "He used to work for the antagonist", isCorrect: false),
                CasablancaAnswer(text: "He was involved in the case unknowingly", isCorrect: true)
            ]
        ),
        CasablancaQuestion(
            question: "Where does the detective confront the villain?",
            answers: [
                CasablancaAnswer(text: "At a grand theater", isCorrect: false),
                CasablancaAnswer(text: "At the docks", isCorrect: true),
                CasablancaAnswer(text: "In a hidden chamber", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What disguise does the villain use to escape?",
            answers: [
                CasablancaAnswer(text: "A police uniform", isCorrect: true),
                CasablancaAnswer(text: "A merchant’s robes", isCorrect: false),
                CasablancaAnswer(text: "A musician’s costume", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "How does the detective expose the villain’s true identity?",
            answers: [
                CasablancaAnswer(text: "By revealing a hidden tattoo", isCorrect: true),
                CasablancaAnswer(text: "By showing an old photograph", isCorrect: false),
                CasablancaAnswer(text: "By reading a confession letter", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What is the final fate of the antagonist?",
            answers: [
                CasablancaAnswer(text: "They are arrested", isCorrect: true),
                CasablancaAnswer(text: "They escape the country", isCorrect: false),
                CasablancaAnswer(text: "They disappear mysteriously", isCorrect: false)
            ]
        ),
    CasablancaQuestion(
            question: "What is the secret location linked to the antagonist?",
            answers: [
                CasablancaAnswer(text: "A hidden speakeasy", isCorrect: false),
                CasablancaAnswer(text: "An underground bunker", isCorrect: true),
                CasablancaAnswer(text: "A luxury yacht", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Which object contains an encrypted message?",
            answers: [
                CasablancaAnswer(text: "A cigarette case", isCorrect: false),
                CasablancaAnswer(text: "A locket", isCorrect: false),
                CasablancaAnswer(text: "A pocket watch", isCorrect: true)
            ]
        ),
        CasablancaQuestion(
            question: "What does the detective find inside a locked drawer?",
            answers: [
                CasablancaAnswer(text: "A list of secret names", isCorrect: true),
                CasablancaAnswer(text: "A forged passport", isCorrect: false),
                CasablancaAnswer(text: "A stash of counterfeit money", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What unexpected ally helps the detective?",
            answers: [
                CasablancaAnswer(text: "A former smuggler", isCorrect: true),
                CasablancaAnswer(text: "A corrupt politician", isCorrect: false),
                CasablancaAnswer(text: "A traveling journalist", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Where does the final confrontation take place?",
            answers: [
                CasablancaAnswer(text: "At a lighthouse", isCorrect: false),
                CasablancaAnswer(text: "On a moving train", isCorrect: true),
                CasablancaAnswer(text: "In a grand ballroom", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What clue was hidden inside the detective’s office all along?",
            answers: [
                CasablancaAnswer(text: "A coded letter", isCorrect: false),
                CasablancaAnswer(text: "A hidden compartment in his desk", isCorrect: true),
                CasablancaAnswer(text: "A photograph on the wall", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What false assumption almost ruins the case?",
            answers: [
                CasablancaAnswer(text: "Believing a key witness", isCorrect: true),
                CasablancaAnswer(text: "Trusting an old newspaper article", isCorrect: false),
                CasablancaAnswer(text: "Ignoring a minor character", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "How does the detective discover the true identity of the mastermind?",
            answers: [
                CasablancaAnswer(text: "Through handwriting analysis", isCorrect: false),
                CasablancaAnswer(text: "By matching a rare perfume scent", isCorrect: true),
                CasablancaAnswer(text: "By recognizing an old scar", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What unexpected event shifts the investigation?",
            answers: [
                CasablancaAnswer(text: "A power outage in the city", isCorrect: false),
                CasablancaAnswer(text: "A second crime occurs", isCorrect: true),
                CasablancaAnswer(text: "A new witness arrives from abroad", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What does the detective choose to do at the end of the case?",
            answers: [
                CasablancaAnswer(text: "Leave Casablanca forever", isCorrect: false),
                CasablancaAnswer(text: "Continue working on mysteries", isCorrect: true),
                CasablancaAnswer(text: "Retire and write his memoirs", isCorrect: false)
            ]
        ),
    CasablancaQuestion(
            question: "Who sends the detective an anonymous letter?",
            answers: [
                CasablancaAnswer(text: "A government official", isCorrect: false),
                CasablancaAnswer(text: "A mysterious informant", isCorrect: true),
                CasablancaAnswer(text: "The main suspect", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What unusual event happens at midnight?",
            answers: [
                CasablancaAnswer(text: "A blackout in the city", isCorrect: true),
                CasablancaAnswer(text: "A car explosion", isCorrect: false),
                CasablancaAnswer(text: "A hidden safe is found", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Where does the detective find a hidden passage?",
            answers: [
                CasablancaAnswer(text: "Behind a bookshelf", isCorrect: true),
                CasablancaAnswer(text: "Under a fountain", isCorrect: false),
                CasablancaAnswer(text: "Inside a piano", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What disguise does the detective use to infiltrate a meeting?",
            answers: [
                CasablancaAnswer(text: "A chef's uniform", isCorrect: false),
                CasablancaAnswer(text: "A janitor's outfit", isCorrect: false),
                CasablancaAnswer(text: "A military officer's coat", isCorrect: true)
            ]
        ),
        CasablancaQuestion(
            question: "What key item is found in a suspect's pocket?",
            answers: [
                CasablancaAnswer(text: "A train ticket", isCorrect: false),
                CasablancaAnswer(text: "A coded note", isCorrect: true),
                CasablancaAnswer(text: "A silver locket", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "How does the detective confirm a suspect's alibi?",
            answers: [
                CasablancaAnswer(text: "By checking security footage", isCorrect: false),
                CasablancaAnswer(text: "By verifying a hotel registry", isCorrect: true),
                CasablancaAnswer(text: "By speaking to a street vendor", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What object does the villain leave behind at the crime scene?",
            answers: [
                CasablancaAnswer(text: "A bloody handkerchief", isCorrect: false),
                CasablancaAnswer(text: "A single playing card", isCorrect: true),
                CasablancaAnswer(text: "A golden watch", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "Where does the detective finally trap the mastermind?",
            answers: [
                CasablancaAnswer(text: "In a secluded alley", isCorrect: false),
                CasablancaAnswer(text: "At a train station", isCorrect: false),
                CasablancaAnswer(text: "On a rooftop", isCorrect: true)
            ]
        ),
        CasablancaQuestion(
            question: "What final piece of evidence seals the case?",
            answers: [
                CasablancaAnswer(text: "A confession letter", isCorrect: true),
                CasablancaAnswer(text: "A stolen painting", isCorrect: false),
                CasablancaAnswer(text: "A broken locket", isCorrect: false)
            ]
        ),
        CasablancaQuestion(
            question: "What does the detective say in his final monologue?",
            answers: [
                CasablancaAnswer(text: "The city may forget, but I never will.", isCorrect: true),
                CasablancaAnswer(text: "Justice always finds a way.", isCorrect: false),
                CasablancaAnswer(text: "Some mysteries should remain unsolved.", isCorrect: false)
            ]
        )
]

class StickImage {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

class StickItem {
    let name: String
    let description: String
    let image: StickImage
    
    init(name: String, description: String, image: StickImage) {
        self.name = name
        self.description = description
        self.image = image
    }
}

let stickCollection: [StickItem] = [
    StickItem(name: "Titanium Driver", description: "A high-performance driver made from lightweight titanium for maximum distance.", image: StickImage(name: "stick1")),
    StickItem(name: "Graphite Fairway Wood", description: "A fairway wood with a graphite shaft designed for controlled long-distance shots.", image: StickImage(name: "stick2")),
    StickItem(name: "Classic Wooden Putter", description: "A handcrafted wooden putter offering a traditional feel on the greens.", image: StickImage(name: "stick3")),
    StickItem(name: "Stealth Hybrid Club", description: "A hybrid golf club designed for versatility and improved accuracy.", image: StickImage(name: "stick4")),
    StickItem(name: "Heavy-Duty Wedge", description: "A precision wedge built for high spin control in short-range shots.", image: StickImage(name: "stick5")),
    StickItem(name: "Carbon Fiber Irons", description: "Ultra-lightweight carbon fiber irons for improved swing speed.", image: StickImage(name: "stick6")),
    StickItem(name: "Adjustable Loft Driver", description: "A driver with customizable loft settings for tailored performance.", image: StickImage(name: "stick7")),
    StickItem(name: "Vintage Hickory Shaft Putter", description: "A nostalgic hickory-shafted putter for classic golf enthusiasts.", image: StickImage(name: "stick8")),
    StickItem(name: "Left-Handed Hybrid Club", description: "A high-quality hybrid club specifically designed for left-handed players.", image: StickImage(name: "stick9")),
    StickItem(name: "Glow-in-the-Dark Night Club", description: "A futuristic golf club that glows in the dark for night play.", image: StickImage(name: "stick10")),
    StickItem(name: "Professional Tour Driver", description: "A tournament-grade driver used by professionals worldwide.", image: StickImage(name: "stick11")),
    StickItem(name: "Luxury Gold-Plated Putter", description: "An elegant putter featuring gold-plated accents for premium collectors.", image: StickImage(name: "stick12")),
    StickItem(name: "Eco-Friendly Bamboo Iron", description: "A sustainable golf club made from bamboo and recycled materials.", image: StickImage(name: "stick13")),
    StickItem(name: "Dual-Head Training Club", description: "An innovative golf club with two heads for versatile training sessions.", image: StickImage(name: "stick14")),
    StickItem(name: "Rainproof Grip Wedge", description: "A wedge featuring a rainproof grip for all-weather play.", image: StickImage(name: "stick15")),
    StickItem(name: "Steampunk Brass Club", description: "A handcrafted steampunk-inspired golf club with brass fittings.", image: StickImage(name: "stick16")),
    StickItem(name: "Ultra-Light Junior Club", description: "A lightweight golf club designed for young aspiring golfers.", image: StickImage(name: "stick17")),
    StickItem(name: "Smart Sensor Putter", description: "A modern putter with built-in sensors to analyze stroke accuracy.", image: StickImage(name: "stick18")),
    StickItem(name: "Extreme Weather Driver", description: "A heavy-duty driver engineered to withstand extreme weather conditions.", image: StickImage(name: "stick19")),
    StickItem(name: "High-Tech Adjustable Iron", description: "A futuristic iron club with adjustable settings for precision control.", image: StickImage(name: "stick20"))
]
