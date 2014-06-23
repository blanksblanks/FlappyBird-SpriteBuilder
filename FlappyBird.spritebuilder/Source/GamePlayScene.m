#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    character = (Character*)[CCBReader load:@"Character"];
    // loads a new Character from CCB file created by SpriteBuilder for you named Character
    [physicsNode addChild:character];
    // adds character as a child of physicsNode so physics applied to it
    [self addObstacle];
    // spawns a random obstacle in your method
    timeSinceObstacle = 0.0f;
    // initializes the variable timeSinceObstacle from .h
}

-(void)update:(CCTime)delta
{
    // this will be run every frame
    // delta is the time that has elapsed since the last time it was run. This is usually 1/60, but can be bigger if the game slows down
    // Update will automatically get called 60 times a sec
    // put update code here
    
    // Increment the time since the last obstacle was added
    timeSinceObstacle += delta; // delta is approx 1/60th of a second
    
    // Check to see if two seconds have passed
    if (timeSinceObstacle > 2.0f)
    {
        // Add a new obstacle
        [self addObstacle];
        
        // Then reset the timer.
        timeSinceObstacle = 0.0f;
    }
   
}

// put new methods here
- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    [character flap];
}

@end
