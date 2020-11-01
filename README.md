# KarysTrivia-iOS

Trivia game that consists of one question and four possible answers per round. There are ten rounds in total with a maximum score of 10. Tandem Trivia is written in Swift and programatically.   

### Requirements

Xcode

Xcode 6.0 or later

iOS 8.0 or later

OS X v10.10 or later

### Common setup
Clone the repo and install the dependencies.

git clone https://github.com/karyRmartinez/KarysTrivia-iOS.git

### Json 
Json file provided by Tandem.

### Assumptions
- A round of trivia has 10 Questions
- All questions are multiple-choice questions
- Your score does not need to update in real time
- Results can update on form submit, button click, or any interaction you choose
- We will provide you with the trivia data such as the questions, correct and incorrect answers via a JSON file.

### Acceptance Criteria
- A user can view questions.
- Questions with their multiple choice options must be displayed one at a time. 
- Questions should not repeat in a round.
- A user can select only 1 answer out of the 4 possible answers.
- The correct answer must be revealed after a user has submitted their answer A user can see the score they received at the end of the round.

### Future Additional Features
- Turning the correct answer green and turning the incorrect answer red upon selection.
- Add confetti animation if user scores a perfect 10.
- Add diffucilty levels to categorize the questions (i.e. easy, medium, hard)

