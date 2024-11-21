import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../core/utiles/constans.dart';
import 'confirmation2.dart';

class PlaystationSubscribe extends StatefulWidget {
  const PlaystationSubscribe({super.key});
  @override
  State<PlaystationSubscribe> createState() => _PlaystationSubscribeState();
}

class _PlaystationSubscribeState extends State<PlaystationSubscribe> {
  DateTime today = DateTime.now();
  DateTime? selectedDay;
  final DateTime initialFocusedDay = DateTime.now();
  TimeOfDay? selectedTime;

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    if (day.isAfter(today.subtract(const Duration(days: 1))) ||
        day.isAtSameMomentAs(today)) {
      setState(() {
        if (selectedDay != null && selectedDay!.isAtSameMomentAs(day)) {
          selectedDay = null;
        } else {
          selectedDay = day;
        }
      });
    }
  }

  void _onTimeSelected(TimeOfDay time) {
    setState(() {
      selectedTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_forward_sharp,
              color: Colors.white,
              size: screenWidth * 0.05,
            ),
          ),
        ],
        backgroundColor: const Color(0xff302F2D),
        title: Text(
          'حجز بلايستيشن',
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.04,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: ListView(
          children: [
            Text(
              'حجز اليوم',
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.04,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Container(
              width: screenWidth,
              height: screenWidth * 0.12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                color: Color(0xFF333333),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.02),
                    child: Icon(
                      Icons.calendar_month,
                      color: KprimaryColor,
                      size: screenWidth * 0.05,
                    ),
                  ),
                  const Spacer(flex: 1),
                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.02),
                    child: Text(
                      selectedDay != null
                          ? '${selectedDay!.day}/${selectedDay!.month}/${selectedDay!.year}'
                          : 'لم يتم حجز أي موعد',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                color: const Color(0xFF333333),
              ),
              child: TableCalendar(
                focusedDay: initialFocusedDay,
                selectedDayPredicate: (day) =>
                selectedDay != null && day.isAtSameMomentAs(selectedDay!),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleTextStyle: TextStyle(
                      color: KprimaryColor,
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w400),
                ),
                calendarStyle: CalendarStyle(
                  selectedDecoration: const BoxDecoration(
                    color: KprimaryColor,
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Colors.grey[800],
                    shape: BoxShape.circle,
                  ),
                  defaultTextStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  weekendTextStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  outsideTextStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  disabledTextStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                firstDay: today.subtract(const Duration(days: 365 * 10)),
                lastDay: DateTime.utc(2030, 10, 15),
                onDaySelected: _onDaySelected,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'الوقت المتاح لهذا اليوم',
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.04,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Container(
              width: double.infinity,
              height: screenWidth * 0.12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                color: Color(0xFF333333),
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildTimeOption(context, TimeOfDay(hour: 9, minute: 0)),
                  _buildTimeOption(context, TimeOfDay(hour: 10, minute: 0)),
                  _buildTimeOption(context, TimeOfDay(hour: 11, minute: 0)),
                  _buildTimeOption(context, TimeOfDay(hour: 12, minute: 0)),
                  _buildTimeOption(context, TimeOfDay(hour: 13, minute: 0)),
                  _buildTimeOption(context, TimeOfDay(hour: 14, minute: 0)),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Container(
              width: screenWidth,
              height: screenWidth * 0.12,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: KprimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {
                  print("Selected Day: $selectedDay"); // Debugging
                  print("Selected Time: $selectedTime"); // Debugging

                  if (selectedDay != null && selectedTime != null) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PlaystationConfirmation(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'لم يتم حجز أي موعد',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.right, // لجعل الكتابة على اليمين
                        ),
                        backgroundColor: Colors.red, // لجعل الخلفية باللون الأحمر
                      ),
                    );

                  }
                },
                child: Text(
                  'تاكيد',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeOption(BuildContext context, TimeOfDay time) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    final bool isSelected = selectedTime != null &&
        time.hour == selectedTime!.hour &&
        time.minute == selectedTime!.minute;

    return GestureDetector(
      onTap: () => _onTimeSelected(time),
      child: Container(
        width: screenWidth * 0.15,
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screenWidth * 0.02),
          color: isSelected ? KprimaryColor : Colors.grey[800],
        ),
        alignment: Alignment.center,
        child: Text(
          '${time.hour}:${time.minute.toString().padLeft(2, '0')}',
          style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w400
          ),
        ),
      ),
    );
  }
}
