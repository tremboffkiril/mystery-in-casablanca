import SwiftUI

struct BassProfileView: View {
    @FetchRequest(sortDescriptors: []) var fishermen: FetchedResults<Fisherman>
    @FetchRequest(sortDescriptors: []) var fishingRods: FetchedResults<FishingRods>
    @Environment(\.managedObjectContext) var viewContext
    @State var presentCreateBass = false
    @State var presentAboutUs = false
    @State var isSoundEnable = false
    var body: some View {
        ZStack {
            bgColor.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Bass Profile")
                        .font(BassFont.regular.font(with: 34))
                        .foregroundColor(textColor)
                    Spacer()
                }
                
                HStack {
                    Image(fishermen.first?.mastery ?? "easy")
                        .resizable()
                        .frame(width: 130, height: 130)
                        .cornerRadius(10)
                    VStack(alignment: .leading, spacing: 16) {
                        Text(fishermen.first?.fullName ?? "Guest")
                            .font(BassFont.bold.font(with: 22))
                            .foregroundColor(actionColor)
                        HStack {
                            Text("Mastery:")
                                .font(BassFont.regular.font(with: 19))
                                .foregroundColor(.gray)
                            Text(fishermen.first?.mastery ?? "easy")
                                .font(BassFont.regular.font(with: 19))
                                .foregroundColor(actionColor)
                        }
                    }
                    .frame(height: 100)
                    Spacer()
                }
                
                Button {
                    isSoundEnable.toggle()
                    setBassMusic()
                } label: {
                    HStack {
                        Image(isSoundEnable ? "soundOn" : "soundOff")
                            .resizable()
                            .frame(width: 35, height: 35)
                        Text("Music: \(isSoundEnable ? "on" : "off")")
                            .font(BassFont.regular.font(with: 19))
                            .foregroundColor(.gray)
                        Spacer()
                    }
                }
                .padding(.top, 30)

                Button {
                    BassRateService().rateBass()
                } label: {
                    BassButtonStack(buttonText: "Rate Us")
                }
                .padding(.top, 30)
                
                Button {
                    presentAboutUs = true
                } label: {
                    BassButtonStack(buttonText: "About Us")
                }
    
                Button {
                    deleteBass()
                } label: {
                    BassButtonStack(buttonText: "Delete Bass")
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, 70)
        }
        .onAppear() {
            isSoundEnable = fishermen.first?.isSoundEnable ?? false
        }
        .fullScreenCover(isPresented: $presentCreateBass) {
            CreateBassView()
        }
        .fullScreenCover(isPresented: $presentAboutUs) {
            BassAboutView()
        }
    }
}

extension BassProfileView {
    func setBassMusic() {
        fishermen.first?.isSoundEnable = isSoundEnable
        BassMusicService.shared.updatePlayer(setOn: isSoundEnable)
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func deleteBass() {
        isSoundEnable = false
        setBassMusic()
        if let fisherman = fishermen.first {
            viewContext.delete(fisherman)
        }

        fishingRods.forEach { rod in
            viewContext.delete(rod)
        }
        do {
            try viewContext.save()
            presentCreateBass.toggle()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    BassProfileView()
}
