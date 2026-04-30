📱 Multiple Storyboards Demo (iOS)
📌 Overview

This project demonstrates how to use multiple storyboards in iOS and navigate between them programmatically using UIStoryboard.

🚀 Features
Multiple storyboards (Auth, Home, Profile)
Login with validation (email & password)
Navigation using UINavigationController
Logout with confirmation alert
Modular UI structure
🧱 Structure
Storyboards:
- Auth.storyboard
- Home.storyboard
- Profile.storyboard

Controllers:
- LoginViewController
- HomeViewController
- ProfileViewController
🔄 Flow
Login → Home → Profile → Logout → Login
🔧 Key Concepts
Load storyboard:
UIStoryboard(name: "Home", bundle: nil)
Navigate:
navigationController?.pushViewController(vc, animated: true)
Reset root (Logout):
window?.rootViewController = navController
⚠️ Setup
Remove Main.storyboard
Clear:
Main Interface
UIMainStoryboardFile
UISceneStoryboardFile
✅ Summary
Feature-based storyboards
Programmatic navigation
Clean and scalable structure
