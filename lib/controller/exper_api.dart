import 'package:http/http.dart'as http;
import 'dart:convert';
class ExperApi{

 static GetBusinessId()async{
    
    var res = await http.get(Uri.parse("https://svpos.smartqr.app/connector/api/user/loggedin"),
    headers: {
      "Accept": "application/json",
    "Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjYwODFjOWM5YWJjYzYyNGQxOWExZTBjMGJlMjQxYWE0Mjg5ZDRhODM0ZTNiNTU2NTlmZDRlNzNlNTMwODZhOWQzZWRlNjg3NzFhYjgxNTZjIn0.eyJhdWQiOiIxNSIsImp0aSI6IjYwODFjOWM5YWJjYzYyNGQxOWExZTBjMGJlMjQxYWE0Mjg5ZDRhODM0ZTNiNTU2NTlmZDRlNzNlNTMwODZhOWQzZWRlNjg3NzFhYjgxNTZjIiwiaWF0IjoxNjQ3MTc4MzcwLCJuYmYiOjE2NDcxNzgzNzAsImV4cCI6MTY3ODcxNDM3MCwic3ViIjoiMSIsInNjb3BlcyI6W119.K8ybAhe_nHNNwGbOfUx2V5-PO0ADxXFhB_szGlKEnd3L4CAD2pobrc50toQfByUUB98GXGRjkmzb7sQWO8MYz_X2qzUFmoQSzbQ_6rmJF1dF4E6SeWK7KhJYjy3aikEsOH5_sJAwuyQacXla0EnEGnV8Yv0XA0d85dmMCfZy7pGQf2AApkU3UHoFOq2AqnaNrJK6HgsVK4rkW-s4wuMdApd5y-CYIsWFQ9g1jGMU_WTFl7m152vuDpjCHtG-RbrnxRUdbdCqfK1buRVBZBwRNeCykCq9zAy3PtX3jUiV8qPLbGu1IhvALVGboDGmzfIsR61fDMuXXoRGYI32lVNm0MF7qEWV5DhNMigKFLGTS0dUgsga-1ETzzGCumhFYzGDr6gIGnUO4eZxHpwJy1BVIaaLKhzuO_ieiF-Jrbqtd3O51NNQqcpV8znW-gJi2KZkh2geeAvVUOK40nzlD5uXFGi5p0BYewzbziDLleWGizMuUEWNQBF13fPtNX9w4tFi2S3bl0drE5H9whQHz4Cs3vUTCmlStdo7gkeg2T57xKZ0PEtwuTQlxcgHUFforzLrh-XDHrIYCTCV_dUVQOE621BjvNu5hjsyrUEv3PGHiEj-2gfQ6QKGMDcn56rHBtMEuLlxsUA2i34TGBm-vfHCnD8O7UpKCKdO6TByWW049pI"
  });
    var resbody=json.decode(res.body);
    print(resbody['data']['business_id']);
    return resbody['data']['business_id'];
  }

  static GetBusinessLocationsNames()async{
   var business_id= await GetBusinessId();
   var res =await http.get(Uri.parse('https://svpos.smartqr.app/connector/api/business-location'),
       headers: {
         "Accept": "application/json",
         "Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjYwODFjOWM5YWJjYzYyNGQxOWExZTBjMGJlMjQxYWE0Mjg5ZDRhODM0ZTNiNTU2NTlmZDRlNzNlNTMwODZhOWQzZWRlNjg3NzFhYjgxNTZjIn0.eyJhdWQiOiIxNSIsImp0aSI6IjYwODFjOWM5YWJjYzYyNGQxOWExZTBjMGJlMjQxYWE0Mjg5ZDRhODM0ZTNiNTU2NTlmZDRlNzNlNTMwODZhOWQzZWRlNjg3NzFhYjgxNTZjIiwiaWF0IjoxNjQ3MTc4MzcwLCJuYmYiOjE2NDcxNzgzNzAsImV4cCI6MTY3ODcxNDM3MCwic3ViIjoiMSIsInNjb3BlcyI6W119.K8ybAhe_nHNNwGbOfUx2V5-PO0ADxXFhB_szGlKEnd3L4CAD2pobrc50toQfByUUB98GXGRjkmzb7sQWO8MYz_X2qzUFmoQSzbQ_6rmJF1dF4E6SeWK7KhJYjy3aikEsOH5_sJAwuyQacXla0EnEGnV8Yv0XA0d85dmMCfZy7pGQf2AApkU3UHoFOq2AqnaNrJK6HgsVK4rkW-s4wuMdApd5y-CYIsWFQ9g1jGMU_WTFl7m152vuDpjCHtG-RbrnxRUdbdCqfK1buRVBZBwRNeCykCq9zAy3PtX3jUiV8qPLbGu1IhvALVGboDGmzfIsR61fDMuXXoRGYI32lVNm0MF7qEWV5DhNMigKFLGTS0dUgsga-1ETzzGCumhFYzGDr6gIGnUO4eZxHpwJy1BVIaaLKhzuO_ieiF-Jrbqtd3O51NNQqcpV8znW-gJi2KZkh2geeAvVUOK40nzlD5uXFGi5p0BYewzbziDLleWGizMuUEWNQBF13fPtNX9w4tFi2S3bl0drE5H9whQHz4Cs3vUTCmlStdo7gkeg2T57xKZ0PEtwuTQlxcgHUFforzLrh-XDHrIYCTCV_dUVQOE621BjvNu5hjsyrUEv3PGHiEj-2gfQ6QKGMDcn56rHBtMEuLlxsUA2i34TGBm-vfHCnD8O7UpKCKdO6TByWW049pI"
       });
   var resbody=json.decode(res.body);
   print('business location ${resbody}');
   var businessLocationName = resbody['data'][0]['name'];
   List<String> locationsnames= [];
   for(int i=0;i<resbody['data'].length;i++){
     if(resbody['data'][i]['business_id']==business_id){
     locationsnames.add(resbody['data'][i]['name']);
     print('list $locationsnames');
   }}

   return locationsnames;
  }




}