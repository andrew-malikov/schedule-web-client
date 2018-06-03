import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'package:schedule_web_client/src/components/schedule/schedule_component.dart';
import 'package:schedule_web_client/src/models/day.dart';
import 'package:schedule_web_client/src/models/group.dart';
import 'package:schedule_web_client/src/services/group_service.dart';
import 'package:schedule_web_client/src/services/schedule_service.dart';

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: const [materialDirectives, ScheduleComponent],
  providers: const [materialProviders, ScheduleService, GroupService],
)
class AppComponent implements OnInit {
  ScheduleService _scheduleService = new ScheduleService();
  GroupService _groupService = new GroupService();

  List<Day> days;
  Group group;

  @override
  ngOnInit() {
    _setUpModels();
  }

  Future _setUpModels() async {
    group = await _groupService.group();
    days = (await _scheduleService.schedule(group.id)).days;
  }
}
