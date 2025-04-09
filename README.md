# QR Scan Plus - Your All-in-One QR Code Solution

[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
[![Provider](https://img.shields.io/badge/Provider-%234DB6AC.svg?style=for-the-badge&logoColor=white)](https://pub.dev/packages/provider)
[![sqflite](https://img.shields.io/badge/sqflite-%2300897B.svg?style=for-the-badge&logoColor=white)](https://pub.dev/packages/sqflite)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-blue.svg)](https://flutter.dev/docs/get-started/install)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](https://github.com/your-username/qr_scan_plus/pulls)
[![Issues](https://img.shields.io/github/issues/your-username/qr_scan_plus)](https://github.com/your-username/qr_scan_plus/issues)

**QR Scan Plus** is a robust and user-friendly Flutter application designed to streamline your interaction with QR codes. Seamlessly scan various QR code formats and effortlessly generate your own, all while maintaining a comprehensive history for easy access. Leveraging the power of **Provider** for efficient state management and **sqflite** for persistent local storage, QR Scan Plus offers a reliable and intuitive solution for all your QR code needs.

## 📸 Screenshots

![QR Code Scan Result](https://www.google.com/imgres?q=test%20qr&imgurl=https%3A%2F%2Fimages.squarespace-cdn.com%2Fcontent%2Fv1%2F5d3f241fa4e0350001fa20d5%2F1636491460338-AIZAXV2978MGIDQE0GT7%2Fqr-code.png&imgrefurl=https%3A%2F%2Fidemia-mobile-id.com%2Ftestqr&docid=2rXiediJKErJDM&tbnid=-reLZIovTV63oM&vet=12ahUKEwjLt4LP0cqMAxVxsFYBHZdzLFQQM3oECBwQAA..i&w=296&h=296&hcb=2&ved=2ahUKEwjLt4LP0cqMAxVxsFYBHZdzLFQQM3oECBwQAA)

## ✨ Highlighted Features

* **Intelligent Scan Recognition:** QR Scan Plus goes beyond simple decoding. It intelligently recognizes the type of information encoded within the QR code. For URLs, it offers direct navigation to the website. For contact information, it provides options to save the contact directly to your address book. For Wi-Fi credentials, it can help you quickly connect to the network.
* **Customizable QR Code Generation:** Unleash your creativity with the QR code generator. Not only can you generate QR codes for basic text and URLs, but you can also create codes for complex data like detailed contact cards (vCard), event information (iCalendar), and even pre-configured Wi-Fi network access points. This makes sharing information seamless and efficient.
* **Effortless History Management:** Never lose track of your scanned or generated QR codes. QR Scan Plus automatically saves every interaction in a well-organized history. This allows you to quickly revisit previously scanned websites, access generated contact cards, or review Wi-Fi passwords without needing to scan or generate them again. The history is easily searchable and manageable, putting your QR code activity at your fingertips.
* **Privacy-Focused Local Storage:** Your QR code history is stored securely and privately on your device using **sqflite**. We believe in user data privacy, and therefore, your scanned and generated information never leaves your device unless you explicitly choose to share it.
* **Seamless Sharing, Saving and Copying:** Sharing scanned or generated QR codes is a breeze. With a simple tap, you can share the QR code image or its underlying data with other applications and also you can save the QR image to your gallery. Additionally, the decoded information from scanned codes and the data of generated codes can be instantly copied to your clipboard for easy pasting into other apps or documents.

## 🛠️ Technologies Used

* **Flutter:** A powerful UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
* **Provider:** A simple, testable, and widely adopted state management solution for Flutter applications.
* **mobile\_scanner:** A Flutter plugin for efficiently scanning various types of barcodes and QR codes.
* **qr\_flutter:** A Flutter package for generating high-quality QR code images within your application.
* **sqflite:** A Flutter plugin providing SQLite database access, enabling robust local data storage.
* **path\_provider:** A Flutter plugin for finding common locations on the device's file system, necessary for initializing the sqflite database.

## 🚦 State Management (Provider)

QR Scan Plus leverages the **Provider** package to manage the application's state in a structured and reactive manner. The `HistoryProvider` plays a central role in:

* Fetching and exposing the list of scanned and generated QR code history.
* Providing methods for adding new QR code entries to the history.
* Implementing logic for deleting specific or all history entries.
* Ensuring that UI components automatically update whenever the history data changes.

## 💾 Local Data Storage (sqflite)

The **sqflite** plugin is employed for persistent local storage of the QR code history. The `DatabaseHelper` class encapsulates all database interactions, including:

* Initializing and managing the SQLite database instance.
* Defining the schema for the `qr_history` table.
* Implementing CRUD (Create, Read, Update, Delete) operations for managing QR code records.

## 🤝 Contributing

We welcome contributions from the community! If you have ideas for new features, bug fixes, or improvements, please feel free to:

1.  Fork the repository.
2.  Create a new branch for your feature or fix.
3.  Implement your changes and write appropriate tests.
4.  Commit your changes following conventional commit guidelines.
5.  Push your branch to your forked repository.
6.  Submit a pull request detailing your changes.

Please ensure your code adheres to the project's coding standards and that your pull request clearly describes the issue or feature you are addressing.

## 🙏 Acknowledgements

* The Flutter team for providing an excellent cross-platform development framework.
* The developers and maintainers of the `provider`, `mobile_scanner`, `qr_flutter`, and `sqflite` Flutter packages for their valuable contributions to the Flutter ecosystem.
