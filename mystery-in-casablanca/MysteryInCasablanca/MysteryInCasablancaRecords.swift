import SwiftUI

struct BassRecordsView: View {
    var body: some View {
        ZStack {
            bgColor.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Records")
                        .font(BassFont.regular.font(with: 34))
                        .foregroundColor(textColor)
                    Spacer()
                }
                
                List {
                    ForEach(mysteryInCasablancaRecords, id: \.self) { mysteryInCasablancaRecord in
                        BassButtonStack(buttonText: mysteryInCasablancaRecord)
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
    BassRecordsView()
}
