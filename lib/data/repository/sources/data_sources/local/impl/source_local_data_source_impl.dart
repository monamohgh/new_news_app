//todo:source local ds=>impl
import 'package:hive_ce/hive.dart';
import 'package:news_app/api/model/source/source_response.dart';
import 'package:news_app/data/repository/sources/data_sources/local/source_local_data_source.dart';

class SourceLocalDataSourceImpl implements SourceLocalDataSource {
  @override
  Future<SourceResponse> getSources(String categoryId)async {
    //todo: open box
    var box=await Hive.openBox('Sources');
    //todo:get data
    // var data=SourceResponse.fromJson(box.get('source_tab'));///Map=>object
    var data=box.get(categoryId);
    return data;
  }

  @override
  void saveSources(SourceResponse sourceResponse,String categoryId) async{
    //todo: open box
   var box=await Hive.openBox('Sources');
   //todo:save data
   //  await box.put('source_tab', sourceResponse.toJson());///Map=>hive understand map but do not understand SourceResponse
   await box.put(categoryId, sourceResponse);
    //todo:close box
    await box.close();
  }
}