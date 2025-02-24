import SwiftUI

struct StickView: View {
    @FetchRequest(sortDescriptors: []) var mystery: FetchedResults<Mystery>
    @FetchRequest(sortDescriptors: []) var sticks: FetchedResults<Stick>
    @Environment(\.managedObjectContext) var viewContext
    @State var presentStickDetails = false
    @State var presentNotEnoughMoney = false
    @State var selectedStick = 0
    
    var body: some View {
        ZStack {
            bgColor.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Golf Sticks")
                        .font(MysteryInCasablancaFont.regular.font(with: 34))
                        .foregroundColor(textColor)
                }
                HStack {
                    Text("\(mystery.first?.hooks ?? .zero)")
                        .font(MysteryInCasablancaFont.medium.font(with: 20))
                        .foregroundColor(actionColor)
                    Image("stickShop")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .cornerRadius(10)
                }
                ScrollView(.vertical) {
                    LazyVGrid(columns: [.init(.flexible(maximum: UIScreen.main.bounds.width / 2)),
                                        .init(.flexible(maximum: UIScreen.main.bounds.width / 2))], spacing: 5) {
                        ForEach(Array(sticks.enumerated()), id: \.offset) { index, stick in
                            StickItemView(stick: stick, index: index, action: { rod in
                                buyStickItem(index: index)
                            })
                        }
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, 70)
        }
        .fullScreenCover(isPresented: $presentStickDetails) {
            StickDetailsView(stick: sticks[selectedStick])
        }
        
        .alert("Not enough money to collect", isPresented: $presentNotEnoughMoney) {
            Button("OK", role: .cancel) { }
        }
    }
    
    func buyStickItem(index: Int) {
        if !sticks[index].isStickBuyed, mystery.first?.hooks ?? .zero >= 20 {
            mystery.first?.hooks -= 20
            sticks[index].isStickBuyed = true
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        } else if sticks[index].isStickBuyed {
            selectedStick = index
            presentStickDetails = true
        } else {
            presentNotEnoughMoney = true
        }
    }
}

struct StickItemView: View {
    @State var stick: Stick
    @State var index: Int
    @State var action: ((Int) -> Void)
    var body: some View {
        Button {
            action(index)
        } label: {
            VStack {
                ZStack {
                    Image(stick.stickImage ?? "")
                        .resizable()
                        .frame(height: UIScreen.main.bounds.width / 2)
                        .cornerRadius(10)
                    if !stick.isStickBuyed {
                        Rectangle()
                            .frame(height: UIScreen.main.bounds.width / 2)
                            .cornerRadius(10)
                            .foregroundColor(.black.opacity(0.9))
                        HStack {
                            Text("20")
                                .font(MysteryInCasablancaFont.medium.font(with: 20))
                                .foregroundColor(actionColor)
                            Image("stickShop")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .cornerRadius(10)
                        }
                    }
                }
                Text(stick.stickName ?? "")
                    .font(MysteryInCasablancaFont.medium.font(with: 18))
                    .foregroundColor(actionColor)
            }
        }
    }
}

#Preview {
    StickView()
}
