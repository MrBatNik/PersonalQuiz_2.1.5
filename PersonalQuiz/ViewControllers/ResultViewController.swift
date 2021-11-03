//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Nikita Zharinov on 01/11/2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var textLabel: UILabel!
    
    // 1. Передать сюда массив с ответами
    var answers:[Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        
    }
    
}

extension ResultViewController {
    
    private func setupSubviews() {
        // 4. Избавиться от кнопки возврата назад на экране результатов
        navigationItem.setHidesBackButton(true, animated: true)
        
        // 3. Отобразить результаты в соотвствии с этим животным
        resultLabel.text = "Вы - \(mostPopularAnimal(from: answers).rawValue)"
        textLabel.text = mostPopularAnimal(from: answers).definition
    }
    
    
    private func mostPopularAnimal(from array: [Answer]) -> AnimalType {
        // 2. Определить наиболее часто встречающийся тип животного
        var count: [AnimalType : Int] = [:]
        var animalType: AnimalType
        
        answers.forEach { item in
            count[item.type] = (count[item.type] ?? 0) + 1
        }
        
        animalType = count.max(by: {$0.value < $1.value})?.key ?? AnimalType.dog
        
        return animalType
    }
}
