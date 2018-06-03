import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:schedule_web_client/src/models/lesson.dart';

@Component(
  selector: 'lesson',
  styleUrls: const ['lesson_component.css'],
  templateUrl: 'lesson_component.html',
  directives: const [
    CORE_DIRECTIVES,
    materialDirectives,
  ],
  providers: const [],
)
class LessonComponent implements OnInit {
  @Input()
  Lesson lesson;

  @override
  ngOnInit() {
    
  }
}
