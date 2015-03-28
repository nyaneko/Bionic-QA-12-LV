function Main()

{
  GetFileName();
  FileCreation();
  TestScenario(); 
}


function GetFileName()

{
  // helps to change file path if needed
  return "C:\\Documents and Settings\\Tester\\Desktop\\FileForTesting.txt";
}


function FileCreation()

{   
  var FilePath, ToWrite, FileOpen, FileContent;
  FilePath = GetFileName();
  ToWrite = "Hello! This is a text file!";
  
  //deleteng the file if it was already created
  aqFileSystem.DeleteFile(FilePath);
  Log.Message("Creating a new file");
  //creating a text file and writing a text in it
  if (!aqFile.Exists(FilePath))
    aqFile.Create(FilePath);
  Log.Message("Writing to the file");  
  aqFile.WriteToTextFile(FilePath, ToWrite, aqFile.ctANSI, false);
  
  //reading from a file and closing it
  FileOpen = aqFile.OpenTextFile(FilePath, aqFile.faRead, aqFile.ctANSI);
  FileOpen.Cursor = 0;  
  
  Log.Message("Reading the file: the conclusion");
  FileContent = FileOpen.ReadAll();
    
  //comparing
  aqObject.CompareProperty(FileContent, 0, ToWrite, false);
  FileOpen.Close(); 
}

function TestScenario()

{ 
  var ToEdit, FilePath, FileEditing, NewContent, FileOpen, FileContent;
  ToEdit = "And here is the new content of the file.";  
  FilePath = GetFileName();  
  
  //opening the notepad
  TestedApps.notepad.Run();
  Delay(1000);
   
  //opening of a file, editing and closing
  FileEditing = aqFile.OpenTextFile(FilePath, aqFile.faReadWrite, aqFile.ctANSI);
  FileEditing.Write(ToEdit);
  NewContent = FileEditing.ReadAll();
  FileEditing.Close();
  
  Log.Message("File has been updated and closed");
 
  //closing the notepad
  TestedApps.notepad.Close();
  
  //opening the notepad
  TestedApps.notepad.Run();
  Delay(1000); 
  
  //reading from a file and closing it
  FileOpen = aqFile.OpenTextFile(FilePath, aqFile.faRead, aqFile.ctANSI);
  FileOpen.Cursor = 0;  
  Log.Message("Reading the file:");
  FileContent = FileOpen.ReadAll();
  Log.Message(FileContent);
  //FileOpen.Close();
  
  //closing the notepad
  TestedApps.notepad.Close();
  
  //comparing
  Log.Message("The conclusion:");
  aqObject.CompareProperty(FileContent, 0, NewContent, false);      
}