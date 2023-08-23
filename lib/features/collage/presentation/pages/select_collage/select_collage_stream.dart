import 'package:rxdart/rxdart.dart';

import '../../../../../core/injections/service_locator.dart';
import '../../../../../core/storage/storage_service.dart';
import '../../../data/local/data_sources/collage_locale.dart';
 const selectedCollageKey = '--selected-collage-key--';

class SelectCollageStream {
  SelectCollageStream();


  static final IStorageService _storageService = sl();

  final _collageStream = BehaviorSubject<String?>.seeded(
    _storageService.getString(selectedCollageKey),
  );

  Stream<String?> get collageStream => _collageStream.stream;

  String? selectedCollage() => _collageStream.value;

  set setCollageStream(String collageId) {
    _collageStream.add(collageId);
    _storageService.setString(selectedCollageKey, collageId);
  }
 void resetCollageStream(){
    _collageStream.add(null);
    _storageService.setString(selectedCollageKey, null);
  }
}
