//
//  DiceResultView.swift
//  Roll Dice
//
//  Created by artembolotov on 03.08.2023.
//

import SwiftUI

struct DiceResultView: View {
    var value: Int
    var body: some View {
        Text("\(value)")
            .font(.system(size: 22, weight: .bold))
            .frame(width: 50, height: 50)
            .overlay {
                RoundedRectangle(cornerRadius: 6)
                    .strokeBorder(.primary, lineWidth: 3)
            }
    }
}

struct DiceResultView_Previews: PreviewProvider {
    static var previews: some View {
        DiceResultView(value: 3)
    }
}
