//
//  DataStructures.m
//  XcodeExcercise
//
//  Created by Harvey Nash on 6/22/16.
//  Copyright © 2016 Harvey Nash. All rights reserved.
//

#import "DataStructures.h"

@implementation DataStructures


+ (NSArray<NSNumber*> *) increaseArrayByOne: (NSArray<NSNumber*> *) array
                                  withError: (NSError **) error
                                       upTo: (NSNumber*)  upTo{
    
    //Verify the array
    BOOL isError = FALSE;
    NSMutableArray<NSNumber*> *result = nil;
    NSString* errorString = nil;
    
    //If array is nil then error = true
    if (array == nil || [array isEqual:[NSNull null]]) {
        isError = TRUE;
        
        errorString = @"Array is nil";
    }
    
    //Check if all element of array is NSNumber
    for (id obj in array) {
        if (![obj isKindOfClass:[NSNumber class]]) {
            
            isError = TRUE;
            errorString = [NSString stringWithFormat:@"%@ is not NSNumber class", obj];
            break;
        }
    }
    
    if(!isError) {
        //1. Declare the result array. The array should be mutable
        result = [NSMutableArray new];

        [array enumerateObjectsUsingBlock:^(NSNumber* obj, NSUInteger index, BOOL *stop) {
            
            //Maximun up to upTo element will be increased
            if( upTo == nil || [upTo unsignedIntegerValue] > index) {
                
                [result addObject: @([obj longLongValue] + 1)];
            } else {
                [result addObject:obj];
            }
        }];
    } else {
        
        *error = [NSError errorWithDomain:NSStringFromSelector(_cmd) code:0x1 userInfo:@{@"ErrorMessage":errorString}];
    }
    
    
    //Singel point exit for either success or failure
    if (isError) {
        return nil;
    } else {
        return result;
    }
}



+ (NSArray<NSNumber *> *)increaseArrayByOne:(NSArray<NSNumber *> *)array withError:(NSError *__autoreleasing *)error {
    
    return [DataStructures increaseArrayByOne:array withError:error upTo:nil];
}

+ (NSArray<NSNumber *> *)mapArray:(NSArray<NSNumber *> *)array byMappingBlock:(NSNumber *(^)(NSNumber *, BOOL* ))mappingBlock {
    
    NSMutableArray *result = [NSMutableArray new];
    __block BOOL stop = FALSE;
    
    for (id obj in array) {
        
        NSNumber* manipulatedObj = mappingBlock(obj, &stop);
        
        if (manipulatedObj != nil) {
            [result addObject:manipulatedObj];
        }
        
        if (stop) {
            break;
        }
    }
    
    return result;
}

+ (NSArray<NSNumber *> *)increaseArrayByTwo:(NSArray<NSNumber *> *)array {
    
    NSArray* resultArray = [DataStructures mapArray:array byMappingBlock:^ NSNumber* (NSNumber* origObj, BOOL* stop) {
        
        if (origObj == nil || [origObj isEqual:[NSNull null]]) {
            
            *stop = TRUE;
            
            return nil;
        } else {
            return ([NSNumber numberWithInteger:[origObj integerValue] + 2]);
        }
    }];
    
    return resultArray;
}

- (NSArray*)increaseByOne {
    
    //enumerate the array of object. If the object is array of NSNumber,
    // then call to increaseArrayByOne
    NSMutableArray<id> *result = nil;
    
    [_arrayOfObjects enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL*stop) {
        
        //Added the array after increase by one unit to result array
        NSError* err = nil;
        id arrayAfterIncreased = [DataStructures increaseArrayByOne:obj
                                                          withError: &err
                                                               upTo:nil];
        if (!err) {
            [result addObject:arrayAfterIncreased];
        } else {
            NSLog(@"%@", err);
        }
    }];
    
    return result;
}

@end
