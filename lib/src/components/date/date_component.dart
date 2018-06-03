import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:schedule_web_client/src/models/date.dart';

@Component(
  selector: 'date',
  styleUrls: const ['date_component.css'],
  templateUrl: 'date_component.html',
  directives: const [
    CORE_DIRECTIVES,
    materialDirectives,
  ],
  providers: const [],
)
class DateComponent implements OnInit {
  @Input()
  Date date;

  String get formatedDate {
    var result = "";
    if (date != null) result = "${date.day}.${date.month}.${date.year}";
    return result;
  }

  @override
  ngOnInit() {}
}
