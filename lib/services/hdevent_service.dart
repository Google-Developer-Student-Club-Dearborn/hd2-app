import 'package:hd2_app/constants/hd_constants.dart';
import 'package:hd2_app/models/HDEvent.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HDEventsService {
  static Future<bool> shouldShowWelcomeNotification() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.clear();
    final bool hasShownNotification =
        prefs.getBool('hasShownNotification') ?? false;
    return !hasShownNotification;
  }

  static Future<void> markWelcomeNotificationAsShown() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasShownNotification', true);
  }

  List<HDEvent> getEvents() {
    final List<HDEvent> hdevents = <HDEvent>[];

    const year = HDConstants.year;
    const month = HDConstants.month;
    const day1 = HDConstants.day_1;
    const day2 = HDConstants.day_2;

    // Check-in
    hdevents.add(
      HDEvent(
        'Check-in Starts',
        DateTime(year, month, day1, 10),
        DateTime(year, month, day1, 10),
        const Color.fromARGB(255, 73, 23, 188),
        false,
        "Check in at UC front desk.\n\nProfessional headshots in Kochoff Hall A.",
        0,
      ),
    );

    // Sponsor-Fair
    hdevents.add(
      HDEvent(
        'Sponsor Fair',
        DateTime(year, month, day1, 10),
        DateTime(year, month, day1, 11, 15),
        const Color.fromARGB(255, 73, 23, 188),
        false,
        "Description: Sponsor recruiter representatives will have booths in the UC Entrance to discuss what their company does, internship/co-op and full-time opportunities and their unique software solutions. In Kochoff A, sponsor technical representatives will present their software APIs along with students and partners presenting their innovative projects.\n\nInstruction: Interact with recruiters and technical sponsor representatives alike by stopping by each booth. Make sure to pick up some swag from the sponsors!",
        1,
      ),
    );

    // Opening Ceremony
    hdevents.add(
      HDEvent(
        'Opening Ceremony',
        DateTime(year, month, day1, 11, 15),
        DateTime(year, month, day1, 12),
        const Color.fromARGB(255, 73, 23, 188),
        false,
        "Location: Kochoff Hall B & C\n\nDescription: Welcome to Hack Dearborn! Are you ready to disrupt reality? We will introduce you to our tracks, prizes, MLH-sponsored prizes and sponsored challenge statements during this opening ceremony. Keynote speakers from different companies will give brief presentations to introduce the hackathon as well.\n\nInstruction: Make your way to Kochoff B and C and find a seat. Keep your eye out for some hidden raffle prize opportunities.",
        2,
      ),
    );

    // Hacking Starts
    hdevents.add(
      HDEvent(
        'Hacking Starts',
        DateTime(year, month, day1, 12),
        DateTime(year, month, day1, 12),
        const Color.fromARGB(255, 73, 23, 188),
        false,
        "Description:  Hacking. Begins. Now. If you have a team, go grab lunch! If you don’t, stick around and find a technical mentor or a Hack Dearborn organizer and we’ll help you out!",
        3,
      ),
    );

    // Lunch & team formation
    hdevents.add(
      HDEvent(
        'Lunch',
        DateTime(year, month, day1, 12),
        DateTime(year, month, day1, 13),
        const Color.fromARGB(255, 73, 23, 188),
        false,
        "Location: McKinley Café\n\nDescription: Line up at the McKinley Cafe for some tasty lunch before you start your hardcore hacking. You can also use this lunch as an opportunity to brainstorm with your team! If you need help, find an organizer!",
        4,
      ),
    );

    // Technical Mentor Tables
    hdevents.add(
      HDEvent(
        'Technical Mentor Tables',
        DateTime(year, month, day1, 13),
        DateTime(year, month, day1, 14),
        const Color.fromARGB(255, 73, 23, 188),
        false,
        "Location: UC Dining Hallr\n\nDescription: Need guidance on your project idea? Step right up to the Dining Hall and an organizer will match you to the best sponsor representative. You can discuss your ideas with them for as long as you need to!",
        5,
      ),
    );

    // Workshops
    hdevents.add(
      HDEvent(
        'Workshops',
        DateTime(year, month, day1, 14),
        DateTime(year, month, day1, 15),
        const Color.fromARGB(255, 73, 23, 188),
        false,
        "Location: UC 1225 & 1227\n\nDescription: Join us at room 1225 and 1227 for cool workshops that will help you with your project! Please choose one workshop to attend. P.S: You’ll get a raffle ticket if you stay til the end.",
        6,
      ),
    );

    // Workshops
    hdevents.add(
      HDEvent(
        'Workshops',
        DateTime(year, month, day1, 16),
        DateTime(year, month, day1, 17),
        const Color.fromARGB(255, 73, 23, 188),
        false,
        "Location: UC 1225 & 1227\n\nDescription: Join us at room 1225 and 1227 for cool workshops that will help you with your project! Please choose one workshop to attend. P.S: You’ll get a raffle ticket if you stay til the end.",
        7,
      ),
    );

    // Games and Activities
    hdevents.add(
      HDEvent(
        'Ju-Jitsu Workshop',
        DateTime(year, month, day1, 17),
        DateTime(year, month, day1, 18),
        const Color.fromARGB(255, 73, 23, 188),
        false,
        "Description: Want a brain break from your super awesome but also super difficult project? Join us at the UC stage for a fun Ju-Jitsu workshop!\n\nPlease fill out the waiver form, which can be found in the Jit Jitsu info card.",
        8,
      ),
    );

    // Dinner
    hdevents.add(
      HDEvent(
        'Dinner',
        DateTime(year, month, day1, 19),
        DateTime(year, month, day1, 20),
        const Color.fromARGB(255, 73, 23, 188),
        false,
        "Description: It’s time to line up again at the McKinley Cafe for some tasty dinner to celebrate a day of hard work.",
        9,
      ),
    );

    // MLH Challenge
    hdevents.add(
      HDEvent(
        'MLH Challenge',
        DateTime(year, month, day1, 20),
        DateTime(year, month, day1, 21),
        const Color.fromARGB(255, 73, 23, 188),
        false,
        "Location:UC 1225\n\nDescription: MLH is a proud partner of Hack Dearborn! We’d like to offer a friendly game of Cup Stacking, brought to you by MLH.",
        10,
      ),
    );

    // Entry Closed
    hdevents.add(
      HDEvent(
        'Entry Closed',
        DateTime(year, month, day1, 23),
        DateTime(year, month, day1, 23),
        const Color.fromARGB(255, 73, 23, 188),
        false,
        "Description: The doors must be locked from the outside at this time for safety reasons. You can still exit the building, but no one can enter without letting an organizer know after this time.",
        11,
      ),
    );

    // Day 2

    // Midnight Snack + Game
    hdevents.add(
      HDEvent(
        'Midnight Snack + Game',
        DateTime(year, month, day2),
        DateTime(year, month, day2),
        const Color.fromARGB(255, 188, 23, 141),
        false,
        "Location: McKinley Café\n\nDescription: Everyone needs a midnight brain break! Join us for some fluffy pink and blue cotton candy and an interesting game.",
        12,
      ),
    );

    // Doors Reopen
    hdevents.add(
      HDEvent(
        'Doors Reopen',
        DateTime(year, month, day2, 7),
        DateTime(year, month, day2, 7),
        const Color.fromARGB(255, 188, 23, 141),
        false,
        "Description: We’re back! Doors are officially open from the outside and please stop back at registration so we can check you in for the day, especially if you are demoing.",
        13,
      ),
    );

    // Breakfast
    hdevents.add(
      HDEvent(
        'Breakfast',
        DateTime(year, month, day2, 8),
        DateTime(year, month, day2, 9),
        const Color.fromARGB(255, 188, 23, 141),
        false,
        "Location: McKinley Café\n\nDescription: It’s that time again… line up at the McKinley Cafe for some tasty breakfast to get you energized for the final few hours of hacking left.",
        14,
      ),
    );

    // Demoing for Dummies
    hdevents.add(
      HDEvent(
        'Demoing for Dummies',
        DateTime(year, month, day2, 9, 30),
        DateTime(year, month, day2, 10, 30),
        const Color.fromARGB(255, 188, 23, 141),
        false,
        "Location: UC 1225\n\nDescription: Are you a newbie or have you not used DevPost in a while? Attend this workshop so you have no issues during the demoing process and so you can be stress-free!",
        15,
      ),
    );

    // Hacking Ends
    hdevents.add(
      HDEvent(
        'Hacking Ends!',
        DateTime(year, month, day2, 12),
        DateTime(year, month, day2, 12),
        const Color.fromARGB(255, 188, 23, 141),
        false,
        "Description: Time is officially up! Are you ready for it? Of course you are. Go eat some lunch!",
        16,
      ),
    );

    // Lunch
    hdevents.add(
      HDEvent(
        'Lunch',
        DateTime(year, month, day2, 12),
        DateTime(year, month, day2, 13),
        const Color.fromARGB(255, 188, 23, 141),
        false,
        "Location: McKinley Café\n\nDescription: Okay we promise this is the last time you have to line up at the McKinley Cafe for some tasty lunch to get you through the judging process.",
        17,
      ),
    );

    // Hacker Set Up
    hdevents.add(
      HDEvent(
        'Hacker Set Up',
        DateTime(year, month, day2, 13),
        DateTime(year, month, day2, 13, 30),
        const Color.fromARGB(255, 188, 23, 141),
        false,
        "Location: UC Entrace Hallway\n\nDescription: See those tables in the UC entrance? Find an organizer and they will assign you one. Start setting up, maybe do a test run and make sure everything is smooth. You got 30 min left!",
        18,
      ),
    );

    // Judging
    hdevents.add(
      HDEvent(
        'Judging',
        DateTime(year, month, day2, 13, 30),
        DateTime(year, month, day2, 14, 30),
        const Color.fromARGB(255, 188, 23, 141),
        false,
        "Location: UC Entrace Hallway\n\nDescription: You know what to do. Impress the judges with your amazing project! Be confident and really sell it!",
        19,
      ),
    );

    // Game
    hdevents.add(
      HDEvent(
        'MLH Game',
        DateTime(year, month, day2, 14, 30),
        DateTime(year, month, day2, 15),
        const Color.fromARGB(255, 188, 23, 141),
        false,
        "Location: UC Stage\n\nDescription: Anxiously waiting for the results? So are we. But, we have numbers to crunch so enjoy a fun game of cup stacking to ease your soul at the UC stage.",
        20,
      ),
    );

    // Closing Ceremony
    hdevents.add(
      HDEvent(
        'Closing Ceremony',
        DateTime(year, month, day2, 15),
        DateTime(year, month, day2, 15, 45),
        const Color.fromARGB(255, 188, 23, 141),
        false,
        "Location: ELB Atrium\n\nDescription: It’s time to find out who disrupted reality and who just…delayed it. We will be announcing our winners and the MLH winners, having a final keynote speech and thanking everyone for coming and making this event the best it’s ever been! #Hack Dearborn #IDisruptedReality (use this hashtag to post about our event on 	social media!)",
        21,
      ),
    );

    return hdevents;
  }

  List<HDEvent> getEventReminders() {
    final List<HDEvent> hdevents = <HDEvent>[];

    // hdevents.add(
    //   HDEvent(
    //     'Welcome to HackDearborn 2!',
    //     DateTime.now().add(const Duration(minutes: 10, seconds: 50)),
    //     DateTime.now().add(const Duration(seconds: 60)),
    //     Colors.blue,
    //     false,
    //     "🚀 Get ready to challenge norms, push boundaries, and bring your wildest ideas to life. Happening on October 21!",
    //     80,
    //   ),
    // );

    hdevents.add(
      HDEvent(
        'Get Ready to Disrupt Reality!',
        DateTime(
            HDConstants.year, HDConstants.month - 1, HDConstants.day_1, 20),
        DateTime(HDConstants.year, HDConstants.month - 1, HDConstants.day_1),
        Colors.blue,
        false,
        'Stay tuned for more updates and prepare for an unforgettable hackathon experience! Happening on October 21.',
        81,
      ),
    );

    hdevents.add(
      HDEvent(
        'HackDearborn 2 is Just Around the Corner!',
        DateTime(HDConstants.year, HDConstants.month, 7, 12),
        DateTime(HDConstants.year, HDConstants.month, HDConstants.day_1),
        Colors.blue,
        false,
        "Only 2 weeks left until HackDearborn 2! Are you ready to disrupt reality? Sharpen your skills, gather your team, and prepare for an exhilarating hackathon adventure. ",
        82,
      ),
    );

    hdevents.add(
      HDEvent(
        'One Week to Go! Are You Prepared?',
        DateTime(HDConstants.year, HDConstants.month, 14, 12),
        DateTime(HDConstants.year, HDConstants.month, HDConstants.day_1),
        Colors.blue,
        false,
        'The countdown is on! In just one week, HackDearborn 2 will unleash a wave of innovation. Fine-tune your ideas and get ready to challenge the boundaries of reality!',
        83,
      ),
    );

    hdevents.add(
      HDEvent(
        'Just 2 Days Left! Get Set for HackDearborn 2!',
        DateTime(
            HDConstants.year, HDConstants.month, HDConstants.day_1 - 2, 19),
        DateTime(HDConstants.year, HDConstants.month, HDConstants.day_1),
        Colors.blue,
        false,
        'The excitement is palpable! With only 2 days remaining, HackDearborn 2 is about to redefine reality. Double-check your arrangements and get ready to turn your visions into reality!',
        84,
      ),
    );

    hdevents.add(
      HDEvent(
        'It\'s Showtime Tomorrow! Rest Up for HackDearborn 2!',
        DateTime(
            HDConstants.year, HDConstants.month, HDConstants.day_1 - 1, 20),
        DateTime(HDConstants.year, HDConstants.month, HDConstants.day_1),
        Colors.purple,
        false,
        'The night before HackDearborn 2 is here! Take a deep breath, relax, and recharge your energy. An incredible hackathon journey awaits you. See you all tomorrow!',
        85,
      ),
    );

    hdevents.add(
      HDEvent(
        'Good morning hackers!',
        DateTime(HDConstants.year, HDConstants.month, HDConstants.day_1, 6),
        DateTime(HDConstants.year, HDConstants.month, HDConstants.day_1),
        Colors.purple,
        false,
        'HackDearborn 2 is happening today. Get ready to Disrupt Reality!',
        86,
      ),
    );
    return hdevents;
  }

  List<HDEvent> getAllEvents() {
    final List<HDEvent> events = getEvents();
    final List<HDEvent> eventReminders = getEventReminders();
    final List<HDEvent> allEvents = [...events, ...eventReminders];
    return allEvents;
  }

/*
  the notifications are fired 10 mins before the scheduled start time of the event
  so get the events even before their scheduled time if the notification time (10 minutes before the event) has already passed
*/
  List<HDEvent> getFilteredEvents() {
    final DateTime currentDate = DateTime.now();
    final List<HDEvent> events = getAllEvents();
    final List<HDEvent> filteredEvents = events.where((event) {
      DateTime notificationTime = event.from
          .subtract(const Duration(minutes: HDConstants.notificationOffset));
      return notificationTime.isBefore(currentDate) ||
          event.from.isBefore(currentDate) ||
          event.from.isAtSameMomentAs(currentDate);
    }).toList();

    return filteredEvents.reversed.toList();
  }
}

class HDEventsSource extends CalendarDataSource {
  HDEventsSource(List<HDEvent> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}
