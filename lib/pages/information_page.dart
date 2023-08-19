import 'package:flutter/material.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:hd2_app/components/checkbox_list.dart';
import 'package:hd2_app/pages/cards/displayCard.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/scheduler.dart';

import 'agenda_page/filtermenu.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final List<String> checklist = [
    'Make sure you are registered (You should have gotten a confirmation email)',
    'Pack Essentials - Here is a Great List!',
    'Confirm transportation to venue',
    'Brainstorm ideas for hacks + which track your idea is most similar to',
    'Think about which workshops you are most interested in or your goals for this hackathon',
    'Arrive at 10am on Saturday, October 21st to the University Center at UM-Dearborn',
    'Pack your laptop, charger, toothbrush/toothpaste, deodorant, sleeping bag & (student) ID!',
  ];

  final List<bool> checkedItems = List.filled(7, false);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      DisplayCard(
        onTap: () {
          context.pushTransparentRoute(
            DismissiblePage(
              onDismissed: () {
                Navigator.of(context).pop();
              },
              direction: DismissiblePageDismissDirection.down,
              isFullScreen: false,
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Hero(
                        tag: 'tag1',
                        child: Image.asset(
                          'assets/checklist.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Hero(
                          tag: "tag2",
                          child: Text(
                            'Checklist Before You Arrive',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CheckboxListWidget(
                          onFilterChanged: (List<bool> isCheckedList) {},
                          titles: const [
                            'Make sure you are registered (you should have gotten a confirmation email).',
                            'Pack Essentials: laptop, phone, chargers, toothbrush/toothpaste, deodorant, change of clothes, sleeping bag and Identification (Student ID & Drivers License).',
                            'Update OS, IDEs, and all other required software',
                            'Confirm transportation to venue.',
                            'Brainstorm ideas for hacks + which track your idea is most similar to.',
                            'Think about which workshops you are most interested in or your goals for this hackathon',
                            'Arrive at 10am on Saturday, October 21st to the University Center at UM-Dearborn.',
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        image: 'assets/checklist.jpg',
        data: 'Checklist Before You Arrive',
      ),
      DisplayCard(
        onTap: () {
          context.pushTransparentRoute(
            DismissiblePage(
              onDismissed: () {
                Navigator.of(context).pop();
              },
              direction: DismissiblePageDismissDirection.down,
              isFullScreen: false,
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Hero(
                        tag: 'tag1',
                        child: Image.asset(
                          'assets/parking.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Hero(
                          tag: "tag2",
                          child: Text(
                            'Where To Park',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const Text(
                              "Parking is free and is available right outside of the James C. Renick University Center. The address is:\n",
                            ),
                            InkWell(
                              child: const Text(
                                'University Center, 4901 Evergreen Rd, Dearborn, MI 48128',
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              onTap: () => launchUrl(Uri.parse(
                                  'https://goo.gl/maps/5SU5bNhFPrqMk2FU8')),
                            ),
                            const Text(
                              "\nThere will be poster signs placed outside throughout campus to help navigate during the hackathon weekend!",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        image: 'assets/parking.png',
        data: 'Where To Park',
      ),
      DisplayCard(
          onTap: () {
            context.pushTransparentRoute(
              DismissiblePage(
                onDismissed: () {
                  Navigator.of(context).pop();
                },
                direction: DismissiblePageDismissDirection.down,
                isFullScreen: false,
                child: Scaffold(
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Hero(
                          tag: 'tag1',
                          child: Image.asset(
                            'assets/tracks.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Hero(
                            tag: "tag2",
                            child: Text(
                              'Hackathon Tracks',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: DataTable(
                            dataRowHeight: 120.0,
                            columns: const [
                              DataColumn(
                                  label: Text('Track',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('Description',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                            ],
                            rows: const [
                              DataRow(
                                cells: [
                                  DataCell(Text('Automotive Future')),
                                  DataCell(Text(
                                      'Create a solution to a futuristic automotive issue: self-driving vehicles, smart mobility and connectivity.')),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(Text('Financial Inclusion')),
                                  DataCell(Text(
                                      'Hackers will address the issue of inequitable access to financial services. Topics include: financial literacy, consumer protection, inclusivity and affordability.')),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(Text('Education')),
                                  DataCell(Text(
                                      'Hackers will create a project that they think improves education. Possible issues are the digital divide, learning inequalities, and much more.')),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(Text('Health & Wellness')),
                                  DataCell(Text(
                                      'To address issues such as healthy food consumption and mental health, hackers will develop digital solutions.')),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          image: 'assets/tracks.jpg',
          data: "Hackathon Tracks"),
      DisplayCard(
        onTap: () {
          context.pushTransparentRoute(
            DismissiblePage(
              onDismissed: () {
                Navigator.of(context).pop();
              },
              direction: DismissiblePageDismissDirection.down,
              isFullScreen: false,
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Hero(
                        tag: 'tag1',
                        child: Image.asset(
                          'assets/mentor.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Hero(
                          tag: "tag2",
                          child: Text(
                            'Technical Mentors',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                              "A special shoutout to our technical mentors that stay back for hours helping you code and develop your project. This year we will have a mix of software and hardware mentors again to help you create an amazing project within the timeframe.\n\nNew to this is year is a technical mentor tables, which will be the helpful version of helpdesk.\n\nThere will always be someone to assist you if your are stuck on a bug, looking for project advice or just want to talk through your code.\n\nhere will also be technical mentors walking around with neon green lanyards, feel free to stop them and ask them about your project!")),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        image: "assets/mentor.jpg",
        data: "Technical Mentors",
      ),
      DisplayCard(
          onTap: () {
            context.pushTransparentRoute(
              DismissiblePage(
                onDismissed: () {
                  Navigator.of(context).pop();
                },
                direction: DismissiblePageDismissDirection.down,
                isFullScreen: false,
                child: Scaffold(
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Hero(
                          tag: 'tag1',
                          child: Image.asset(
                            'assets/judge.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Hero(
                            tag: "tag2",
                            child: Text(
                              'About Judging',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              const Text(
                                "Your group will be given 5 mins to pitch to multiple judges as they stop by to evaluate your presentations, science-fair style.\n\nYour presentation will include an overview of the project you created in the past 24 hours, preferably a live or recorded demo, and the track you chose. You can use any material to convey your message. We recommend having slides presented on your laptop through the presentation.\n",
                              ),
                              InkWell(
                                child: const Text(
                                  'View the full rubric here.',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                onTap: () => launchUrl(Uri.parse(
                                    'https://drive.google.com/file/d/1W5eDNCVru1EHIgIXN2jPjZG4PHrdJM8e/view')),
                              ),
                              const Text(
                                "\nHackDeaborn will host a workshop on ‘How to Demo for Dummies’ Sunday Oct 22, 2023 before judging to help prepare you for project submission on devpost and what judges are looking for in a demo.\n\nTip: Don't forget to bring headphones if your project has an audio component. Lastly, to take into consideration variability, we are using an ELO rating system.\n",
                              ),
                              InkWell(
                                child: const Text(
                                  'Read about it here.',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                onTap: () => launchUrl(Uri.parse(
                                    'https://lichess.org/@/CheckRaiseMate/blog/how-elo-ratings-actually-work/J8UZThlO')),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          image: 'assets/judge.jpg',
          data: "About Judging")
    ]));
  }
}
