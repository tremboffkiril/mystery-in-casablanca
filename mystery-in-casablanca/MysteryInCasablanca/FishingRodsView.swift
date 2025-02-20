import SwiftUI

struct FishingRodsView: View {
    @FetchRequest(sortDescriptors: []) var fishermen: FetchedResults<Fisherman>
    @FetchRequest(sortDescriptors: []) var fishingRods: FetchedResults<FishingRods>
    @Environment(\.managedObjectContext) var viewContext
    @State var presentFishingRodDetails = false
    @State var presentNotEnoughMoney = false
    @State var selectedFishingRod = 0
    
    var body: some View {
        ZStack {
            bgColor.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Fishing Rods")
                        .font(BassFont.regular.font(with: 34))
                        .foregroundColor(textColor)
                    Spacer()
                }
                HStack {
                    Text("\(fishermen.first?.hooks ?? .zero)")
                        .font(BassFont.medium.font(with: 20))
                        .foregroundColor(actionColor)
                    Image("fishingShop")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .cornerRadius(10)
                }
                ScrollView(.vertical) {
                    LazyVGrid(columns: [.init(.flexible(maximum: UIScreen.main.bounds.width / 2)),
                                        .init(.flexible(maximum: UIScreen.main.bounds.width / 2))], spacing: 5) {
                        ForEach(Array(fishingRods.enumerated()), id: \.offset) { index, fishingRod in
                            FishingRodsItemView(fishingRod: fishingRod, index: index, action: { rod in
                                buyFishingRod(index: index)
                            })
                        }
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, 70)
        }
        .fullScreenCover(isPresented: $presentFishingRodDetails) {
            FishingRodsDetailsView(fishingRod: fishingRods[selectedFishingRod])
        }
        
        .alert("Not enough money to collect", isPresented: $presentNotEnoughMoney) {
            Button("OK", role: .cancel) { }
        }
    }
    
    func buyFishingRod(index: Int) {
        if !fishingRods[index].isFishingRodBuyed, fishermen.first?.hooks ?? .zero >= 20 {
            fishermen.first?.hooks -= 20
            fishingRods[index].isFishingRodBuyed = true
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        } else if fishingRods[index].isFishingRodBuyed {
            selectedFishingRod = index
            presentFishingRodDetails = true
        } else {
            presentNotEnoughMoney = true
        }
    }
}

struct FishingRodsItemView: View {
    @State var fishingRod: FishingRods
    @State var index: Int
    @State var action: ((Int) -> Void)
    var body: some View {
        Button {
            action(index)
        } label: {
            VStack {
                ZStack {
                    Image(fishingRod.fishingRodImage ?? "")
                        .resizable()
                        .frame(height: UIScreen.main.bounds.width / 2)
                        .cornerRadius(10)
                    if !fishingRod.isFishingRodBuyed {
                        Rectangle()
                            .frame(height: UIScreen.main.bounds.width / 2)
                            .cornerRadius(10)
                            .foregroundColor(.black.opacity(0.9))
                        HStack {
                            Text("20")
                                .font(BassFont.medium.font(with: 20))
                                .foregroundColor(actionColor)
                            Image("fishingShop")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .cornerRadius(10)
                        }
                    }
                }
                Text(fishingRod.fishingRodName ?? "")
                    .font(BassFont.medium.font(with: 18))
                    .foregroundColor(actionColor)
            }
        }
    }
}

#Preview {
    FishingRodsView()
}
