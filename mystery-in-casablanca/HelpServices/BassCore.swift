import SwiftUI
import StoreKit

let bgColor = Color("mystery_bg_color")
let actionColor = Color("mystery_black_color")
let textColor = Color("mystery_text_color")
let goldColor = Color("mystery_gold_color")

extension View {
    func textFieldPlaceholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

enum BassFont: String {
    case light = "Oswald-Light"
    case regular = "Oswald-Regular"
    case medium = "Oswald-Medium"
    case bold = "Oswald-Bold"
    
    func font(with size: CGFloat) -> Font {
        return Font.custom(self.rawValue, size: size)
    }
}

import Foundation

class FishingAnswer {
    let text: String
    let isCorrect: Bool

    init(text: String, isCorrect: Bool) {
        self.text = text
        self.isCorrect = isCorrect
    }
}

class FishingQuestion {
    let question: String
    let answers: [FishingAnswer]

    init(question: String, answers: [FishingAnswer]) {
        self.question = question
        self.answers = answers
    }
}

class FishingRodImage {
    let prompt: String
    
    init(prompt: String) {
        self.prompt = prompt
    }
}

class FishingRod {
    let name: String
    let description: String
    let image: FishingRodImage
    
    init(name: String, description: String, image: FishingRodImage) {
        self.name = name
        self.description = description
        self.image = image
    }
}

struct BassTab: Hashable {
    var mysteryInCasablancaTabName: String
    var mysteryInCasablancaTabIcon: String
    var mysteryInCasablancaTabIconSelected: String
    var mysteryInCasablancaTabTag: String
}

enum BassMenu: String {
    case letsFish = "Let's fish"
    case yourMastery = "Your mastery"
    case fishermenStories = "Fishermen's stories"
    case rateUs = "Rate us"
}

let mysteryInCasablancaAbout = "Mystery in Casablanca is the ultimate quiz app for fishing enthusiasts, where you can test your knowledge, challenge yourself with varying difficulty levels, and build your unique collection of fishing rods. Dive into exciting quizzes about mysteryInCasablanca fishing techniques, species, gear, and more, as you unlock new rods and track your progress to become the ultimate angler. Whether you're a beginner or a pro, Mystery in Casablanca will keep you hooked and ready for your next big catch!"

let mysteryInCasablancaRecords: [String] = ["Beverly - 120", "Marcy - 117", "Oper - 100", "Bony - 98", "Nuni - 77", "Scotty - 68", "Poly - 59", "Joyi - 46"]

let mysteryInCasablancaMenuArray: [BassMenu] = [.letsFish, .yourMastery, .fishermenStories, .rateUs]

var mysteryInCasablancaTabs = [BassTab(mysteryInCasablancaTabName: "Menu", mysteryInCasablancaTabIcon: "mysteryInCasablancaTab1", mysteryInCasablancaTabIconSelected: "mysteryInCasablancaTab1_select", mysteryInCasablancaTabTag: "1"),
                BassTab(mysteryInCasablancaTabName: "Fishing Rods", mysteryInCasablancaTabIcon: "mysteryInCasablancaTab2", mysteryInCasablancaTabIconSelected: "mysteryInCasablancaTab2_select", mysteryInCasablancaTabTag: "2"),
                BassTab(mysteryInCasablancaTabName: "Records", mysteryInCasablancaTabIcon: "mysteryInCasablancaTab3", mysteryInCasablancaTabIconSelected: "mysteryInCasablancaTab3_select", mysteryInCasablancaTabTag: "3"),
                BassTab(mysteryInCasablancaTabName: "Bass Profile", mysteryInCasablancaTabIcon: "mysteryInCasablancaTab4", mysteryInCasablancaTabIconSelected: "mysteryInCasablancaTab4_select", mysteryInCasablancaTabTag: "4")]

struct BassRateService {
    func rateBass() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                SKStoreReviewController.requestReview(in: scene)
            }
        }
    }
}

let fishingQuizArray: [FishingQuestion] = [
    FishingQuestion(
            question: "What is the term for the type of fishing done with artificial flies?",
            answers: [
                FishingAnswer(text: "Spear Fishing", isCorrect: false),
                FishingAnswer(text: "Fly Fishing", isCorrect: true),
                FishingAnswer(text: "Trolling", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which of these is commonly used as live bait for fishing?",
            answers: [
                FishingAnswer(text: "Bread", isCorrect: false),
                FishingAnswer(text: "Worms", isCorrect: true),
                FishingAnswer(text: "Plastic", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What is the name of the device used to measure the depth of water while fishing?",
            answers: [
                FishingAnswer(text: "Barometer", isCorrect: false),
                FishingAnswer(text: "Fish Finder", isCorrect: true),
                FishingAnswer(text: "Ruler", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which freshwater fish is known for its whisker-like barbels?",
            answers: [
                FishingAnswer(text: "Catfish", isCorrect: true),
                FishingAnswer(text: "Trout", isCorrect: false),
                FishingAnswer(text: "Perch", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What is the term for cleaning and preparing a fish for cooking?",
            answers: [
                FishingAnswer(text: "Filleting", isCorrect: true),
                FishingAnswer(text: "Scaling", isCorrect: false),
                FishingAnswer(text: "Gutting", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What does 'casting' mean in fishing?",
            answers: [
                FishingAnswer(text: "Throwing the bait or lure into the water", isCorrect: true),
                FishingAnswer(text: "Pulling the fish out", isCorrect: false),
                FishingAnswer(text: "Checking the fishing reel", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What is the purpose of using a bobber?",
            answers: [
                FishingAnswer(text: "To attract fish with sound", isCorrect: false),
                FishingAnswer(text: "To indicate when a fish bites", isCorrect: true),
                FishingAnswer(text: "To measure water temperature", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What is the legal practice of releasing a fish back into the water after catching it called?",
            answers: [
                FishingAnswer(text: "Catch-and-Hold", isCorrect: false),
                FishingAnswer(text: "Catch-and-Release", isCorrect: true),
                FishingAnswer(text: "Free Fishing", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What is the term for a small boat used for fishing?",
            answers: [
                FishingAnswer(text: "Dinghy", isCorrect: false),
                FishingAnswer(text: "Skiff", isCorrect: true),
                FishingAnswer(text: "Yacht", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What is the term for fishing through a hole in the ice?",
            answers: [
                FishingAnswer(text: "Ice Fishing", isCorrect: true),
                FishingAnswer(text: "Shore Fishing", isCorrect: false),
                FishingAnswer(text: "Spear Fishing", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which fish is known for its sharp spines?",
            answers: [
                FishingAnswer(text: "Lionfish", isCorrect: true),
                FishingAnswer(text: "Trout", isCorrect: false),
                FishingAnswer(text: "Pike", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What type of water is home to the largemouth mysteryInCasablanca?",
            answers: [
                FishingAnswer(text: "Saltwater", isCorrect: false),
                FishingAnswer(text: "Freshwater", isCorrect: true),
                FishingAnswer(text: "Brackish Water", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What is the term for the maximum size a fish can legally be kept?",
            answers: [
                FishingAnswer(text: "Catch Limit", isCorrect: false),
                FishingAnswer(text: "Size Limit", isCorrect: true),
                FishingAnswer(text: "Weight Limit", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What is the best time of day to fish for many species?",
            answers: [
                FishingAnswer(text: "Noon", isCorrect: false),
                FishingAnswer(text: "Early Morning", isCorrect: true),
                FishingAnswer(text: "Late Night", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which fish is commonly used to make sushi?",
            answers: [
                FishingAnswer(text: "Tuna", isCorrect: true),
                FishingAnswer(text: "Bass", isCorrect: false),
                FishingAnswer(text: "Pike", isCorrect: false)
            ]
        ),
    FishingQuestion(
            question: "Which fish is commonly caught in freshwater fishing?",
            answers: [
                FishingAnswer(text: "Salmon", isCorrect: false),
                FishingAnswer(text: "Bass", isCorrect: true),
                FishingAnswer(text: "Tuna", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What type of fishing involves casting nets to catch fish?",
            answers: [
                FishingAnswer(text: "Fly Fishing", isCorrect: false),
                FishingAnswer(text: "Net Fishing", isCorrect: true),
                FishingAnswer(text: "Ice Fishing", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What is the term for fishing from a moving boat?",
            answers: [
                FishingAnswer(text: "Trolling", isCorrect: true),
                FishingAnswer(text: "Jigging", isCorrect: false),
                FishingAnswer(text: "Casting", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What is the primary purpose of a fishing reel?",
            answers: [
                FishingAnswer(text: "To attract fish", isCorrect: false),
                FishingAnswer(text: "To wind and store fishing line", isCorrect: true),
                FishingAnswer(text: "To cut fishing line", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which knot is most commonly used to tie a hook to a fishing line?",
            answers: [
                FishingAnswer(text: "Square Knot", isCorrect: false),
                FishingAnswer(text: "Palomar Knot", isCorrect: true),
                FishingAnswer(text: "Slip Knot", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which fishing method is done through a hole in the ice?",
            answers: [
                FishingAnswer(text: "Ice Fishing", isCorrect: true),
                FishingAnswer(text: "Shore Fishing", isCorrect: false),
                FishingAnswer(text: "Spear Fishing", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which tool is used to remove hooks from a fish?",
            answers: [
                FishingAnswer(text: "Scissors", isCorrect: false),
                FishingAnswer(text: "Pliers", isCorrect: true),
                FishingAnswer(text: "Knife", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What type of fishing uses a long, thin, and flexible pole without a reel?",
            answers: [
                FishingAnswer(text: "Fly Fishing", isCorrect: false),
                FishingAnswer(text: "Cane Pole Fishing", isCorrect: true),
                FishingAnswer(text: "Spear Fishing", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What is the term for a group of fish swimming together?",
            answers: [
                FishingAnswer(text: "Pod", isCorrect: false),
                FishingAnswer(text: "School", isCorrect: true),
                FishingAnswer(text: "Herd", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which fish is known for leaping out of the water when hooked?",
            answers: [
                FishingAnswer(text: "Tarpon", isCorrect: true),
                FishingAnswer(text: "Catfish", isCorrect: false),
                FishingAnswer(text: "Grouper", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What is the main ingredient in a fishing lure?",
            answers: [
                FishingAnswer(text: "Plastic", isCorrect: true),
                FishingAnswer(text: "Metal", isCorrect: false),
                FishingAnswer(text: "Wood", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What type of reel is best for beginners?",
            answers: [
                FishingAnswer(text: "Spincast Reel", isCorrect: true),
                FishingAnswer(text: "Baitcasting Reel", isCorrect: false),
                FishingAnswer(text: "Fly Reel", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which lure is designed to float on the surface?",
            answers: [
                FishingAnswer(text: "Jigs", isCorrect: false),
                FishingAnswer(text: "Spinnerbaits", isCorrect: false),
                FishingAnswer(text: "Poppers", isCorrect: true)
            ]
        ),
        FishingQuestion(
            question: "What is the term for a fisherman’s box of tools, lures, and supplies?",
            answers: [
                FishingAnswer(text: "Backpack", isCorrect: false),
                FishingAnswer(text: "Tackle Box", isCorrect: true),
                FishingAnswer(text: "Gear Chest", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which type of fishing involves dragging a net across the ocean floor?",
            answers: [
                FishingAnswer(text: "Trawling", isCorrect: true),
                FishingAnswer(text: "Casting", isCorrect: false),
                FishingAnswer(text: "Jigging", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What does 'chumming' mean in fishing?",
            answers: [
                FishingAnswer(text: "Sharing bait with others", isCorrect: false),
                FishingAnswer(text: "Throwing bait into the water to attract fish", isCorrect: true),
                FishingAnswer(text: "Cleaning fish", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which fish is the fastest swimmer in the ocean?",
            answers: [
                FishingAnswer(text: "Marlin", isCorrect: false),
                FishingAnswer(text: "Sailfish", isCorrect: true),
                FishingAnswer(text: "Tuna", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What type of water does a salmon live in during different stages of its life?",
            answers: [
                FishingAnswer(text: "Freshwater only", isCorrect: false),
                FishingAnswer(text: "Saltwater only", isCorrect: false),
                FishingAnswer(text: "Both freshwater and saltwater", isCorrect: true)
            ]
        ),
    FishingQuestion(
            question: "Which knot is known for its strength in tying two lines together?",
            answers: [
                FishingAnswer(text: "Double Fisherman’s Knot", isCorrect: true),
                FishingAnswer(text: "Bowline", isCorrect: false),
                FishingAnswer(text: "Square Knot", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What is the common name for a fish that lives in both fresh and saltwater?",
            answers: [
                FishingAnswer(text: "Migratory Fish", isCorrect: false),
                FishingAnswer(text: "Anadromous Fish", isCorrect: true),
                FishingAnswer(text: "Exotic Fish", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What does 'catch limit' mean in fishing?",
            answers: [
                FishingAnswer(text: "The number of fish you can keep", isCorrect: true),
                FishingAnswer(text: "The weight of fish you can catch", isCorrect: false),
                FishingAnswer(text: "The size of fish allowed to keep", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which freshwater fish is known for its sharp teeth and predatory behavior?",
            answers: [
                FishingAnswer(text: "Pike", isCorrect: true),
                FishingAnswer(text: "Carp", isCorrect: false),
                FishingAnswer(text: "Perch", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which fish is most commonly found in coral reefs?",
            answers: [
                FishingAnswer(text: "Clownfish", isCorrect: true),
                FishingAnswer(text: "Trout", isCorrect: false),
                FishingAnswer(text: "Carp", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What is the term for a fishing line that breaks under pressure?",
            answers: [
                FishingAnswer(text: "Line Break", isCorrect: false),
                FishingAnswer(text: "Line Snap", isCorrect: true),
                FishingAnswer(text: "Knot Slip", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which fishing technique involves dragging bait through the water while moving?",
            answers: [
                FishingAnswer(text: "Trolling", isCorrect: true),
                FishingAnswer(text: "Drifting", isCorrect: false),
                FishingAnswer(text: "Casting", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What is the term for the small baitfish often used in freshwater fishing?",
            answers: [
                FishingAnswer(text: "Minnow", isCorrect: true),
                FishingAnswer(text: "Mackerel", isCorrect: false),
                FishingAnswer(text: "Snapper", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which fishing competition is internationally famous?",
            answers: [
                FishingAnswer(text: "Bassmaster Classic", isCorrect: true),
                FishingAnswer(text: "World Fishing Championship", isCorrect: false),
                FishingAnswer(text: "Tackle Challenge", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which type of fishing is done using long fishing rods with multiple hooks?",
            answers: [
                FishingAnswer(text: "Longline Fishing", isCorrect: true),
                FishingAnswer(text: "Net Fishing", isCorrect: false),
                FishingAnswer(text: "Fly Fishing", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What is the primary purpose of a fish finder?",
            answers: [
                FishingAnswer(text: "To locate fish underwater", isCorrect: true),
                FishingAnswer(text: "To measure water depth", isCorrect: false),
                FishingAnswer(text: "To calculate water temperature", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which fish is known for its 'sail-like' dorsal fin?",
            answers: [
                FishingAnswer(text: "Sailfish", isCorrect: true),
                FishingAnswer(text: "Grouper", isCorrect: false),
                FishingAnswer(text: "Cod", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which fishing line is the most resistant to abrasion?",
            answers: [
                FishingAnswer(text: "Braided Line", isCorrect: true),
                FishingAnswer(text: "Fluorocarbon", isCorrect: false),
                FishingAnswer(text: "Monofilament", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What is the term for using bait to attract fish to a specific area?",
            answers: [
                FishingAnswer(text: "Chumming", isCorrect: true),
                FishingAnswer(text: "Casting", isCorrect: false),
                FishingAnswer(text: "Jigging", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What is the best knot for attaching a lure to your fishing line?",
            answers: [
                FishingAnswer(text: "Improved Clinch Knot", isCorrect: true),
                FishingAnswer(text: "Slip Knot", isCorrect: false),
                FishingAnswer(text: "Square Knot", isCorrect: false)
            ]
        ),
    FishingQuestion(
            question: "Which fish is commonly targeted in deep-sea fishing?",
            answers: [
                FishingAnswer(text: "Marlin", isCorrect: true),
                FishingAnswer(text: "Trout", isCorrect: false),
                FishingAnswer(text: "Bass", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What does 'barbless hook' mean in fishing?",
            answers: [
                FishingAnswer(text: "A hook without sharp edges", isCorrect: false),
                FishingAnswer(text: "A hook without a barb to make releasing fish easier", isCorrect: true),
                FishingAnswer(text: "A dull hook used for practice", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which fish species is known for its aggressive topwater strikes?",
            answers: [
                FishingAnswer(text: "Bass", isCorrect: true),
                FishingAnswer(text: "Catfish", isCorrect: false),
                FishingAnswer(text: "Salmon", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What is the purpose of a drag system on a fishing reel?",
            answers: [
                FishingAnswer(text: "To control the speed of the lure", isCorrect: false),
                FishingAnswer(text: "To provide resistance when a fish pulls the line", isCorrect: true),
                FishingAnswer(text: "To wind the line faster", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What type of lure is designed to mimic the movement of a small fish?",
            answers: [
                FishingAnswer(text: "Jerkbait", isCorrect: true),
                FishingAnswer(text: "Poppers", isCorrect: false),
                FishingAnswer(text: "Jigs", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which type of fish is known for its flat body and camouflage ability?",
            answers: [
                FishingAnswer(text: "Flounder", isCorrect: true),
                FishingAnswer(text: "Pike", isCorrect: false),
                FishingAnswer(text: "Trout", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What is a common indicator of fish presence in shallow waters?",
            answers: [
                FishingAnswer(text: "Jumping fish", isCorrect: false),
                FishingAnswer(text: "Rippling water", isCorrect: true),
                FishingAnswer(text: "Still water", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What type of fishing is commonly done using spears or harpoons?",
            answers: [
                FishingAnswer(text: "Spear Fishing", isCorrect: true),
                FishingAnswer(text: "Ice Fishing", isCorrect: false),
                FishingAnswer(text: "Net Fishing", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which of these fish is considered a bottom-dweller?",
            answers: [
                FishingAnswer(text: "Catfish", isCorrect: true),
                FishingAnswer(text: "Bass", isCorrect: false),
                FishingAnswer(text: "Tuna", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What is the purpose of a leader line in fishing?",
            answers: [
                FishingAnswer(text: "To reduce visibility and prevent line breakage", isCorrect: true),
                FishingAnswer(text: "To store extra line on the reel", isCorrect: false),
                FishingAnswer(text: "To attach multiple hooks", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which fish is known for its electric shock ability?",
            answers: [
                FishingAnswer(text: "Electric Eel", isCorrect: true),
                FishingAnswer(text: "Pufferfish", isCorrect: false),
                FishingAnswer(text: "Shark", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which fishing method uses artificial insects to attract fish?",
            answers: [
                FishingAnswer(text: "Fly Fishing", isCorrect: true),
                FishingAnswer(text: "Trolling", isCorrect: false),
                FishingAnswer(text: "Net Fishing", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What type of fishing is typically done from a kayak?",
            answers: [
                FishingAnswer(text: "Kayak Fishing", isCorrect: true),
                FishingAnswer(text: "Fly Fishing", isCorrect: false),
                FishingAnswer(text: "Trolling", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What is a common fish species caught in brackish water?",
            answers: [
                FishingAnswer(text: "Redfish", isCorrect: true),
                FishingAnswer(text: "Trout", isCorrect: false),
                FishingAnswer(text: "Bass", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which of these fish is known for its venomous spines?",
            answers: [
                FishingAnswer(text: "Lionfish", isCorrect: true),
                FishingAnswer(text: "Flounder", isCorrect: false),
                FishingAnswer(text: "Grouper", isCorrect: false)
            ]
        ),
    FishingQuestion(
            question: "What type of fishing involves a bow and arrow?",
            answers: [
                FishingAnswer(text: "Bowfishing", isCorrect: true),
                FishingAnswer(text: "Spear Fishing", isCorrect: false),
                FishingAnswer(text: "Net Fishing", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which freshwater fish is often called the 'king of the lake'?",
            answers: [
                FishingAnswer(text: "Lake Trout", isCorrect: true),
                FishingAnswer(text: "Catfish", isCorrect: false),
                FishingAnswer(text: "Bass", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What is the term for the weight added to a fishing line to sink the bait?",
            answers: [
                FishingAnswer(text: "Sinker", isCorrect: true),
                FishingAnswer(text: "Bobber", isCorrect: false),
                FishingAnswer(text: "Leader", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which fish is known for inflating its body when threatened?",
            answers: [
                FishingAnswer(text: "Pufferfish", isCorrect: true),
                FishingAnswer(text: "Catfish", isCorrect: false),
                FishingAnswer(text: "Tuna", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which tool is used to cut fishing lines?",
            answers: [
                FishingAnswer(text: "Fishing Line Cutter", isCorrect: true),
                FishingAnswer(text: "Pliers", isCorrect: false),
                FishingAnswer(text: "Knife", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What is a common predator fish in saltwater?",
            answers: [
                FishingAnswer(text: "Barracuda", isCorrect: true),
                FishingAnswer(text: "Bass", isCorrect: false),
                FishingAnswer(text: "Perch", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What is the term for fishing with bare hands?",
            answers: [
                FishingAnswer(text: "Noodling", isCorrect: true),
                FishingAnswer(text: "Spearfishing", isCorrect: false),
                FishingAnswer(text: "Casting", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which type of fish is often caught in icy waters?",
            answers: [
                FishingAnswer(text: "Walleye", isCorrect: true),
                FishingAnswer(text: "Carp", isCorrect: false),
                FishingAnswer(text: "Tuna", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What type of reel is preferred for deep-sea fishing?",
            answers: [
                FishingAnswer(text: "Conventional Reel", isCorrect: true),
                FishingAnswer(text: "Spincast Reel", isCorrect: false),
                FishingAnswer(text: "Fly Reel", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What is the purpose of a swivel in fishing?",
            answers: [
                FishingAnswer(text: "To prevent line twisting", isCorrect: true),
                FishingAnswer(text: "To attach multiple hooks", isCorrect: false),
                FishingAnswer(text: "To hold bait", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What is the term for an artificial fish attractor made of feathers or plastic?",
            answers: [
                FishingAnswer(text: "Lure", isCorrect: true),
                FishingAnswer(text: "Bobber", isCorrect: false),
                FishingAnswer(text: "Hook", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which fish is considered a trophy catch in many freshwater lakes?",
            answers: [
                FishingAnswer(text: "Muskellunge (Muskie)", isCorrect: true),
                FishingAnswer(text: "Carp", isCorrect: false),
                FishingAnswer(text: "Perch", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which of these fish is known for its sword-like bill?",
            answers: [
                FishingAnswer(text: "Swordfish", isCorrect: true),
                FishingAnswer(text: "Tuna", isCorrect: false),
                FishingAnswer(text: "Marlin", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What does 'drift fishing' mean?",
            answers: [
                FishingAnswer(text: "Fishing while floating with the current", isCorrect: true),
                FishingAnswer(text: "Casting and reeling quickly", isCorrect: false),
                FishingAnswer(text: "Fishing with stationary bait", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which bait is commonly used for ice fishing?",
            answers: [
                FishingAnswer(text: "Minnows", isCorrect: true),
                FishingAnswer(text: "Bread", isCorrect: false),
                FishingAnswer(text: "Plastic Worms", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which fish is known for its vibrant colors and is often found in tropical reefs?",
            answers: [
                FishingAnswer(text: "Parrotfish", isCorrect: true),
                FishingAnswer(text: "Catfish", isCorrect: false),
                FishingAnswer(text: "Bass", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What type of fishing requires heavy weights to sink the bait to the ocean floor?",
            answers: [
                FishingAnswer(text: "Bottom Fishing", isCorrect: true),
                FishingAnswer(text: "Trolling", isCorrect: false),
                FishingAnswer(text: "Casting", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What is the term for fishing lines attached to a floating device?",
            answers: [
                FishingAnswer(text: "Trotline", isCorrect: true),
                FishingAnswer(text: "Leader Line", isCorrect: false),
                FishingAnswer(text: "Sink Line", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "Which fish is known for its large mouth and popularity in sport fishing?",
            answers: [
                FishingAnswer(text: "Largemouth Bass", isCorrect: true),
                FishingAnswer(text: "Perch", isCorrect: false),
                FishingAnswer(text: "Trout", isCorrect: false)
            ]
        ),
        FishingQuestion(
            question: "What type of water body is best for catching catfish?",
            answers: [
                FishingAnswer(text: "Rivers", isCorrect: true),
                FishingAnswer(text: "Lakes", isCorrect: false),
                FishingAnswer(text: "Oceans", isCorrect: false)
            ]
        )
]

let fishingRods: [FishingRod] = [
    FishingRod(
        name: "Spinning Rod",
        description: "A versatile fishing rod suitable for beginners and experienced anglers. It’s designed to work with spinning reels and is great for casting lightweight lures.",
        image: FishingRodImage(prompt: "fishingRod1")
    ),
    FishingRod(
        name: "Casting Rod",
        description: "Designed for precision and power, this rod is used with baitcasting reels. It’s ideal for catching larger fish in freshwater and saltwater.",
        image: FishingRodImage(prompt: "fishingRod2")
    ),
    FishingRod(
        name: "Fly Fishing Rod",
        description: "A lightweight rod designed for fly fishing. It’s longer and more flexible, enabling the angler to cast artificial flies delicately onto the water's surface.",
        image: FishingRodImage(prompt: "fishingRod3")
    ),
    FishingRod(
        name: "Ice Fishing Rod",
        description: "A short and sturdy rod used for fishing through holes in ice. It’s designed to handle small to medium-sized fish in freezing conditions.",
        image: FishingRodImage(prompt: "fishingRod4")
    ),
    FishingRod(
        name: "Surf Rod",
        description: "A long and heavy-duty rod designed for casting bait or lures from the beach into the ocean. It provides excellent reach and power for surf fishing.",
        image: FishingRodImage(prompt: "fishingRod5")
    ),
    FishingRod(
        name: "Telescopic Rod",
        description: "A collapsible fishing rod that’s highly portable and perfect for travel. Ideal for casual fishing trips and easy to store.",
        image: FishingRodImage(prompt: "fishingRod6")
    ),
    FishingRod(
        name: "Trolling Rod",
        description: "Designed for trolling, where bait is dragged behind a moving boat. It’s sturdy and built to handle large saltwater fish.",
        image: FishingRodImage(prompt: "fishingRod7")
    ),
    FishingRod(
        name: "Ultra-Light Rod",
        description: "A short and lightweight rod designed for catching small fish. Perfect for delicate presentations and lightweight lures.",
        image: FishingRodImage(prompt: "fishingRod8")
    ),
    FishingRod(
        name: "Carp Rod",
        description: "Specifically designed for carp fishing, these rods are long and flexible, providing control and power when battling large carp.",
        image: FishingRodImage(prompt: "fishingRod9")
    ),
    FishingRod(
        name: "Travel Rod",
        description: "A compact rod designed for easy transportation. It usually comes in multiple pieces or a foldable design, ideal for travelers.",
        image: FishingRodImage(prompt: "fishingRod10")
    ),
    FishingRod(
        name: "Baitcasting Rod",
        description: "Built for experienced anglers, this rod is used with baitcasting reels for precise and powerful casts.",
        image: FishingRodImage(prompt: "fishingRod11")
    ),
    FishingRod(
        name: "Jigging Rod",
        description: "A sturdy and sensitive rod used for jigging, a technique where lures are moved vertically to attract fish.",
        image: FishingRodImage(prompt: "fishingRod12")
    ),
    FishingRod(
        name: "Offshore Rod",
        description: "Heavy-duty rods designed for catching large fish in open waters. Used with trolling or spinning reels.",
        image: FishingRodImage(prompt: "fishingRod13")
    ),
    FishingRod(
        name: "Spincast Rod",
        description: "A beginner-friendly rod paired with a spincast reel. It’s easy to use and ideal for light to medium fishing.",
        image: FishingRodImage(prompt: "fishingRod14")
    ),
    FishingRod(
        name: "Bamboo Rod",
        description: "A traditional fishing rod made from bamboo. It’s simple, flexible, and commonly used for cane pole fishing.",
        image: FishingRodImage(prompt: "fishingRod15")
    )
]
