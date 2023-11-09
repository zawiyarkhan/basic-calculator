//
//  KalculatorTests.swift
//  KalculatorTests
//
//  Created by Adil Saleem on 31/10/2023.
//  Copyright © 2023 Jogendra Singh. All rights reserved.
//

import XCTest

@testable import Kalculator
final class KalculatorTests: XCTestCase {
//    let calculator = Calculator()
    
    func testInputDigitWithDigit() throws {
        let calculator = Calculator()
        let result = try calculator.inputDigit("1")

        XCTAssertEqual(result, "1")
    }

    // Test inputDigit(_:) with a valid operator
    func testInputDigitWithOperator() throws {
        let calculator = Calculator()
        let result = try calculator.inputDigit("+")

        XCTAssertEqual(result, "+")
    }

    // Test appendDigit(_:) with a digit
    func testAppendDigitWithDigit() throws {
        let calculator = Calculator()
        try calculator.appendDigit("1")

        XCTAssertEqual(calculator.currentNumber, "1")
    }

    // Test addOperation()
    func testAddOperation() throws {
        let calculator = Calculator()
        try calculator.appendDigit("1")
        calculator.addOperation()

        XCTAssertEqual(calculator.result, 1)
    }

    // Test subtractOperation()
    func testSubtractOperation() throws {
        let calculator = Calculator()
        try calculator.appendDigit("1")
        calculator.subtractOperation()

        XCTAssertEqual(calculator.result, -1)
    }

    // Test multiplyOperation()
    func testMultiplyOperation() throws {
        let calculator = Calculator()
        try calculator.appendDigit("1")
        calculator.multiplyOperation()

        XCTAssertEqual(calculator.result, 1)
    }

    // Test divideOperation()
    func testDivideOperation() throws {
        let calculator = Calculator()
        try calculator.appendDigit("2")
        try calculator.divideOperation()

        XCTAssertEqual(calculator.result, 1)
    }
    
    
    
    func testInputDigitWithInvalidDigit() throws {
        let calculator = Calculator()

        do {
            let result = try calculator.inputDigit("a")
        } catch CalculatorError.invalidDigit {
            // Expected error
        } catch {
            XCTFail("Unexpected error")
        }
    }

    // Test inputDigit(_:) with a valid operator twice
    func testInputDigitWithOperatorTwice() throws {
        let calculator = Calculator()

        do {
            let result = try calculator.inputDigit("+")
            let result2 = try calculator.inputDigit("+")
        } catch CalculatorError.illegalOperation {
            // Expected error
        } catch {
            XCTFail("Unexpected error")
        }
    }

    // Test appendDigit(_:) with an invalid digit
    func testAppendDigitWithInvalidDigit() throws {
        let calculator = Calculator()

        do {
            try calculator.appendDigit("a")
        } catch CalculatorError.invalidDigit {
            // Expected error
        } catch {
            XCTFail("Unexpected error")
        }
    }

    // Test addOperation() without entering any digits first
    func testAddOperationWithoutDigits() throws {
        let calculator = Calculator()

        do {
            calculator.addOperation()
        } catch CalculatorError.illegalOperation {
            // Expected error
        } catch {
            XCTFail("Unexpected error")
        }
    }

    // Test subtractOperation() without entering any digits first
    func testSubtractOperationWithoutDigits() throws {
        let calculator = Calculator()

        do {
            calculator.subtractOperation()
        } catch CalculatorError.illegalOperation {
            // Expected error
        } catch {
            XCTFail("Unexpected error")
        }
    }

    // Test multiplyOperation() without entering any digits first
    func testMultiplyOperationWithoutDigits() throws {
        let calculator = Calculator()

        do {
            calculator.multiplyOperation()
        } catch CalculatorError.illegalOperation {
            // Expected error
        } catch {
            XCTFail("Unexpected error")
        }
    }

}
