#  Required Tasks
1. Get the Concentration game working as demonstrated in lectures 1 and 2. Type in all the code. Do not copy/paste from anywhere.
2. Add more cards to the game.
3. Add a “New Game” button to your UI which ends the current game in progress and begins a brand new game.


4. Currently the cards in the Model are not randomized (that’s why matching cards end up always in the same place in our UI). Shuffle the cards in Concentration’s init() method.
5. Give your game the concept of a “theme”. A theme determines the set of emoji from which cards are chosen. All emoji in a given theme are related by that theme. See the Hints for example themes. Your game should have at least 6 different themes and should choose a random theme each time a new game starts.
6. Your architecture must make it possible to add a new theme in a single line of code.
7. Add a game score label to your UI. Score the game by giving 2 points for every match and penalizing 1 point for every previously seen card that is involved in a mismatch.
8. Tracking the flip count almost certainly does not belong in your Controller in a proper MVC architecture. Fix that.
9. All new UI you add should be nicely laid out and look good in portrait mode on an iPhone X.

#  Extra Credit
If you choose to tackle an Extra Credit item, mark it in your code with comments so your grader can find it.
1. Change the background and the “card back color” to match the theme. For example, our Halloween theme has a black background and orange card backs. Maybe a “winter” theme might have blue and white colors. A “construction” theme could be black and yellow. UIViewController has a property called view which is connected to the top-level view in the scene (i.e. the view that was black in lecture).
2. You can find out what time it is using the Date struct. Read the documentation to figure out how it works and then use it to adjust your scoring so that the more quickly moves are made, the better the user’s score is. You can modify the scoring Required Task in doing this, but the score must still somehow be dependent on matches being rewarded and mismatches of previously-seen cards being penalized (in addition to being time-based). It’s okay if a “good score” is a low number and a “bad score” is a high number.

#  Hints
1. Economy is valuable in coding. The easiest way to ensure a bug-free line of code is not to write that line of code at all. This entire assignment (not including Extra Credit) can be done in a few dozen lines of code beyond what was shown in lecture (probably less than two dozen), so if you find yourself writing more than 100 lines of code, you are almost certainly on the wrong track.
🐼 🐔 🦄 ), sports (
3. If you flipped over a 🐧 + 👻 , then flipped over a ✏ + 🏀 , then flipped over two
👻 s, your score would be 2 because you’d have scored a match (and no penalty would
be incurred for the flips involving 🐧 , ✏ or 🏀 because they have not (yet) been
involved in a mismatch, nor was the 👻 ever involved in a mismatch). If you then
flipped over a 🐧 + 🐼 , then flipped 🏀 + 🐧 , your score would drop 3 full points
down to -1 overall because the 🐧 had already been seen (on the very first flip) and subsequently was involved in two separate mismatches (scoring -1 for each mismatch)
and the 🏀 was also involved in a mismatch after already having been seen (-1). If you then flip 🐧 + 🐧 , you’d get 2 points for a match and be back up to 1 total point.
4. If you’d like an Array containing all the keys in a Dictionary (called foo in this example), use ...
let fooKeys = Array(foo.keys)
         2. Example themes: animals (
🏀 🏈 ⚾ ), faces (😀 😢 😉 ).
                 
                 
                 

