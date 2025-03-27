import 'dart:io';

void main() {
  List<List<String>> theater = List.generate(5, (_) => List.filled(5, 'E'));
  Map<String, String> bookingDetails = {};

  while (true) {
    print('\nWelcome To Our Theater');
    print('press 1 to book a new seat\n'
      'press 2 to show the theater seats\n'
      'press 3 to show users data\n'
      'press 4 to exit');

    stdout.write('');
    String? choice = stdin.readLineSync();

    if (choice == '1') bookSeat(theater, bookingDetails);
    else if (choice == '2') showSeats(theater);
    else if (choice == '3') showUsers(bookingDetails);
    else if (choice == '4') break;
    else print('Invalid input, try again.');
  }
  print('"See You Back"');
}

void bookSeat(List<List<String>> theater, Map<String, String> details) {
  stdout.write('Enter row (1-5) or exit: ');
  String? rowInput = stdin.readLineSync();
  if (rowInput == 'exit') return;

  int row = int.tryParse(rowInput ?? '') ?? 0, col;
  if (row < 1 || row > 5) return print('Invalid row.');

  stdout.write('Enter column (1-5): ');
  col = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  if (col < 1 || col > 5) return print('Invalid column.');

  if (theater[row - 1][col - 1] == 'B') return print('Seat taken.');

  stdout.write('Enter name: ');
  String name = stdin.readLineSync() ?? '';
  stdout.write('Enter phone: ');
  String phone = stdin.readLineSync() ?? '';

  theater[row - 1][col - 1] = 'B';
  details['$row,$col'] = '$name - $phone';
  print('Seat booked!');
}

void showSeats(List<List<String>> theater) {
  print('\nTheater Seats:');
  theater.forEach((row) => print(row.join(' ')));
}

void showUsers(Map<String, String> details) {
  if (details.isEmpty) return print('No bookings.');
  print('\nUsers Booking Details:');
  details.forEach((seat, info) => print('Seat $seat: $info'));
}
