import 'package:flutter/material.dart';
import 'package:launch_pal/src/models/launch.dart';
import 'package:launch_pal/src/models/launch_reminder.dart';
import 'package:launch_pal/src/resources/launch_reminder_repository.dart';

class LaunchReminderBell extends StatefulWidget {
  final Launch _launch;

  LaunchReminderBell(this._launch);

  @override
  State<StatefulWidget> createState() {
    return _LaunchReminderBellState();
  }
}

class _LaunchReminderBellState extends State<LaunchReminderBell> {
  final LaunchReminderRepository _launchReminderRepository;
  LaunchReminder _launchReminder;

  _LaunchReminderBellState()
      : _launchReminderRepository = new LaunchReminderRepository();

  @override
  void initState() {
    super.initState();
    _launchReminderRepository.findForLaunch(widget._launch.id).then((data) {
      setState(() {
        _launchReminder = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    if (_launchReminder == null) {
      return IconButton(
        icon: Icon(Icons.notifications_none, color: primaryColor),
        onPressed: () async {
          var launchReminder = await _launchReminderRepository.create(
              LaunchReminder(
                  launchId: widget._launch.id, net: widget._launch.net));
          setState(() {
            _launchReminder = launchReminder;
          });
        },
      );
    } else {
      return IconButton(
        icon: Icon(Icons.notifications_active, color: primaryColor),
        onPressed: () async {
          await _launchReminderRepository.delete(_launchReminder);
          setState(() {
            _launchReminder = null;
          });
        },
      );
    }
  }
}
