import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medibuddy/loading_screen.dart';
import 'package:medibuddy/main.dart';
import 'package:medibuddy/views/contact/contact.dart';
import 'package:medibuddy/views/login/login_screen.dart';
import 'package:medibuddy/views/onboarding/onboarding_screen.dart';
import 'package:medibuddy/views/registration/client-registration.dart';
import 'package:medibuddy/views/registration/customtextfield.dart';
import 'package:medibuddy/views/registration/rounded_button.dart';
import 'package:medibuddy/views/registration/seller-registration.dart';
import 'package:medibuddy/views/seller/add_medicine.dart';

void main() {
  testWidgets('Onboarding Screen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: OnboardingScreen()));
    expect(find.byType(OnboardingScreen), findsOneWidget);
  });

  testWidgets('Client Registration', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ClientRegistration()));
    expect(find.byType(ClientRegistration), findsOneWidget);
  });

  testWidgets('Seller Registration', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SellerRegistration()));
    expect(find.byType(SellerRegistration), findsOneWidget);
  });

  testWidgets('Login Screen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));
    expect(find.byType(LoginScreen), findsOneWidget);
  });

  testWidgets('Add Medicine', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AddMedicine()));
    expect(find.byType(AddMedicine), findsOneWidget);
  });

}
