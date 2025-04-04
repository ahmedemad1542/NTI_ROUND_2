import 'dart:io';

class Seat {
  bool isBooked = false;
  String? name;
  String? phone;

  void book(String userName, String userPhone) {
    isBooked = true;
    name = userName;
    phone = userPhone;
  }

  @override
  String toString() {
    return isBooked ? 'B' : 'E';
  }

  String get bookingInfo => isBooked ? '$name - $phone' : 'Empty';
}

class Theater {
  List<List<Seat>> seats = List.generate(5, (_) => List.generate(5, (_) => Seat()));

  void bookSeat() {
    stdout.write('Enter row (1-5) or type "exit": ');
    String? rowInput = stdin.readLineSync();
    if (rowInput == 'exit') return;

    int row = int.tryParse(rowInput ?? '') ?? 0;
    if (row < 1 || row > 5) return print('Invalid row.');

    stdout.write('Enter column (1-5): ');
    int col = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
    if (col < 1 || col > 5) return print('Invalid column.');

    Seat seat = seats[row - 1][col - 1];
    if (seat.isBooked) return print('Seat already booked.');

    stdout.write('Enter name: ');
    String name = stdin.readLineSync() ?? '';
    stdout.write('Enter phone: ');
    String phone = stdin.readLineSync() ?? '';

    seat.book(name, phone);
    print('Seat booked successfully!');
  }

  void showSeats() {
    print('\nTheater Seat Map:');
    for (var row in seats) {
      print(row.map((seat) => seat.toString()).join(' '));
    }
  }

  void showBookingDetails() {
    print('\nBooking Details:');
    bool hasBookings = false;
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 5; j++) {
        if (seats[i][j].isBooked) {
          print('Seat ${i + 1},${j + 1}: ${seats[i][j].bookingInfo}');
          hasBookings = true;
        }
      }
    }
    if (!hasBookings) print('No bookings yet.');
  }
}

void main() {
  Theater theater = Theater();

  while (true) {
    print('\nWelcome To Our Theater');
    print('1. Book a seat');
    print('2. Show seat map');
    print('3. Show booking details');
    print('4. Exit');

    stdout.write('Choose an option: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        theater.bookSeat();
        break;
      case '2':
        theater.showSeats();
        break;
      case '3':
        theater.showBookingDetails();
        break;
      case '4':
        print('See You Back!');
        return;
      default:
        print('Invalid input, try again.');
    }
  }
}
