//
//  CameraView.swift
//  SwiftPlayground
//
//  Created by francis on 28/03/2025.
//

import Foundation
import UIKit
import SwiftUI



struct CameraView : UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    
    typealias UIViewControllerType = UIImagePickerController
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        
        let viewController = UIViewControllerType()
        
        
//        viewController.delegate = context.coordinator
        viewController.sourceType = .camera
        viewController.cameraDevice = .rear
        viewController.cameraOverlayView = .none
        
        
        return viewController
        
    }
    
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
//    func makeCoordinator() -> CameraView.Coordinator {
//        return Coordinator(self)
//    }
    
    
}


extension CameraView {
    
    
    
}
