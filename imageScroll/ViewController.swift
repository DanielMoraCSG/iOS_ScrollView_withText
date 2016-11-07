//
//  ViewController.swift
//  imageScroll
//
//  Created by Daniel Isaac Mora Osorio on 07/11/16.
//  Copyright © 2016 SuperM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainScrollView: UIScrollView!
    var imageArray = [UIImage]()
    
    @IBOutlet var labelTextCaso: UILabel!
    var textArray: [Int : String] = [
                        0:"Diego Rivera, Swift also introduces optional types, which handle the absence of a value. Optionals say either “there is a value, and it equals x” or “there isn’t a value at all”. Using optionals is similar to using nil with pointers in Objective-C, but they work for any type, not just classes. Not only are optionals safer and more expressive than nil pointers in Objective-C, they are at the heart of many of Swift’s most powerful features.",
                        1:"Vicente Fernandez, Swift also introduces optional types, which handle the absence of a value. Optionals say either “there is a value, and it equals x” or “there isn’t a value at all”. Using optionals is similar to using nil with pointers in Objective-C, but they work for any type, not just classes. Not only are optionals safer and more expressive than nil pointers in Objective-C, they are at the heart of many of Swift’s most powerful features.",
                        2:"Gabriel, Swift also introduces optional types, which handle the absence of a value. Optionals say either “there is a value, and it equals x” or “there isn’t a value at all”. Using optionals is similar to using nil with pointers in Objective-C, but they work for any type, not just classes. Not only are optionals safer and more expressive than nil pointers in Objective-C, they are at the heart of many of Swift’s most powerful features."
                    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Instancia de view frame sobre ScrollView
        mainScrollView.frame = view.frame
        
        //MARK: Se indexan imagenes con Image Literal Swift v.3.0
        imageArray = [#imageLiteral(resourceName: "diegoRivera"),#imageLiteral(resourceName: "vicenteFernandez"),#imageLiteral(resourceName: "gabriel")]
        var index: Int = 2
        
        for i in 0..<imageArray.count{
            //MARK: Se declaran los contenedores
            let imageView = UIImageView()
            let viewContainer = UIView()
            let titleLabel = UITextView()
            
            //MARK: Se configura textArea
            titleLabel.isEditable = false
            titleLabel.isSelectable = false
            titleLabel.font = UIFont.systemFont(ofSize: 14)
            titleLabel.backgroundColor = UIColor.white.withAlphaComponent(0.0)
            
            //MARK: Se configura imagen UIImage
            imageView.image = imageArray[i]
            imageView.contentMode = .scaleAspectFit
            
            // Se posiciona el valor de x respecto a la imagen para sacar el scroll en serie
            let xPosition = self.view.frame.width * CGFloat(i)
            // Se posiciona la imagen sobre el contenedor indicando la posición relativa con respecto a ScrollView
            imageView.frame = CGRect(x: xPosition, y: 0, width: self.mainScrollView.frame.width, height: self.mainScrollView.frame.height)
            // Se posiciona el contenedor y se hace del tamaño de la suma de las imagenes para solo tener un contenedor
            viewContainer.frame = CGRect(x: 0 , y: (width: self.mainScrollView.frame.height - 100), width: (self.mainScrollView.frame.width * CGFloat(i + 1)), height: self.mainScrollView.frame.height)
            //MARK: Se cambia color contendor
            viewContainer.backgroundColor = UIColor.white.withAlphaComponent(0.75)
            
            //MARK: Se posiciona el texto en los contenedores
            titleLabel.frame = CGRect(x: (xPosition + 8), y: (width: self.mainScrollView.frame.height - 100), width: (self.mainScrollView.frame.width - 8), height: 100)
            titleLabel.textColor = UIColor.black
            titleLabel.text = textArray[i]
            
            //MARK: Se cambia el tamaño del ScrollView para agregar más imagenes
            mainScrollView.contentSize.width = mainScrollView.frame.width * CGFloat(i + 1)
        
            //MARK: Se posicionan las capas de contenedores
            mainScrollView.insertSubview(viewContainer,at: 2)
            mainScrollView.insertSubview(imageView,at : 1)
            //MARK: Se incrementa el orden de cascada
            //      Se ordena desde el orden 3 las capas del elemento para que LABEL pueda verse sobre el 
            //      contenedor color blanco
            index += 1
            mainScrollView.insertSubview(titleLabel, at: index)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

