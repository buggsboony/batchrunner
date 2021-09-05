program vbsrunner; 
  //slightly diffrent :
  // ansistring variable => interpreter:='wscript';
  // Must be compiled with FPC-Win (-wg)

uses windows,sysutils;

//get Executable full path
function getExecutableName():string;
var
AppFileName,buffer:array[0..260] of char;
begin
    //       StrPLCopy(AppFileName, ApplicationFileName, 15);
  //  GetModuleFileName(GetModuleHandle(AppFileName), Buffer, SizeOf(Buffer));
  GetModuleFileName(0,
  buffer,
  SizeOf(buffer)
  ); //r: 58
 
  getExecutableName:=ansistring(buffer);
end;






var directoryName,executableFullName,exeName,exeNameNoExt,executablePath:ansistring;
target,targetExt,arg,allargs:ansistring;
interpreter:ansistring;
//argList:TstringList;
i:integer;
begin
targetExt:='vbs';
interpreter:='wscript';



//Get Current executable informations
 executableFullName := getExecutableName();
   // writeln(executableFullName);
 exeName := ExtractFileName(executableFullName);
   // writeln(exeName);
   exeNameNoExt := changeFileExt(exeName,''); //inutile   
directoryName:=ExtractFileDir( executableFullName );
//Create Target information
target:=directoryName+PathDelim+exeNameNoExt+'.'+targetExt;
//writeln('Running target :',target); halt;

//Parse params
allargs:='';
// argList:=TstringList.Create;
// argList.delimiter:=' ';
// argList.delimitedText:=';';
  for i := 1 to ParamCount do begin
     // argList.Add(  ParamStr(i) );
     arg:=ParamStr(i);
     allargs+='"'+arg+'"';
     if( (i) < ParamCount ) then
     begin
         allargs+=' ';//space
     end;
     
   end;
 
//writeln( argList.Text);
//Run the process wscript!
   SysUtils.ExecuteProcess(interpreter,target+' '+allargs, []);
end.