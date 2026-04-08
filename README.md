🔥 ChallengeDays
Create, track and complete weekly challenges — and see who's winning among friends.

<img width="1206" height="700" alt="Simulator Screenshot - iPhone 17 26 2 - 2026-04-07 at 22 54 35" src="https://github.com/user-attachments/assets/5f794f09-d068-4590-8243-f9719e672016" />
<img width="1206" height="700" alt="Simulator Screenshot - iPhone 17 26 2 - 2026-04-07 at 22 55 29" src="https://github.com/user-attachments/assets/8d0b94d2-23e7-4454-b29b-355a801853df" />
<img width="1206" height="700" alt="Simulator Screenshot - iPhone 17 26 2 - 2026-04-07 at 22 56 30" src="https://github.com/user-attachments/assets/a2b911b3-0f46-4787-89e2-92c8826b45ac" />


📱 About
ChallengeDays is an iOS app where users can create their own weekly challenges and track their daily progress. The app features a friends ranking system that shows who's completing the most challenges — turning personal discipline into a social and competitive experience.

Built entirely with UIKit using View Code (no Storyboards, no XIBs) and Core Data for local persistence.


✨ Features

🎯 Custom Challenges — Create weekly challenges with a name and number of days
📅 Daily Progress Tracking — Complete one day at a time with a clear visual flow
🔄 Challenge Reset — Restart any challenge from scratch whenever you want
📊 Progress Circle — Visual indicator showing how far you've come
🪜 Day Stepper — Step-by-step view of each day's progress
🏆 Friends Ranking — See who's completing the most challenges among your friends
💾 Local Storage with Core Data — All data persists offline, no account required


🛠 Tech Stack
Layer: Technology
Language: Swift 6
UI Framework: UIKit (100% View Code)
Persistence: Core Data
Architecture: MVVM. 

🏗 Project Structure

` ChallengeDays/
├── App/
│   ├── AppDelegate.swift
│   └── SceneDelegate.swift
│
├── Features/
│   └── Challenge/
│       ├── Model/
│       │   └── ChallengeState.swift
│       ├── View/
│       │   └── ChallengeView.swift
│       └── Controller/
│           └── ChallengeViewController.swift
│
├── Components/
│   ├── ButtonComponent.swift
│   ├── CustomCard.swift
│   ├── ProgressCircleView.swift
│   └── StepperView.swift
│
├── CoreData/
│   └── ChallengeDays.xcdatamodeld
│
└── Resources/
    └── Colors.swift
`

Installation

`# Clone the repository
git clone https://github.com/your-username/ChallengeDays.git

# Open in Xcode
cd ChallengeDays
open ChallengeDays.xcodeproj
` 
