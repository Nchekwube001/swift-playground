//
//  CameraTextExtractor.swift
//  SwiftPlayground
//
//  Created by francis on 28/03/2025.
//

import SwiftUI
import Vision

struct CameraTextExtractor:View {
    @State private var imageTaken : UIImage?
    @State private var recognizedTexts = [String]()
    @State private var isLoading =  false
    
    func recognizeCardText () {
        
        print("Reading Text...")
        
        let requesthandler = VNImageRequestHandler(cgImage: self.imageTaken!.cgImage!)
        
        let recognisedTextRequest = VNRecognizeTextRequest {(request,error) in
            // 1. Parse The results
            
            guard let observations = request.results as? [VNRecognizedTextObservation] else {return}
            
            // 2. Extract the data you want
            
            for observation in observations {
                let recognisedText = observation.topCandidates(1).first!.string
                self.recognizedTexts.append(recognisedText)
                
            }
            
         }
        
        
        DispatchQueue.global(qos: .userInitiated).async{
            
            do {
                
                try requesthandler.perform([recognisedTextRequest])
                
                self.isLoading = false
                
            }
            catch{
                
                print(error)
            }
            
        }
        
    }
    
    var pictureTakenView: some View {
        VStack{
            Image(uiImage: self.imageTaken!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200,height: 200)
            
            
            Button(action:{
                self.imageTaken = nil
                self.recognizedTexts = [String]()
            },label: {
                HStack{
                    Image(systemName: "camera")
                    Text("Retake Image")
                }
            })
            
            
            List{
                ForEach(self.recognizedTexts,id:\.self){
                    Text("\($0)")
                }
            }
        }
    }
    
    var body: some View {
        VStack{
//            if(self.imageTaken == nil){
//                CameraView(image: self.$imageTaken)
//            }else{
//                if(!self.isLoading){
//                    self.pictureTakenView()
//                        .onAppear{
//                            self.recognizedTexts()
//                        }
//                }else{
//                    ProgressView()
//                }
//            }
        }
    }
}
