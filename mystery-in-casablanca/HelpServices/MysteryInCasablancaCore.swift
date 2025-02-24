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
