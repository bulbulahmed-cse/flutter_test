import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_task/app/widgets/show_message.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as p;
import '../utils/app_constant.dart';
import '../utils/url.dart';

enum Method { POST, GET,PUT,DELETE,PATCH }



class ApiClient{
  List<Dio> clients = [];

  Map<String,String> headerWithAuth() => {
    "Accept": "application/json",
    //'Authorization':'Bearer $token'
  };

  Map<String,String> headerWithoutAuth() => {
    "Accept": "application/json",
  };


  void close(){
    for(int i=0; i<clients.length;i++){
      clients[i].close();
    }
    clients.clear();
  }

  Future Request({required String url,Method method=Method.GET,Map<String,dynamic>? body,List<String>? fileKey,List<File>? files,required Function onSuccess,required Function onError,bool enableShowError=true,bool withAuth=true})async{
    var option = BaseOptions(
        baseUrl: URL.baseUrl,
        headers: withAuth ? headerWithAuth() : headerWithoutAuth()
    );
    Dio client = Dio(option);

    clients.add(client);

    if(files!=null && files.isNotEmpty) {
      for (int i=0; i<files.length; i++){
        body![fileKey![i]] = await MultipartFile.fromFile(
          files[i].path,
          filename: files[i].path.split('/').last,
          contentType: MediaType("image",p.extension(files[i].path)),
        );
      }
    }

    try {
      Response response;
      if(method==Method.POST) {
        response = await client.post(url,data: body);
      }
      else if(method==Method.DELETE) {
        response = await client.delete(url);
      }
      else if(method==Method.PATCH) {
        response = await client.patch(url,data: body);
      }
      else {
        response = await client.get(url);
      }
      showData(url: '${client.options.baseUrl}$url',response: response.data,body: body,method: method,header: withAuth ? headerWithAuth() : headerWithoutAuth(),statusCode: response.statusCode!);
      var data;
      if(response.data.isNotEmpty) {
        data = response.data;
      } else {
        data = {
          AppConstant.status:'true'
        };
      }
      onSuccess(data);
    } on DioError catch (e, st) {
      int statusCode = e.response!.statusCode!;
      showData(url: '${client.options.baseUrl}$url',response: e.response!.data,body: body,method: method,header: withAuth ? headerWithAuth() : headerWithoutAuth(),statusCode: e.response!.statusCode!);
      if(statusCode == 401){
        ErrorMessage(message: "unauthenticated");
      } else if (statusCode == 200 || statusCode == 204 || statusCode == 201 || statusCode == 422 || statusCode == 400 || statusCode == 412) {
        var data;
        if(e.response?.data.isNotEmpty) {
          data = e.response?.data;
        } else {
          data = {
            AppConstant.status: true
          };
        }
        onSuccess(data);
      } else {
        if(enableShowError) {
          ErrorMessage(message: "Something Went Wrong");
        }
        onError({'error': "Something Went Wrong"});
      }
    } on TimeoutException catch (e) {
      if(enableShowError) {
        ErrorMessage(message: "Check Your Internet Connection");
      }
      onError({'error': "Check Your Internet Connection"});
    } on SocketException catch (e) {
      if(enableShowError) {
        ErrorMessage(message: "Check Your Internet Connection");
      }
      onError({'error': "Check Your Internet Connection"});
    } on Error catch (e) {
      if(enableShowError) {
        ErrorMessage(message: "Something Went Wrong");
      }
      onError({'error': "Something Went Wrong"});
    } catch(e){
      print(e);
    }
  }





  void showData({required String url, dynamic body,required dynamic header,required dynamic statusCode, required dynamic response,required dynamic method}) {
    if (kDebugMode) {
      print("URL = $url");
      print("Body = $body");
      print("Header = $header");
      print("Status Code = $statusCode");
      print("Method = $method");
      print("Response = $response");
    }
  }

}
