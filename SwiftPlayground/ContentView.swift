//
//  ContentView.swift
//  SwiftPlayground
//
//  Created by francis on 23/03/2025.
//

import SwiftUI

struct ContentView: View {
    @State var text = ""
    @State var isEdit = false
    var textField: some View {
        VStack {
            TextField("Enter Username",text:$text,onEditingChanged: {
                isEditing in
                isEdit = isEditing
                print(isEditing)
            })
            .textFieldStyle(.roundedBorder)
                .padding()
                
            Button{
                print(text)
                UIApplication.shared.onEndEditing()
            }label: {
                Text("Done")
            }.padding().foregroundColor(Color.white).background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            
            Rectangle()
                .foregroundColor(Color.clear)
                .background(
                    LinearGradient(colors: [.red,.green], startPoint: .leading, endPoint: .trailing)
                )
                .frame(width:200,height:250)
        }
        .padding()
    }
    
    
    var body: some View{
        
        ResizableHeader {
            HStack(spacing:12){
                Button {
                    
                }label: {
                    Image(systemName: "chevron.left")
                        .font(.title3 )
                }
                
                Spacer(minLength: 0)
                Button {
                    
                }label: {
                    Image(systemName: "magnifyingglass")
                        .font(.title3 )
                }
                Button {
                    
                }label: {
                    Image(systemName: "bubble")
                        .font(.title3 )
                }
            }
            .overlay(content: {
                Text("Apple Store")
                    .fontWeight(.semibold)
            })
            .foregroundStyle(Color.primary)
            .padding(.horizontal,15)
            .padding(.top,15)
        } stickyHeader: {
            HStack{
                Text("Total \(25)")
                Spacer(minLength: 0)
                Button {
                    
                }label: {
                    Image(systemName: "slider.vertical.3")
                        .font(.title3 )
                }
            }
            .foregroundStyle(Color.primary)
            .padding(15)
            .padding(.vertical,10 )
        } background: {
            Rectangle()
                .fill(.ultraThinMaterial)
                .overlay(alignment: .bottom) {
                    Divider()
                }
            
        } content: {
            VStack(spacing: 15) {
                ForEach(1...100,id: \.self) { _ in
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.gray.opacity(0.35))
                        .frame(height:50)
                }
            }.padding(15)
        }
    }
}


extension UIApplication {
    func onEndEditing(){
        
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    ContentView()
}
