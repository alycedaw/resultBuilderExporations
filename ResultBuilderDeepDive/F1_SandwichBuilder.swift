//
//  F1_sandwichBuilder.swift
//  ResultBuilderDeepDive
//
//  Created by Work on 7/19/22.
//

import Foundation

func f1_sandwichBuilder() {
    @resultBuilder
    enum SandwichBuilder {
        static func buildBlock(_ top: Bread, _ ingredients: [Ingredient],  _ bottom: Bread) -> Sandwich {
            Sandwich(
                top: top,
                topSpread: nil,
                ingredients: ingredients,
                bottomSpread: nil,
                bottom: bottom
            )
        }
        static func buildBlock(_ top: Bread, _ topSpread: Spread,_ ingredients: [Ingredient], _ bottom: Bread) -> Sandwich {
            Sandwich(
                top: top,
                topSpread: topSpread,
                ingredients: ingredients,
                bottomSpread: nil,
                bottom: bottom
            )
        }
        static func buildBlock(_ top: Bread, _ ingredients: [Ingredient], _ bottomSpread: Spread,  _ bottom: Bread) -> Sandwich {
            Sandwich(
                top: top,
                topSpread: nil,
                ingredients: ingredients,
                bottomSpread: bottomSpread,
                bottom: bottom
            )
        }
        static func buildBlock(_ top: Bread, _ topSpread: Spread, _ ingredients: [Ingredient], _ bottomSpread: Spread, _ bottom: Bread) -> Sandwich {
            Sandwich(
                top: top,
                topSpread: topSpread,
                ingredients: ingredients,
                bottomSpread: bottomSpread,
                bottom: bottom
            )
        }
    }

    func sandwich(toasted: Bool = false, @SandwichBuilder builder: () -> Sandwich) -> Sandwich {
        var sandwich = builder()
        sandwich.toasted = toasted
        return sandwich
    }

    func ingredients(@ArrayBuilder<Ingredient> builder: () -> [Ingredient]) -> [Ingredient] {
        builder()
    }

    let beefSandwich = sandwich(toasted: true) {
        WhiteBread()
        Mayo()
        ingredients {
            Beef()
        }
        WhiteBread()
    }
    print(beefSandwich)

    let vegitarian = true
    let clubSandwich = sandwich {
        FlatBread()
        Mayo()
        ingredients {
            Lettuce()
            if !vegitarian {
                Turkey()
                Ham()
            }
            for _ in 1...3 {
                Cheese()
            }
        }
        Mustard()
        FlatBread()
    }
    print(clubSandwich)
}
