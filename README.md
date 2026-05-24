<div align="center">

# 🏯 Pink City Explorer: Jaipur Tourism Platform

**A full-stack, immersive tourism platform built for discovering the rich culture, heritage, and flavors of Jaipur.**

[![React](https://img.shields.io/badge/React-19.2.5-61DAFB?logo=react&logoColor=black)](#)
[![Spring Boot](https://img.shields.io/badge/Spring_Boot-3.2.4-6DB33F?logo=spring-boot&logoColor=white)](#)
[![MySQL](https://img.shields.io/badge/MySQL-Database-4479A1?logo=mysql&logoColor=white)](#)
[![Gemini API](https://img.shields.io/badge/AI-Gemini_Powered-8E75B2?logo=google-gemini&logoColor=white)](#)

### 🌍 Live Demo: [http://35.154.74.197.nip.io](http://35.154.74.197.nip.io)

*A collaborative first-year B.Tech project developed at IIIT Lucknow.*

</div>

---

## 📌 Project Overview
**Pink City Explorer** is a comprehensive, full-stack web application designed to be the ultimate digital companion for anyone visiting Jaipur. From majestic forts to bustling markets, the platform provides rich insights, dynamic itineraries, and an interactive AI virtual guide to enhance the tourism experience. 

The project evolved from a static HTML site into a powerful, data-driven application featuring a modern React frontend and a robust Spring Boot backend.

## ✨ Key Features

### 🎨 UI/UX & Design Architecture
1. **Dynamic Bento Grid Layout:** Responsive, image-rich "Bento Grid" for the Shopping section showcasing markets.
2. **Glassmorphism Theme Elements:** Modern translucent overlays with frosted glass effects and smooth transitions.
3. **Scroll-triggered Micro-animations:** Hover-lift cards, fade-in elements, and dynamic loading on scroll.
4. **Interactive Modal Popups:** Detailed views for Attractions/Markets displaying embedded ratings, reviews, and timings.
5. **Vintage Tourist Aesthetics:** Custom "Letter to the Traveler" styling with feather quill motifs and warm color palettes.

### ⚙️ Backend, Security & APIs (Spring Boot)
6. **JWT-based Authentication:** Secure, stateless user sessions handled via JSON Web Tokens.
7. **Google OAuth2 Integration:** Frictionless "Sign in with Google" via `@react-oauth/google` and Spring Security.
8. **Automated Password Reset:** Secure token generation and email dispatch for forgotten passwords.
9. **Role-Based Access Control (RBAC):** Protected admin routes for dashboard management versus regular user profiles.
10. **Tour Package CRUD Management:** Comprehensive REST endpoints for admins to create, update, and delete itineraries.

### 🤖 AI Integration & Tourist Utilities
11. **Gemini-Powered Virtual Guide:** Conversational AI chatbot offering real-time, context-aware Jaipur travel tips.
12. **Live Map Routing:** Interactive map directions using Leaflet Routing Machine with an OSRM backend.
13. **Real-time Map Visualization:** Integrated Leaflet maps rendering precise coordinates of 40+ Jaipur attractions.
14. **Custom Geo-Filtering:** Sort and filter tourist sites by categories (Forts, Temples, Museums, Markets).
15. **User Profile & Avatar Management:** Custom profile settings with image cropping functionality via `react-easy-crop`.
16. **Live Weather Integration:** Real-time weather updates to help users plan their excursions effectively.
17. **Dynamic Tour Booking Engine:** Seamless flow from browsing attractions to booking custom tour packages.

## 💻 Tech Stack

### Frontend
- **Framework:** React 19 (via Vite)
- **Styling:** CSS3, Tailwind (custom utilities), Bootstrap
- **Mapping:** React Leaflet & Leaflet Routing Machine
- **Authentication:** Google OAuth2 (`@react-oauth/google`)

### Backend
- **Framework:** Spring Boot 3.2.4 (Java 17)
- **Database:** MySQL (Spring Data JPA)
- **Security:** Spring Security & OAuth2 Client
- **Email Services:** Spring Boot Mail

### External APIs
- **AI Integration:** Google Gemini API
- **Weather & Geolocation APIs**

---

## 🚀 Local Setup Instructions

Follow these steps to run both the frontend and backend environments on your local machine.

### Prerequisites
- Node.js (v18+)
- Java Development Kit (JDK 17)
- MySQL Server installed and running
- Maven (optional, wrapper included)

### 1. Database Setup
1. Open your MySQL client.
2. Create a new database for the project (e.g., `jaipur_tourism`).
3. Update your `application.properties` in the Spring Boot backend with your MySQL username and password.

### 2. Backend Setup (Spring Boot)
1. Navigate to the backend directory:
   \`\`\`bash
   cd jaipur-react/backend
   \`\`\`
2. (Optional) Make the build scripts executable if on Unix/Linux:
   \`\`\`bash
   chmod +x start_backend.sh
   \`\`\`
3. Build and run the Spring Boot application using Maven:
   \`\`\`bash
   ./mvnw spring-boot:run
   \`\`\`
   *Alternatively, you can run the `run.ps1` script if you are on Windows.*
4. The backend server will start on \`http://localhost:8080\`.

### 3. Frontend Setup (React)
1. Open a new terminal and navigate to the React project directory:
   \`\`\`bash
   cd jaipur-react
   \`\`\`
2. Install the required Node dependencies:
   \`\`\`bash
   npm install
   \`\`\`
3. Create a `.env` file in the `jaipur-react` folder and add your API keys (Gemini API, Google Client ID, etc.):
   \`\`\`env
   VITE_GEMINI_API_KEY=your_gemini_api_key
   VITE_GOOGLE_CLIENT_ID=your_google_oauth_client_id
   \`\`\`
4. Start the Vite development server:
   \`\`\`bash
   npm run dev
   \`\`\`
5. Open your browser and navigate to \`http://localhost:5173\`.

---

## 👥 Contributors
- Nayan Gupta: @NayanG-45
- Freny: @Freny07
- Prabal Verma: @Prabal2007
- Bikash Kumar Meher: @bikash-m007

*Feel free to star ⭐ the repository if you like our project!*
