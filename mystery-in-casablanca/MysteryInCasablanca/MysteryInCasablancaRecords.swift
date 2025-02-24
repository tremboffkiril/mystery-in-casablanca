import SwiftUI

struct MysteryInCasablancaRecordsView: View {
    var body: some View {
        ZStack {
            bgColor.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Records")
                        .font(MysteryInCasablancaFont.regular.font(with: 34))
                        .foregroundColor(textColor)
                }
                
                List {
                    ForEach(mysteryInCasablancaRecords, id: \.self) { mysteryInCasablancaRecord in
                        MysteryInCasablancaButtonStack(buttonText: mysteryInCasablancaRecord)
                            .listRowBackground(Color.clear)
                    }
                }
                .listStyle(.plain)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, 70)
        }
    }
}

#Preview {
    MysteryInCasablancaRecordsView()
}
