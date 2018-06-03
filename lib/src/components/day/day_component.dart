import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:schedule_web_client/src/components/date/date_component.dart';
import 'package:schedule_web_client/src/components/lesson/lesson_component.dart';
import 'package:schedule_web_client/src/models/day.dart';

@Component(
  selector: 'day',
  styleUrls: const ['day_component.css'],
  templateUrl: 'day_component.html',
  directives: const [
    CORE_DIRECTIVES,
    materialDirectives,
    LessonComponent,
    DateComponent
  ],
  providers: const [],
)
class DayComponent implements OnInit {
  @Input()
  Day day;

  @override
  ngOnInit() {}
}
