import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../ui/vms/view_model_app.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => ViewModelApp()),
];
