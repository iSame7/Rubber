//
//  RubberTransition.h
//  RubberTransition
//
//  Created by sameh mabrouk on 5/17/14.
//  Copyright (c) 2014 smapps. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol RubberTransition <NSObject>
- (NSArray*)visibleCells;
@end

typedef NS_ENUM(NSInteger, RubberTransitionType) {
    RubberTransitionTypeFluffy,
    RubberTransitionTypeSpooky
};

@interface RubberTransition : NSObject <UIViewControllerAnimatedTransitioning>

/**-----------------------------------------------------------------------------
 * @name RubberTransition
 * -----------------------------------------------------------------------------
 */

/** New transition
 *
 * Returns a RubberTransition instance.
 *
 * @param operation The UINavigationControllerOperation that determines the transition type (push or pop)
 */
+ (instancetype)transitionWithOperation:(UINavigationControllerOperation)operation;

/** New transition
 *
 * Returns a RubberTransition instance.
 *
 * @param operation The UINavigationControllerOperation that determines the transition type (push or pop)
 */
- (instancetype)initWithOperation:(UINavigationControllerOperation)operation;


/**-----------------------------------------------------------------------------
 * @name RubberTransition Properties
 * -----------------------------------------------------------------------------
 */

/** Operation type
 *
 * Sets the operation type (push or pop)
 *
 */
@property (assign, nonatomic) UINavigationControllerOperation operation;

/** Transition type
 *
 * Sets the transition style
 *
 */
@property (assign, nonatomic) RubberTransitionType transitionType;

/** Animation duration
 *
 * Sets the duration of the animation. The whole duration accounts for the maxDelay property.
 *
 */
@property (assign, nonatomic) CGFloat animationDuration;

/** Maximum animation delay
 *
 * Sets the Slight delay that a cell will wait beofre animating.
 *
 */
@property (assign, nonatomic) CGFloat slightDelay;

@end
