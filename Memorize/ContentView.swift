//
//  ContentView.swift
//  Memorize
//
//  Created by Thaisa Fujii on 4/12/22.
// how things behaves
//View its a retangular area on the screen
//Arguments with labels
//content is a function
//bags of lego a lot -> criacao
//Zstack eh soh mais um view
//Podemos colocar alguns default por fora do return
//Logo iremos construir container dentro de container
//Nao podemos ter var semm valor
//@State usado para estados temporarios, quando nao tem o backend do app mas vc precisa testar algumas funcoes

import SwiftUI

struct ContentView: View {
    var emojis = ["🚑","🚎","🚛","🚕","🚜","🚗","🚙","🚌","🏎","🚓","🚐","🚒","🛻","🚚","🦼","🛴","🚲","🛵","🏍","🛺","🚍","🚂","✈️","🚆"]
   @State var emojiCount = 20
    
    var body: some View {
    VStack{
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
            ForEach(emojis[0..<emojiCount], id: \.self){ emoji in CardView(content: emoji)
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
        .foregroundColor(.orange)
        HStack{
              remove
              Spacer()
              add
            }
        .font(.largeTitle)
        .padding(.horizontal)
        }
        .padding(.horizontal)
}
    
      var remove: some View{
        Button{
            if emojiCount > 1 {
                emojiCount -= 1
    }
            } label: {
                    Image(systemName: "minus.circle")
                }
        }
      var add: some View {
          Button {
             if emojiCount < emojis.count{
                    emojiCount += 1
    }
                } label: {
                    Image(systemName: "plus.circle")
            }
        }
    
    struct CardView: View {
      var content: String
      @State var isFaceUp: Bool = true
        
        var body: some View {
         ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 12)
                Text(content).font(.largeTitle)
                 } else{
                     shape.fill()
                 }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
             }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
}
