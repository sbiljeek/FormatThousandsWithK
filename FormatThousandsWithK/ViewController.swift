//
//  ViewController.swift
//  FormatThousandsWithK
//
//  Created by Salman Biljeek on 11/17/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemOrange
        
        let k: Int = 1_200
        let m: Int = 4_700_000
        let b: Int = 9_500_000_000
        
        let label1: UILabel = {
            let label = UILabel()
            let formattedNumber = NumberFormatters.decimalNumberFormatter.string(from: NSNumber(value: k)) ?? ""
            label.text = formattedNumber
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 30)
            return label
        }()
        let label2: UILabel = {
            let label = UILabel()
            let formattedNumber = NumberFormatters.decimalNumberFormatter.string(from: NSNumber(value: m)) ?? ""
            label.text = formattedNumber
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 30)
            return label
        }()
        let label3: UILabel = {
            let label = UILabel()
            let formattedNumber = NumberFormatters.decimalNumberFormatter.string(from: NSNumber(value: b)) ?? ""
            label.text = formattedNumber
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 30)
            return label
        }()
        
        let arrowImageView1: UIImageView = {
            let imageView = UIImageView()
            let image = UIImage(systemName: "arrow.forward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .medium))?.withTintColor(.secondaryLabel).withRenderingMode(.alwaysOriginal)
            imageView.image = image
            return imageView
        }()
        let arrowImageView2: UIImageView = {
            let imageView = UIImageView()
            let image = UIImage(systemName: "arrow.forward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .medium))?.withTintColor(.secondaryLabel).withRenderingMode(.alwaysOriginal)
            imageView.image = image
            return imageView
        }()
        let arrowImageView3: UIImageView = {
            let imageView = UIImageView()
            let image = UIImage(systemName: "arrow.forward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .medium))?.withTintColor(.secondaryLabel).withRenderingMode(.alwaysOriginal)
            imageView.image = image
            return imageView
        }()
        
        let formattedNumber1 = self.truncateNumber(number: k)
        let formattedNumber2 = self.truncateNumber(number: m)
        let formattedNumber3 = self.truncateNumber(number: b)
        
        let truncatedLabel1: UILabel = {
            let label = UILabel()
            label.text = formattedNumber1
            label.font = .systemFont(ofSize: 30, weight: .heavy)
            return label
        }()
        let truncatedLabel2: UILabel = {
            let label = UILabel()
            label.text = formattedNumber2
            label.font = .systemFont(ofSize: 30, weight: .heavy)
            return label
        }()
        let truncatedLabel3: UILabel = {
            let label = UILabel()
            label.text = formattedNumber3
            label.font = .systemFont(ofSize: 30, weight: .heavy)
            return label
        }()
        
        let vStack1 = UIStackView(arrangedSubviews: [
            label1,
            label2,
            label3
        ])
        vStack1.axis = .vertical
        vStack1.distribution = .equalSpacing
        vStack1.alignment = .trailing
        vStack1.translatesAutoresizingMaskIntoConstraints = false
        
        let vStack2 = UIStackView(arrangedSubviews: [
            arrowImageView1,
            arrowImageView2,
            arrowImageView3
        ])
        vStack2.axis = .vertical
        vStack2.distribution = .equalSpacing
        vStack2.translatesAutoresizingMaskIntoConstraints = false
        
        let vStack3 = UIStackView(arrangedSubviews: [
            truncatedLabel1,
            truncatedLabel2,
            truncatedLabel3
        ])
        vStack3.axis = .vertical
        vStack3.spacing = 10
        vStack3.distribution = .equalSpacing
        vStack3.translatesAutoresizingMaskIntoConstraints = false
        
        let mainStack = UIStackView(arrangedSubviews: [
            vStack1,
            vStack2,
            vStack3
        ])
        mainStack.axis = .horizontal
        mainStack.alignment = .center
        mainStack.distribution = .equalSpacing
        
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainStack)
        mainStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        mainStack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        vStack1.heightAnchor.constraint(equalTo: vStack3.heightAnchor).isActive = true
        vStack2.heightAnchor.constraint(equalTo: vStack3.heightAnchor).isActive = true
    }
    
    func truncateNumber(number: Int) -> String {
        let num = abs(Double(number))
        let sign = (number < 0) ? "-" : ""
        
        switch num {
        case 100_000_000_000...:
            var formattedDouble = num / 1_000_000_000
            formattedDouble = formattedDouble.reduceScale(to: 1)
            let formatted = Int(formattedDouble)
            return "\(sign)\(formatted)B"
        case 1_000_000_000...:
            var formattedDouble = num / 1_000_000_000
            formattedDouble = formattedDouble.reduceScale(to: 1)
            let noDecimal = (floor(formattedDouble) == formattedDouble)
            if noDecimal {
                let formatted = Int(formattedDouble)
                return "\(sign)\(formatted)B"
            } else {
                return "\(sign)\(formattedDouble)B"
            }
        case 100_000_000...:
            var formattedDouble = num / 1_000_000
            formattedDouble = formattedDouble.reduceScale(to: 1)
            let formatted = Int(formattedDouble)
            return "\(sign)\(formatted)M"
        case 1_000_000...:
            var formattedDouble = num / 1_000_000
            formattedDouble = formattedDouble.reduceScale(to: 1)
            let noDecimal = (floor(formattedDouble) == formattedDouble)
            if noDecimal {
                let formatted = Int(formattedDouble)
                return "\(sign)\(formatted)M"
            } else {
                return "\(sign)\(formattedDouble)M"
            }
        case 100_000...:
            var formattedDouble = num / 1_000
            formattedDouble = formattedDouble.reduceScale(to: 1)
            let formatted = Int(formattedDouble)
            return "\(sign)\(formatted)K"
        case 1_000...:
            var formattedDouble = num / 1_000
            formattedDouble = formattedDouble.reduceScale(to: 1)
            let noDecimal = (floor(formattedDouble) == formattedDouble)
            if noDecimal {
                let formatted = Int(formattedDouble)
                return "\(sign)\(formatted)K"
            } else {
                return "\(sign)\(formattedDouble)K"
            }
        case 0...:
            let formattedNumber = NumberFormatters.decimalNumberFormatter.string(from: NSNumber(value: number)) ?? ""
            return "\(formattedNumber)"
        default:
            let formattedNumber = NumberFormatters.decimalNumberFormatter.string(from: NSNumber(value: number)) ?? ""
            return "\(sign)\(formattedNumber)"
        }
    }
}

struct NumberFormatters {
    static let decimalNumberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter
    }()
}

extension Double {
    func reduceScale(to places: Int) -> Double {
        let multiplier = pow(10, Double(places))
        let newDecimal = multiplier * self // move the decimal right
        let truncated = Double(Int(newDecimal)) // drop the fraction
        let originalDecimal = truncated / multiplier // move the decimal back
        return originalDecimal
    }
}
