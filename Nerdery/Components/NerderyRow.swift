//
//  NerderyRow.swift
//  Nerdery
//
//  Created by Ruben Torres on 10/1/22.
//

import SwiftUI

struct ChipLabel: View {
    let title: String
    var style: ChipLabelStyle = .outline
    
    var body: some View {
        Text(title)
            .font(.caption)
            .fontWeight(.medium)
            .padding(.horizontal, 8)
            .padding(.vertical, 3)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color(uiColor: UIColor.tertiarySystemBackground))
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke()
                            .foregroundColor(style == .outline ? Color("Outline") : Color(uiColor: UIColor.tertiarySystemBackground))
                    })
            )
    }
    
    enum ChipLabelStyle {
        case outline
        case clear
    }
}

struct NerderyRow<Content: View>: View {
    let title: String
    let description: String?
    let state: NerderyRowState
    var additionalContent: Content
    let isNavigation: Bool
    let showAdditionalContent: Bool
    
    init(title: String, description: String? = nil, state: NerderyRowState = .idle, showAdditionalContent: Bool = true, isNavigation: Bool = true, @ViewBuilder additionalContent: () -> Content ) {
        self.title = title
        self.description = description
        self.additionalContent = additionalContent()
        self.state = state
        self.isNavigation = isNavigation
        self.showAdditionalContent = showAdditionalContent
    }
    
    var addExtraPadding: Bool { description == nil && !showAdditionalContent }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .fontWeight(.bold)
                if let description = description {
                    Text(description)
                }
                if showAdditionalContent {
                    additionalContent
                }
            }
            .font(.subheadline)
            Spacer()
            if isNavigation {
                Image(systemName: "chevron.right")
                    .font(.title3)
                    .foregroundColor(state == .idle ? Color("Ellipse4") : Color(uiColor: .darkText))
            }
        }
        .foregroundColor(Color(uiColor: .darkText))
        .padding(.vertical, addExtraPadding ? 16 : 8)
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color(uiColor: state == .idle ? .tertiarySystemBackground : .secondarySystemBackground))
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke()
                        .foregroundColor(state == .idle ? Color("Outline") : Color(.secondarySystemBackground))
                })
        )
    }
    
    enum NerderyRowState {
        case idle
        case disabled
    }
}

struct NerderyRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            NerderyRow(title: "Title", description: "Description", additionalContent: { })
            NerderyRow(title: "Title", description: "Description", state: .disabled, additionalContent: { })
            
            ChipLabel(title: "Title", style: .outline)
            ChipLabel(title: "Title", style: .clear)
        }
        
    }
}
