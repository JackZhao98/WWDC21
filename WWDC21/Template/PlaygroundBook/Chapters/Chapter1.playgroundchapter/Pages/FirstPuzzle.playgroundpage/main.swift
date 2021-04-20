
/*:
 ## Chapter 2: Another Barrier
 
 You have gained Chris's trust and get the device unlocked, but the passowrd is still here. You need to figure out the correct combination...
 
 Wait, Chris send a message to us!

 
 ## Chris's message
 
 Hi Jack,
 
 I see the default device lock came back... you will definitely need a password this time.
 
 Hmm, but the good news is, I found a way to get around the security mechanism, and I got this piece of code for you. It says "Home Screen Lock" in the comments, so it must be helpful!
 
 Oh by the way, I'm not good at guessing numbers (even though I can **_SOMEHOW_** get these code for you LOL ), but I have faith in you!
 
 - Important: Find the correct a, b, c, d to make the function below return TRUE, I'm sure `abcd` is the right combination.
 
 Good luck,
 
 Chris

 
 */


// controls the Home Screen Lock
// returns: True to unlock
func a15sEcuR3PAssWord(a: Int, b: Int, c: Int, d: Int) -> Bool {
    var lock1: Bool = false
    var lock2: Bool = false
    var x: Int = 0
    
    if a == c {
        x += 10
    } else {
        x -= 10
    }
    
    if a + b == b {
        x -= 3
    } else {
        x += 3
    }
    
    lock1 = ((d - b) == 1)
    
    if d == x && x < 10 && x > 0 {
        lock2 = true
    }
    
    return lock1 && lock2
}
