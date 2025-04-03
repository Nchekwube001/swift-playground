//
//  Charts.swift
//  SwiftPlayground
//
//  Created by francis on 03/04/2025.
//

import SwiftUI
import Charts
import SwiftData

//\(Viewmonth.mockData.reduce(0,$0 +$1.viewCount))
struct ChartsView : View {
     
    @Environment(\.modelContext) private var context
    @Query private var items:[SwiftDataItem]
    var body: some View {
        ZStack{
            VStack(alignment: .leading, spacing: 4){
                Text("Monthly Income")
                    .bold()
                    .padding(.top)
//                    .font(Font.custom("Inter-Regular", size: 40))
                    .font(Font.custom("SharpGrotesk-Medium20"  , size: 24))
                Text("Total: ")
                    .font(Font.custom("Inter-Medium"  , size: 16))
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                    .padding(.bottom,12)
                
                
                
                
                Text("Tap on the button to add an item ")
                    .font(Font.custom("Inter-Medium"  , size: 16))
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                    .padding(.bottom,12)
                Button{
                addItem()
                }label:{
                    
                    Text("Add an Item")
                        .font(Font.custom("Inter-Medium"  , size: 16))
                        .fontWeight(.semibold)
                        .foregroundStyle(.secondary)
                        .padding(.bottom,12)
                }
                
                
                List{
                    ForEach(items){
                        item in
                        HStack{
                            Text("\(item.name) \(item.id)")
                                .bold()
                                .padding(.top)
                                .font(Font.custom("SharpGrotesk-Medium20"  , size: 16))
                            Spacer()
                            Button{
                                updateItem(item)
                            }label: {
                                Image(systemName: "arrow.triangle.2.circlepath")
                            }
                          
                            
                        }
                    }
                    .onDelete{
                         indexes in
                        for index in indexes {
                            deleteItem(items[index])
                        }
                    }
                }
            }
        }
    }
    
    func addItem (){
        let item = SwiftDataItem(name: "Test Item")
        
        context.insert(item)
        
    }
    func deleteItem (_ item: SwiftDataItem){
        context.delete(item)
        
    }
    func updateItem (_ item: SwiftDataItem){
        item.name = "Updated \(item.name)"
       try? context.save()
        
    }
}


#Preview {
    ChartsView()
}
