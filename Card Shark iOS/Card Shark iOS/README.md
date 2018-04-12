# Card-Shark-iOS

*Create new xCode project and repository on your Github with the title above* 
1. (GET) Create Deck of cards (obtain a
deck_id)
https://deckofcardsapi.com/api/deck/new/
2. (GET) Shuffle the deck
https://deckofcardsapi.com/api/deck/
<<deck_id>>/shuffle/
3. (GET) Obtain All 52 cards from the
shuffled deck API
https://deckofcardsapi.com/api/deck/
<<deck_id>>/draw/?count=52
4. Create an object model that saves the
“image”, “value”, “suit”, and ”code” of
each card from the JSON returned above.
5. Objective is to display the image of
each card in a collection view. Cards must
be shuffled (Step 2) before being presented
on the collection view. Display an activity
  
indicator during network requests.
6. Create 2 View Controllers embedded in a
Navigation Controller.
— Initial View controller that simply
contains a button with an action that
executes steps 1-3 then pushes to the
Second VC.
— Second View Controller should contain the
collection view and details listed below.
7. Include 2 buttons on the bottom of your
second view controller.
— First button called “Arrange”.
— Second button called “Re-Shuffle”
8. The Arrange button action should do 2 things when pressed: —- Re-order the display of the images in the collection view in a new sequence based on each cards “suit”. The new individual sequence pattern should be CLUBS, HEARTS, SPADES, DIAMONDS. 
—- In the console print the “code” of each
card in in the same sequence however
exclude the Kings, Queens, Jacks, and Aces.
9. The Re-Shuffle button action should do 2
things when pressed:
—- Shuffle the deck (same as step 2)
—- Re-order the display of the images in
the collection view in a new order of the
cards returned from the API.
* When completed, send the link of your
repository to miles.fishman@fivesixtwo.com
Bonus: when Re-Shuffle button is pressed in the console print an array of each cards “code” in dictionary pairs of black and red that sum up to 13. (Ex: [[JS:2D],...]) 
Tips: 
— Spades & Clubs are Black, Hearts & Diamonds are red — Jacks = 11, Queens = 12, Kings = 13, Aces =1 
Feel free to email me and ask questions!
** If API doesn’t return an image on a card
feel free to put a placeholder **

