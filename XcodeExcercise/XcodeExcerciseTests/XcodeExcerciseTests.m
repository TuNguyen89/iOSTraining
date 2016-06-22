//
//  XcodeExcerciseTests.m
//  XcodeExcerciseTests
//
//  Created by Harvey Nash on 6/22/16.
//  Copyright © 2016 Harvey Nash. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DataStructures.h"

@interface XcodeExcerciseTests : XCTestCase
{
    DataStructures* dataStructure;
}

@end

@implementation XcodeExcerciseTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    dataStructure = [DataStructures new];
//    dataStructure.arrayOfObjects = @[
//                                     [NSNull null],          // Null object
//                                     @[],                    // Empty array
//                                     @[@0, @1, @2, @3],      // Array of integer
//                                     @[@"1", @"2", @"3"]     // Array of String
//                                     ];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [dataStructure increaseByOne];
}

- (void) testIncreaseArrayByOne_ArrayIsNullObj {
    
    NSError *error = nil;
    id resultArray = [DataStructures increaseArrayByOne:nil withError:&error];
    
    //Expected: error is not nill
    XCTAssert(error != nil);
    XCTAssert(resultArray == nil);
}

- (void) testIncreaseArrayByOne_ArrayIsEmpty {
    
    NSError *error = nil;
    NSArray* emptyArray = [NSArray arrayWithObjects:[NSNull null], nil];
    id resultArray = [DataStructures increaseArrayByOne:emptyArray withError:&error];
    
    //Expected: error is not nill
    XCTAssert(error != nil);
    XCTAssert(resultArray == nil);
}

//Check the array of integer
- (void) testIncreaseArrayByOne_ArrayOfInteger {
    
    NSError *error = nil;
    NSArray* arrayOfInteger = @[@0, @1, @2, @3];
    id resultArray = [DataStructures increaseArrayByOne:arrayOfInteger withError:&error];
    
    //Expected: error is not nill
    XCTAssert(error == nil);
    
    // Expected output array is [1,2,3,4]
    BOOL isError = [resultArray isEqual: [NSArray arrayWithObjects: @1, @2, @3, @4, nil]];
    
    XCTAssert(isError);
}


//Check the array of string
- (void) testIncreaseArrayByOne_ArrayOfString {
    
    NSError *error = nil;
    NSArray* arrayOfString = @[@"1", @"2", @"3"];
    id resultArray = [DataStructures increaseArrayByOne:arrayOfString withError:&error];
    
    //Expected: error is not nill
    XCTAssert(error != nil);
    XCTAssert(resultArray == nil);
}

//Check to see only 1 element is increased
- (void) testIncreaseArrayByOne_ArrayOfIntegerUpTo {
    
    NSError *error = nil;
    NSArray* arrayOfInteger = @[@0, @1, @2, @3];
    id resultArray = [DataStructures increaseArrayByOne:arrayOfInteger withError:&error upTo:@1];
    
    //Expected: error is not nill
    XCTAssert(error == nil);
    
    // Expected output array is [1,2,3,4]
    BOOL isError = [resultArray isEqual: [NSArray arrayWithObjects: @1, @1, @2, @3, nil]];
    
    XCTAssert(isError);
}

// Checking mapping function increase for 2
- (void) testMappingBlock {
    
    NSArray* arrayOfInteger = @[@0, @1, @2, @3];
    id resultArray = [DataStructures increaseArrayByTwo:arrayOfInteger];
    
    // Expected output array is [1,2,3,4]
    BOOL isError = [resultArray isEqual: [NSArray arrayWithObjects: @2, @3, @4, @5, nil]];
    
    XCTAssert(isError);
}

- (void) testMappingBlockStopInTheMiddle {
    
    // The array contain nsnull element, then the mapping block is stop.
    // The result array should contain the first element which mapped successful
    NSArray* arrayOfInteger = @[@0, @1, [NSNull null], @3];
    id resultArray = [DataStructures increaseArrayByTwo:arrayOfInteger];
    
    // Expected output array is [1,2,3,4]
    BOOL isError = [resultArray isEqual: [NSArray arrayWithObjects: @2, @3, nil]];
    
    XCTAssert(isError);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
