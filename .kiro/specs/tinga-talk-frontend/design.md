# Design Document

## Overview

The Tinga Talk frontend design implements a dark-themed mobile application with three primary onboarding screens. The design emphasizes visual authenticity by replicating the exact aesthetic from provided screen images, including background images, gradients, overlays, and visual effects. The application follows a modern mobile UI pattern with consistent theming, smooth navigation, and responsive design principles.

The design architecture focuses on creating pixel-perfect implementations that match the provided screen designs while maintaining Flutter best practices for performance and maintainability. Each screen serves a specific purpose in the user onboarding flow: introduction (Landing Page), authentication (Phone Number Setting), and registration completion (Signup Page).

## Architecture

### Design System Architecture

The application follows a component-based architecture with a centralized design system:

```
lib/
├── design_system/
│   ├── colors.dart           # Color palette constants
│   ├── typography.dart       # Text styles and font definitions
│   ├── spacing.dart          # Spacing and sizing constants
│   └── theme.dart           # Overall app theme configuration
├── screens/
│   ├── landing/
│   │   └── landing_page.dart
│   ├── auth/
│   │   └── phone_number_screen.dart
│   └── signup/
│       └── signup_page.dart
├── widgets/
│   ├── common/
│   │   ├── custom_button.dart
│   │   ├── custom_input_field.dart
│   │   └── background_container.dart
│   └── navigation/
│       └── custom_back_button.dart
└── assets/
    ├── images/
    └── fonts/
```

### Navigation Architecture

The app uses a linear navigation flow:
1. Landing Page → Phone Number Screen
2. Phone Number Screen → Signup Page
3. Signup Page → Main App (future implementation)

Navigation is handled through Flutter's Navigator with custom page transitions to maintain the visual theme.

## Components and Interfaces

### Core Components

#### 1. BackgroundContainer Widget
```dart
class BackgroundContainer extends StatelessWidget {
  final Widget child;
  final String? backgroundImage;
  final Color? backgroundColor;
  final List<Color>? gradientColors;
  
  // Handles background images, gradients, and overlays
  // Ensures exact visual replication from screen designs
}
```

#### 2. CustomButton Widget
```dart
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isEnabled;
  
  // Implements consistent button styling:
  // - White background (#FDFDFD)
  // - Gray border (#ABABAB)
  // - 15px border radius
  // - Inter font family
}
```

#### 3. CustomInputField Widget
```dart
class CustomInputField extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool obscureText;
  
  // Implements dark theme input styling:
  // - Dark background (#141313)
  // - Gray border (#484848)
  // - 14px border radius
  // - Placeholder color (#797979)
}
```

#### 4. CustomBackButton Widget
```dart
class CustomBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  
  // Implements back button with:
  // - SF Pro Text font
  // - White color
  // - Proper spacing and alignment
}
```

### Screen Components

#### Landing Page Components
- **Hero Section**: Main headline with exact typography and color (#CCCCACC)
- **Tagline Section**: Subtitle with specified styling (#757575)
- **CTA Button**: "Get started" button with exact styling
- **Social Icons**: Bottom-right positioned social media icons
- **Background**: Full-screen background image with overlays

#### Phone Number Screen Components
- **Header**: Back button with proper styling
- **Phone Input**: Dark-themed input field with validation
- **Code Input**: Verification code input with same styling
- **Resend Section**: "Didn't receive code? send again" with interactive text
- **Continue Button**: Styled consistently with landing page button

#### Signup Page Components
- **Background**: Full-screen background image matching design
- **Form Container**: Dark-themed container for form elements
- **Input Fields**: Multiple input fields with consistent styling
- **Submit Button**: Final registration button

## Data Models

### Screen State Models

#### LandingPageState
```dart
class LandingPageState {
  final bool isLoading;
  final String? error;
  
  // Manages landing page state and navigation
}
```

#### PhoneNumberState
```dart
class PhoneNumberState {
  final String phoneNumber;
  final String verificationCode;
  final bool isCodeSent;
  final bool isVerifying;
  final String? error;
  final int resendTimer;
  
  // Manages phone verification flow
}
```

#### SignupState
```dart
class SignupState {
  final Map<String, String> formData;
  final Map<String, String?> fieldErrors;
  final bool isSubmitting;
  final String? submitError;
  
  // Manages signup form state and validation
}
```

### Theme Configuration Model

#### AppTheme
```dart
class AppTheme {
  static const Color primaryBackground = Color(0xFF000000);
  static const Color secondaryBackground = Color(0xFF141313);
  static const Color primaryText = Color(0xFFCCCCACC);
  static const Color secondaryText = Color(0xFF757575);
  static const Color placeholderText = Color(0xFF797979);
  static const Color buttonBackground = Color(0xFFFDFDFD);
  static const Color buttonBorder = Color(0xFFABABAB);
  static const Color inputBorder = Color(0xFF484848);
  
  // Typography definitions
  static const String primaryFont = 'Inter';
  static const String secondaryFont = 'SF Pro Text';
}
```

## Error Handling

### Input Validation
- **Phone Number Validation**: Format validation with country code support
- **Code Validation**: Numeric input validation with length constraints
- **Form Validation**: Real-time validation with visual feedback

### Network Error Handling
- **Connection Errors**: Graceful handling with retry mechanisms
- **API Errors**: User-friendly error messages with proper styling
- **Timeout Handling**: Loading states with timeout fallbacks

### Visual Error States
- **Field Errors**: Red border and error text below input fields
- **Global Errors**: Toast messages or modal dialogs with theme consistency
- **Loading States**: Skeleton screens or spinners matching the dark theme

## Testing Strategy

### Unit Testing
- **Widget Tests**: Individual component testing for all custom widgets
- **State Management Tests**: Testing state changes and business logic
- **Validation Tests**: Input validation and error handling tests

### Integration Testing
- **Navigation Flow Tests**: Complete user journey testing
- **Form Submission Tests**: End-to-end form functionality testing
- **Theme Consistency Tests**: Visual consistency across screens

### Visual Testing
- **Screenshot Tests**: Pixel-perfect comparison with design images
- **Responsive Tests**: Testing across different screen sizes
- **Theme Tests**: Dark theme consistency validation

### Performance Testing
- **Image Loading Tests**: Background image loading performance
- **Animation Tests**: Smooth transition performance
- **Memory Tests**: Memory usage optimization validation

## Implementation Considerations

### Asset Management
- **Background Images**: High-resolution images with proper compression
- **Icon Assets**: Vector icons for scalability
- **Font Assets**: Inter and SF Pro Text font families

### Responsive Design
- **Screen Adaptation**: Proportional scaling for different screen sizes
- **Orientation Support**: Portrait-focused with landscape considerations
- **Device Compatibility**: Android and iOS specific adjustments

### Performance Optimization
- **Image Caching**: Efficient background image caching
- **Widget Optimization**: Minimal rebuilds and efficient rendering
- **Memory Management**: Proper disposal of resources

### Accessibility
- **Screen Reader Support**: Semantic labels and descriptions
- **Touch Targets**: Minimum 44px touch targets
- **Color Contrast**: Sufficient contrast ratios for text readability

## Technical Specifications

### Dependencies
```yaml
dependencies:
  flutter: ^3.0.0
  cupertino_icons: ^1.0.2
  
dev_dependencies:
  flutter_test: ^3.0.0
  flutter_lints: ^2.0.0
```

### Build Configuration
- **Target SDK**: Android API 21+, iOS 11+
- **Flutter Version**: 3.0.0+
- **Dart Version**: 2.17.0+

### Asset Configuration
```yaml
flutter:
  assets:
    - assets/images/
    - assets/fonts/
  fonts:
    - family: Inter
      fonts:
        - asset: assets/fonts/Inter-Regular.ttf
        - asset: assets/fonts/Inter-Bold.ttf
          weight: 700
    - family: SF Pro Text
      fonts:
        - asset: assets/fonts/SFProText-Regular.ttf
```