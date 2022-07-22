//
//  F0_SandwichBuilder.swift
//  ResultBuilderDeepDive
//
//  Created by Work on 7/19/22.
//

import Foundation

/// I started this example with the idea of enforcing the rules that every sandwich has ingredients between two slices of bread with optional condiments on each slice.
///
/// resultBuilder didn't work very well for this sort of thing 😅

struct Sandwich {
    var toasted: Bool = false
    let top: Bread
    let topSpread: Spread?
    let ingredients: [Ingredient]
    let bottomSpread: Spread?
    let bottom: Bread
}

protocol Bread { }
struct WheatBread: Bread { }
struct WhiteBread: Bread { }
struct FlatBread: Bread { }

protocol Spread { }
struct Mayo: Spread { }
struct Mustard: Spread { }

protocol Ingredient { }
struct Lettuce: Ingredient { }
struct Onions: Ingredient { }
struct Pickles: Ingredient { }
struct Tomatoes: Ingredient { }
struct Beef: Ingredient { }
struct Ham: Ingredient { }
struct Turkey: Ingredient { }
struct Cheese: Ingredient { }

struct Air: Ingredient { }

func f0_sandwichBuilder() {

    @resultBuilder
    enum SandwichBuilder {

        // You can't have unnamed parameters after a variadic parameter
        // buildBlock doesn't work with named parameters
    //    static func buildBlock(_ top: Bread, _ ingredients: Ingredient...,  _ bottom: Bread) -> Sandwich {
    //        Sandwich(
    //            top: top,
    //            topSpread: nil,
    //            ingredients: Array(ingredients),
    //            bottomSpread: nil,
    //            bottom: bottom
    //        )
    //    }

        // The result builder ignores default parameters
    //    static func buildBlock(_ top: Bread, _ topSpread: Spread? = nil, _ i0: Ingredient, _ bottomSpread: Spread? = nil,  _ bottom: Bread) -> Sandwich {
    //        Sandwich(
    //            top: top,
    //            topSpread: topSpread,
    //            ingredients: [i0],
    //            bottomSpread: bottomSpread,
    //            bottom: bottom
    //        )
    //    }

        // The result is that the number of functions I have to declare four functions to support optional spreads on each slice
        // And I have multiply that for the number ingredients that I want to support
        static func buildBlock(_ top: Bread, _ i0: Ingredient,  _ bottom: Bread) -> Sandwich {
            Sandwich(
                top: top,
                topSpread: nil,
                ingredients: [i0],
                bottomSpread: nil,
                bottom: bottom
            )
        }
        static func buildBlock(_ top: Bread, _ topSpread: Spread, _ i0: Ingredient,  _ bottom: Bread) -> Sandwich {
            Sandwich(
                top: top,
                topSpread: topSpread,
                ingredients: [i0],
                bottomSpread: nil,
                bottom: bottom
            )
        }
        static func buildBlock(_ top: Bread, _ i0: Ingredient, _ bottomSpread: Spread,  _ bottom: Bread) -> Sandwich {
            Sandwich(
                top: top,
                topSpread: nil,
                ingredients: [i0],
                bottomSpread: bottomSpread,
                bottom: bottom
            )
        }
        static func buildBlock(_ top: Bread, _ topSpread: Spread, _ i0: Ingredient, _ bottomSpread: Spread, _ bottom: Bread) -> Sandwich {
            Sandwich(
                top: top,
                topSpread: topSpread,
                ingredients: [i0],
                bottomSpread: bottomSpread,
                bottom: bottom
            )
        }


        static func buildBlock(_ top: Bread, _ i0: Ingredient, _ i1: Ingredient,  _ bottom: Bread) -> Sandwich {
            Sandwich(
                top: top,
                topSpread: nil,
                ingredients: [i0, i1],
                bottomSpread: nil,
                bottom: bottom
            )
        }
        static func buildBlock(_ top: Bread, _ topSpread: Spread, _ i0: Ingredient, _ i1: Ingredient, _ bottom: Bread) -> Sandwich {
            Sandwich(
                top: top,
                topSpread: topSpread,
                ingredients: [i0, i1],
                bottomSpread: nil,
                bottom: bottom
            )
        }
        static func buildBlock(_ top: Bread, _ i0: Ingredient, _ i1: Ingredient, _ bottomSpread: Spread,  _ bottom: Bread) -> Sandwich {
            Sandwich(
                top: top,
                topSpread: nil,
                ingredients: [i0, i1],
                bottomSpread: bottomSpread,
                bottom: bottom
            )
        }
        static func buildBlock(_ top: Bread, _ topSpread: Spread, _ i0: Ingredient, _ i1: Ingredient, _ bottomSpread: Spread, _ bottom: Bread) -> Sandwich {
            Sandwich(
                top: top,
                topSpread: topSpread,
                ingredients: [i0, i1],
                bottomSpread: bottomSpread,
                bottom: bottom
            )
        }

        static func buildBlock(_ ingredient: Ingredient) -> Ingredient {
            ingredient
        }

        static func buildOptional(_ component: Ingredient?) -> Ingredient {
            component ?? Air()
        }

    }

    func sandwich(toasted: Bool = false, @SandwichBuilder builder: () -> Sandwich) -> Sandwich {
        var sandwich = builder()
        sandwich.toasted = toasted
        return sandwich
    }

    let beefSandwich = sandwich(toasted: true) {
        WhiteBread()
        Mayo()
        Beef()
        WhiteBread()
    }
    print(beefSandwich)

    let vegitarian = true
    let clubSandwich = sandwich {
        WhiteBread()
        Mayo()
        Lettuce()
        if !vegitarian {
            Turkey()
        }
        Mustard()
        WhiteBread()
    }
    print(clubSandwich)
}

