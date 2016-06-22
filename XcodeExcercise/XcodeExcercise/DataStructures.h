//
//  DataStructures.h
//  XcodeExcercise
//
//  Created by Harvey Nash on 6/22/16.
//  Copyright © 2016 Harvey Nash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataStructures : NSObject

@property (nonatomic, strong) NSArray<id> *arrayOfObjects;

/**
 * @brief: The static function take an array as input and increase every element by one unit up to given element
 * @param array:  An array of NSNumber
 * @param error:  NSError, information of error
 * @return: The result array after increase by one unit
 */
+ (NSArray<NSNumber*> *) increaseArrayByOne: (NSArray<NSNumber*> *) array
                                  withError: (NSError**) error
                                       upTo: (NSNumber*) upTo;
/**
 * @brief: The static function take an array as input and increase every element by one unit
 * @param array:  An array of NSNumber
 * @param error:  NSError, information of error
 * @return: The result array after increase by one unit
 */
+ (NSArray<NSNumber*> *) increaseArrayByOne: (NSArray<NSNumber*> *) array
                                  withError: (NSError**) error;



/**
 * @brief: The static function take an array as input and increase every element by one unit
 * @param array:  An array of NSNumber
 * @param mapping function: The block used to mapping each element of input array to another element in result array
 * @param error:  NSError, information of error
 * @return: The result array after executing mapping function
 */
+ (NSArray<NSNumber*> *) mapArray: (NSArray<NSNumber*> *) array
                   byMappingBlock: (NSNumber* (^)(NSNumber* originElement, BOOL* stop)) mappingBlock;


/**
 * @brief: Function take advance mapping function to increate a array by two unit
 */
+ (NSArray<NSNumber*> *) increaseArrayByTwo: (NSArray<NSNumber*> *) array;

/**
 * @brief  The function increase  every element by one unit
 * @return The result array after increase by one unit
 */
- (NSArray *) increaseByOne;


@end
