//+------------------------------------------------------------------+
//|                                                 auto_insert5.mq4 |
//|                        Copyright 2021, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict

extern string enable_1_day = 0;
extern string enable_8_hour = 0;
extern string enable_4_hour = 0;
extern string enable_1_hour = 0;
extern string enable_30_min = 1;
extern int overtime = 5;
extern string my_url = "http://localhost/";

int OnInit()
  {
//--- create timer
   EventSetTimer(1);//sec
   
//---
   return(INIT_SUCCEEDED);
  }
  
void OnTick()
  {
  
  }
void OnTimer()
{
  MqlDateTime dt_sturuct;
  TimeCurrent(dt_sturuct);
  
  
   // กำหนด URL ที่ต้องการส่งข้อมูลไปยัง
  string url = my_url;
  string cookie=NULL,headers;
  char post[],result[];
  int res;

    // สร้างข้อมูลที่ต้องการส่ง
  string date = TimeToString(TimeCurrent(),TIME_DATE);//dt_sturuct.year+"."+dt_sturuct.mon+"."+dt_sturuct.day;
  string time = TimeToString(TimeCurrent(),TIME_SECONDS);
  string sym = _Symbol;
  double open = iOpen(_Symbol,0,1);
  double high = iHigh(_Symbol,0,1);
  double low = iLow(_Symbol,0,1);
  double close = iClose(_Symbol,0,1);

  
  string data = "&symbol="+sym+"&open="+DoubleToString(open, 5)+"&high="+DoubleToString(high, 5)+"&low="+DoubleToString(low, 5)+"&close="+DoubleToString(close, 5);// + "," + IntegerToString(vol);

    // ส่งข้อมูลผ่าน HTTP GET Request
  //string request_url = url + "?data=" + data;
  string request_url = url + "insert/?" + data;
  //string request_url = "http://local680137346.3bbddns.com:31570/mt4/sent_data.php?data=1992.05.13,08:00:13,1987.65,1876.55,1666.66,1589.99,99";
  
  ResetLastError();
  int timeout=5000;
  //res=WebRequest("GET",request_url,cookie,NULL,timeout,post,0,result,headers);

    // แสดงผลลัพธ์จากการส่งข้อมูล
   
  //return result;
  
  Comment("TimeCurrent : "+TimeCurrent(dt_sturuct)+"|");

    if (dt_sturuct.sec<overtime || dt_sturuct.sec == NULL) // every 30 min
    //if (enable_30_min == 1 && dt_sturuct.min%30 == 0 && (dt_sturuct.sec == 0 || dt_sturuct.sec == NULL)) // every 30 min
    {  
     res=WebRequest("GET",request_url,cookie,NULL,timeout,post,0,result,headers);
     Print(res);
     Comment("TimeCurrent : "+TimeCurrent(dt_sturuct)+"|Sent to data Successfully! | "+request_url);
     Print("Sent to data Successfully!");
     Print(request_url);
     //Sleep(1000);      
    }
    if(res==-1)
     {
      Print("Error in WebRequest. Error code  =",GetLastError());
      //--- Perhaps the URL is not listed, display a message about the necessity to add the address
      MessageBox("Add the address '"+request_url+"' in the list of allowed URLs on tab 'Expert Advisors'","Error",MB_ICONINFORMATION);
     }
  
}
