import SwiftUI

struct MysteryInCasablancaProfileView: View {
    @FetchRequest(sortDescriptors: []) var mystery: FetchedResults<Mystery>
    @FetchRequest(sortDescriptors: []) var sticks: FetchedResults<Stick>
    @Environment(\.managedObjectContext) var viewContext
    @State var presentCreateMysteryInCasablanca = false
    @State var presentAboutUs = false
    @State var isSoundEnable = false
    var body: some View {
        ZStack {
            bgColor.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("My Mystery")
                        .font(MysteryInCasablancaFont.regular.font(with: 34))
                        .foregroundColor(textColor)
                }
                
                HStack {
                    VStack(alignment: .center, spacing: 16) {
                        Image(mystery.first?.level ?? "easy")
                            .resizable()
                            .frame(width: 130, height: 130)
                            .cornerRadius(10)
                        Text(mystery.first?.fullName ?? "Guest")
                            .font(MysteryInCasablancaFont.bold.font(with: 22))
                            .foregroundColor(actionColor)
                        HStack {
                            Text("Level:")
                                .font(MysteryInCasablancaFont.regular.font(with: 19))
                                .foregroundColor(.gray)
                            Text(mystery.first?.level ?? "easy")
                                .font(MysteryInCasablancaFont.regular.font(with: 19))
                                .foregroundColor(actionColor)
                        }
                    }
                }
                
                Button {
                    isSoundEnable.toggle()
                    setMysteryInCasablancaMusic()
                } label: {
                    HStack {
                        Image(isSoundEnable ? "soundOn" : "soundOff")
                            .resizable()
                            .frame(width: 35, height: 35)
                        Text("Music: \(isSoundEnable ? "on" : "off")")
                            .font(MysteryInCasablancaFont.regular.font(with: 19))
                            .foregroundColor(.gray)
                        Spacer()
                    }
                }
                .padding(.top, 30)
                
                VStack {
                    Button {
                        presentAboutUs = true
                    } label: {
                        MysteryInCasablancaButtonStack(buttonText: "About Us")
                    }
                    .padding(.top, 30)
                    
                    Button {
                        MysteryInCasablancaRateService().rateMysteryInCasablanca()
                    } label: {
                        MysteryInCasablancaButtonStack(buttonText: "Rate Us")
                    }
                    
                    Spacer()
                    Button {
                        deleteMysteryInCasablanca()
                    } label: {
                        MysteryInCasablancaButtonStack(buttonText: "Delete Mystery")
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, 70)
        }
        .onAppear() {
            isSoundEnable = mystery.first?.isSoundEnable ?? false
        }
        .fullScreenCover(isPresented: $presentCreateMysteryInCasablanca) {
            CreateMysteryInCasablancaView()
        }
        .fullScreenCover(isPresented: $presentAboutUs) {
            MysteryInCasablancaAboutView()
        }
    }
}

extension MysteryInCasablancaProfileView {
    func setMysteryInCasablancaMusic() {
        mystery.first?.isSoundEnable = isSoundEnable
        MysteryInCasablancaMusicService.shared.updatePlayer(setOn: isSoundEnable)
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func deleteMysteryInCasablanca() {
        isSoundEnable = false
        setMysteryInCasablancaMusic()
        if let mystery = mystery.first {
            viewContext.delete(mystery)
        }

        sticks.forEach { rod in
            viewContext.delete(rod)
        }
        do {
            try viewContext.save()
            presentCreateMysteryInCasablanca.toggle()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    MysteryInCasablancaProfileView()
}
