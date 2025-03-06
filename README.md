# 🚨 Quick Action Against Harassment

A Flutter-based mobile application using Supabase for backend services, designed to provide quick actions against harassment and emergencies. The app allows users to register, add family members, send emergency messages, and record incidents.

## 📱 Features

- **User Registration & Login** (Supabase authentication)
- **OTP-based Family Member Verification**
- **Emergency SOS Button** (Sends SMS & records location)
- **Location Tracking** (Retrieves user location for emergencies)
- **Incident Recording** (Captures video evidence during an emergency)
- **Supabase Database Integration**

## 🛠️ Tech Stack

- **Frontend:** Flutter (Dart)
- **Backend:** Supabase (PostgreSQL, Authentication, Storage)
- **APIs & Plugins:**
  - `supabase_flutter` for database interactions
  - `geolocator` for location tracking
  - `telephony` for sending SMS
  - `camera` for recording videos

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (latest version)
- Supabase account & project
- Android/iOS device or emulator

### Installation

1. **Clone the repository**
   ```sh
   git clone https://github.com/your-username/quick-response-app.git
   cd quick-response-app
   ```

2. **Install dependencies**
   ```sh
   flutter pub get
   ```

3. **Configure Supabase**
   - Create a `.env` file and add your `SUPABASE_URL` and `SUPABASE_KEY`
   - Example:
     ```env
     SUPABASE_URL=https://your-supabase-url.supabase.co
     SUPABASE_KEY=your-supabase-key
     ```

4. **Run the app**
   ```sh
   flutter run
   ```

## 📸 Screen Recordings
### Demo of user side application
[![Watch the Video](https://img.youtube.com/vi/your_video_id/0.jpg)](https://github.com/user-attachments/assets/2d3c576d-8949-4943-b8d2-e04fa4abd959)
### Demo of Police side application
[![Watch the Video](https://img.youtube.com/vi/your_video_id/0.jpg)](https://github.com/user-attachments/assets/612020f7-8297-44ff-bc7d-a39d1a882865)


## 📝 Future Improvements

- Push Notifications for SOS Alerts
- AI-based threat detection
- Multi-language support
- Cloud storage for recorded videos

## 🤝 Contributing

Contributions are welcome! Feel free to fork this repository and submit a pull request.

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
> Built with ❤️ using Flutter & Supabase

